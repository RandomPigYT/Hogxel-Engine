#include "doom-style-renderer.h"
#include "util/dynamic_array.h"
#include "common/camera.h"
#include "util/thread_pool.h"
#include "util/arena.h"

#include <SDL/include/SDL3/SDL.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#define WIDTH 16
#define HEIGHT 9
#define FACTOR 60

#define PLAYER_SPEED 12.0f
#define PLAYER_ANGULAR_SPEED 3.5f

#define PAGE_SIZE 4096

enum direction {
  FORWARD = 0,
  BACKWARDS,
  LEFT,
  RIGHT,
  UP,
  DOWN,

  DIR_COUNT,
};

bool moving[DIR_COUNT] = { 0 };
int32_t turning = 0;

void update_dsr_surface(struct dsr_Surface *dsr_surface,
                        const SDL_Surface *sdl_surface) {
  const SDL_PixelFormatDetails *format =
    SDL_GetPixelFormatDetails(sdl_surface->format);

  struct dsr_Surface s = {
    .width = sdl_surface->w,
    .height = sdl_surface->h,
    .stride = sdl_surface->pitch,

    .pixel_format = ({
      struct dsr_PixelFormat pixel_format = {
        .bits_per_pixel = format->bits_per_pixel,
        .bytes_per_pixel = format->bytes_per_pixel,

        .r_mask = format->Rmask,
        .g_mask = format->Gmask,
        .b_mask = format->Bmask,
        .a_mask = format->Amask,

        .r_bits = format->Rbits,
        .g_bits = format->Gbits,
        .b_bits = format->Bbits,
        .a_bits = format->Abits,

        .r_shift = format->Rshift,
        .g_shift = format->Gshift,
        .b_shift = format->Bshift,
        .a_shift = format->Ashift,
      };

      pixel_format;
    }),

    .pixels = sdl_surface->pixels,
  };

  *dsr_surface = s;
}

static inline bool is_zero(float n, float eps) {
  return n < eps && n > -eps;
}

static bool intersect_line_segments(const vec4 line1[2], const vec4 line2[2],
                                    vec4 intersection) {
  vec2 p = { line1[0][0], line1[0][2] };
  vec2 q = { line2[0][0], line2[0][2] };

  vec2 r = {
    line1[1][0] - line1[0][0],
    line1[1][2] - line1[0][2],
  };

  vec2 s = {
    line2[1][0] - line2[0][0],
    line2[1][2] - line2[0][2],
  };

  float r_cross_s = glm_vec2_cross(r, s);
  if (is_zero(r_cross_s, DSR_FLT_EPSILON)) {
    intersection[0] = INFINITY;
    intersection[2] = INFINITY;

    return false;
  }

  vec2 q_sub_p;
  glm_vec2_sub(q, p, q_sub_p);

  float q_sub_p_cross_s = glm_vec2_cross(q_sub_p, s);
  float q_sub_p_cross_r = glm_vec2_cross(q_sub_p, r);

  float t = q_sub_p_cross_s / r_cross_s;
  float u = q_sub_p_cross_r / r_cross_s;

  if (!(t >= 0.0f && t <= 1.0f && u >= 0.0f && u <= 1.0f)) {
    intersection[0] = INFINITY;
    intersection[2] = INFINITY;

    return false;
  }

  intersection[0] = p[0] + r[0] * t;
  intersection[2] = p[1] + r[1] * t;

  return true;
}

int main(int argc, char **argv) {
  if (argc <= 1) {
    fprintf(stderr, "Bad usage\n");
    return EXIT_FAILURE;
  }

  char *scene_path = argv[1];

  SDL_SetLogPriority(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO);

  if (SDL_Init(SDL_INIT_VIDEO) != 0) {
    SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Failed to initialize SDL: %s\n",
                 SDL_GetError());
    return EXIT_FAILURE;
  }

  SDL_Window *window = SDL_CreateWindow("test", WIDTH * FACTOR, HEIGHT * FACTOR,
                                        SDL_WINDOW_RESIZABLE);
  //SDL_Window *window = SDL_CreateWindow("test", WIDTH * FACTOR, HEIGHT * FACTOR,
  //SDL_WINDOW_FULLSCREEN);
  if (!window) {
    SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Failed to create window: %s\n",
                 SDL_GetError());
    return EXIT_FAILURE;
  }

  SDL_Surface *surface = SDL_GetWindowSurface(window);

  struct dsr_Surface dsr_surface = { 0 };
  update_dsr_surface(&dsr_surface, surface);

  vec4 dir = { 0.0f, 0.0f, 1.0f };
  glm_vec3_normalize(dir);

  struct hog_Camera cam = {
    .fov = M_PI / 2.0f,
    .aspect_ratio = (float)dsr_surface.width / (float)dsr_surface.height,

    .near_clipping_plane = 0.1f,
    .far_clipping_plane = 100.0f,

    .position = { 0.0f, 5.0f, -5.0f },
    //.direction = { 0.0f, 0.0f, 1.0f },
    .direction = { dir[0], dir[1], dir[2] },

    .proj_type = HOG_PROJECTION_NONE,
  };

  struct dsr_Scene scene = {
    .walls = { 0 },
  };

  uint64_t current_count = SDL_GetPerformanceCounter();
  uint64_t prev_count = 0;
  double deltatime = 0;

  if (!dsr_load_scene(scene_path, &scene)) {
    SDL_DestroySurface(surface);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return EXIT_FAILURE;
  }

  struct tp_ThreadPool *pool = tp_create_pool(SDL_GetCPUCount() - 1);

  struct Arena arena = arena_create(PAGE_SIZE * 2);

  uint32_t curr_sector = 0;

  SDL_Event e;
  while (true) {
    prev_count = current_count;
    current_count = SDL_GetPerformanceCounter();

    deltatime = (double)(current_count - prev_count) /
                (double)SDL_GetPerformanceFrequency();

    //printf("FPS: %lf\n", 1.0f / deltatime);

    if (SDL_PollEvent(&e)) {
      if (e.type == SDL_EVENT_QUIT) {
        break;
      }

      if (e.type == SDL_EVENT_WINDOW_RESIZED ||
          e.type == SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED) {
        surface = SDL_GetWindowSurface(window);
        update_dsr_surface(&dsr_surface, surface);
        cam.aspect_ratio = (float)dsr_surface.width / (float)dsr_surface.height;
      }

      if (e.type == SDL_EVENT_KEY_DOWN) {
        if (e.key.key == SDLK_W) {
          moving[FORWARD] = true;
        }
        if (e.key.key == SDLK_A) {
          moving[LEFT] = true;
        }
        if (e.key.key == SDLK_S) {
          moving[BACKWARDS] = true;
        }
        if (e.key.key == SDLK_D) {
          moving[RIGHT] = true;
        }

        if (e.key.key == SDLK_SPACE) {
          moving[UP] = true;
        }
        if (e.key.key == SDLK_LSHIFT) {
          moving[DOWN] = true;
        }

        if (e.key.key == SDLK_J) {
          turning = -1;
        }
        if (e.key.key == SDLK_L) {
          turning = 1;
        }
      }

      if (e.type == SDL_EVENT_KEY_UP) {
        if (e.key.key == SDLK_W) {
          moving[FORWARD] = false;
        }
        if (e.key.key == SDLK_A) {
          moving[LEFT] = false;
        }
        if (e.key.key == SDLK_S) {
          moving[BACKWARDS] = false;
        }
        if (e.key.key == SDLK_D) {
          moving[RIGHT] = false;
        }

        if (e.key.key == SDLK_SPACE) {
          moving[UP] = false;
        }
        if (e.key.key == SDLK_LSHIFT) {
          moving[DOWN] = false;
        }

        if (e.key.key == SDLK_J && turning == -1) {
          turning = 0;
        }
        if (e.key.key == SDLK_L && turning == 1) {
          turning = 0;
        }
      }
    }

    vec3 prev_pos;
    glm_vec3_copy(cam.position, prev_pos);

    bool is_moving = false;
    if (moving[FORWARD]) {
      is_moving = true;

      vec3 dir;

      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (moving[BACKWARDS]) {
      is_moving = true;

      vec3 dir;

      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_negate(dir);
      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (moving[RIGHT]) {
      is_moving = true;

      vec3 dir;

      glm_vec3_copy(cam.direction, dir);

      glm_vec3_negate(dir);

      glm_vec3_normalize(dir);

      glm_vec3_cross(dir, (vec3){ 0.0f, 1.0f, 0.0f }, dir);
      glm_vec3_normalize(dir);
      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (moving[LEFT]) {
      is_moving = true;

      vec3 dir;

      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_cross(dir, (vec3){ 0.0f, 1.0f, 0.0f }, dir);
      glm_vec3_normalize(dir);
      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (is_moving) {
      auto sector = &DA_AT(scene.sectors, curr_sector);
      for (uint32_t j = 0; j < sector->walls.count; j++) {
        auto wall = &DA_AT(scene.walls, DA_AT(sector->walls, j));
        if (!wall->is_portal) {
          continue;
        }

        vec4 l1[2] = {
          {
            [0] = DA_AT(scene.vertices, wall->vertices[0])[0],
            [2] = DA_AT(scene.vertices, wall->vertices[0])[1],
          },

          {
            [0] = DA_AT(scene.vertices, wall->vertices[1])[0],
            [2] = DA_AT(scene.vertices, wall->vertices[1])[1],
          },
        };

        vec4 l2[2] = {
          {
            [0] = cam.position[0],
            [2] = cam.position[2],
          },

          {
            [0] = prev_pos[0],
            [2] = prev_pos[2],
          },
        };

        vec4 inter;
        if (intersect_line_segments(l1, l2, inter)) {
          curr_sector = wall->shared_with[0] != curr_sector
                          ? wall->shared_with[0]
                          : wall->shared_with[1];

          goto Break;
        }
      }
    }

Break:

    if (moving[UP]) {
      cam.position[1] += PLAYER_SPEED * deltatime;
    }

    if (moving[DOWN]) {
      cam.position[1] -= PLAYER_SPEED * deltatime;
    }

    if (turning != 0) {
      mat4 rot = GLM_MAT4_IDENTITY_INIT;
      glm_rotate(rot, turning * PLAYER_ANGULAR_SPEED * deltatime,
                 (vec3){ 0.0f, 1.0f, 0.0f });

      vec4 temp;
      glm_vec3_copy(cam.direction, temp);
      temp[3] = 1.0f;

      vec4 res;
      glm_mat4_mulv_sse2(rot, temp, res);

      glm_vec3_copy(res, cam.direction);
    }

    //glm_vec3_print(cam.position, stdout);
    if (scene.sectors.count > 0) {
      ArenaSaveState r;
      arena_save(arena, &r);

      //dsr_render(&arena, &dsr_surface, &scene, &cam, 0);
      dsr_render_multithreaded(&arena, pool, &dsr_surface, &scene, &cam,
                               curr_sector);

      arena_restore(&arena, r);
    }

    SDL_UpdateWindowSurface(window);
  }

  tp_free_pool(pool);
  arena_free(&arena);

  SDL_DestroySurface(surface);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
