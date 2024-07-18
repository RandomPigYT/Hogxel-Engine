#include "doom-style-renderer/doom-style-renderer.h"
#include "util/dynamic_array.h"
#include "common/camera.h"

#include <SDL/include/SDL3/SDL.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#define WIDTH 16
#define HEIGHT 9
#define FACTOR 60

#define PLAYER_SPEED 5.0f
#define PLAYER_ANGULAR_SPEED 1.0f

enum direction {
  FORWARD,
  BACKWARDS,
  LEFT,
  RIGHT,
};

bool moving[4] = { 0 };
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
      struct dsr_Pixel_format pixel_format = {
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

int main(int argc, char **argv) {
  (void)argc;
  (void)argv;

  SDL_SetLogPriority(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO);

  if (SDL_Init(SDL_INIT_VIDEO) != 0) {
    SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Failed to initialize SDL: %s\n",
                 SDL_GetError());
    return EXIT_FAILURE;
  }

  SDL_Window *window = SDL_CreateWindow("test", WIDTH * FACTOR, HEIGHT * FACTOR,
                                        SDL_WINDOW_RESIZABLE);
  if (!window) {
    SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "Failed to create window: %s\n",
                 SDL_GetError());
    return EXIT_FAILURE;
  }

  SDL_Surface *surface = SDL_GetWindowSurface(window);
  const SDL_PixelFormatDetails *format =
    SDL_GetPixelFormatDetails(surface->format);

  SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION,
              "\nBits per pixel: %d\nBytes per pixel: %d\n"
              "Rmask: 0x%x\nGmask: 0x%x\nBmask: 0x%x\nAmask: 0x%x\n"
              "Rbits: %d\nGbits: %d\nBbits: %d\nAbits: %d\n"
              "Rshift: %d\nGshift: %d\nBshift: %d\nAshift: %d\n",
              format->bits_per_pixel, format->bytes_per_pixel, format->Rmask,
              format->Gmask, format->Bmask, format->Amask, format->Rbits,
              format->Gbits, format->Bbits, format->Abits, format->Rshift,
              format->Gshift, format->Bshift, format->Ashift);

  struct dsr_Surface dsr_surface = { 0 };
  update_dsr_surface(&dsr_surface, surface);

  vec4 dir = { 0.0f, 0.0f, 1.0f };
  glm_vec3_normalize(dir);

  struct hog_Camera cam = {
    .fov = M_PI / 2.0f,
    .aspect_ratio = (float)dsr_surface.width / (float)dsr_surface.height,

    .near_clipping_plane = 0.1f,
    .far_clipping_plane = 20,

    .position = { 0.0f, 3.0f, -5.0f },
    //.direction = { 0.0f, 0.0f, 1.0f },
    .direction = { dir[0], dir[1], dir[2] },

    .proj_type = HOG_PROJECTION_NONE,
  };

  struct dsr_Scene scene = {
    .walls = { 0 },
  };

  DA_APPEND(&scene.walls,
            ((struct dsr_Wall) {
              .vertices = { 
								{ -5.0f, 5.0f }, 
								{ 5.0f, 5.0f }, 
							}, 

							.height = 5.0f,
            }));

  //DA_APPEND(&scene.walls,
  //          ((struct dsr_Wall) {
  //            .vertices = {
  //							{ -5.0f, -5.0f },
  //							{ 5.0f, -5.0f },
  //						},

  //						.height = 5.0f,
  //          }));

  uint64_t current_count = SDL_GetPerformanceCounter();
  uint64_t prev_count = 0;
  double deltatime = 0;

  SDL_Event e;
  while (true) {
    prev_count = current_count;
    current_count = SDL_GetPerformanceCounter();

    deltatime = (double)(current_count - prev_count) /
                (double)SDL_GetPerformanceFrequency();

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

        if (e.key.key == SDLK_J && turning == -1) {
          turning = 0;
        }
        if (e.key.key == SDLK_L && turning == 1) {
          turning = 0;
        }
      }
    }

    if (moving[FORWARD]) {
      vec3 dir;
      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (moving[BACKWARDS]) {
      vec3 dir;
      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_negate(dir);
      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
    }

    if (moving[RIGHT]) {
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
      vec3 dir;
      glm_vec3_copy(cam.direction, dir);

      glm_vec3_normalize(dir);

      glm_vec3_cross(dir, (vec3){ 0.0f, 1.0f, 0.0f }, dir);
      glm_vec3_normalize(dir);
      glm_vec3_scale(dir, PLAYER_SPEED * deltatime, dir);

      glm_vec3_add(cam.position, dir, cam.position);
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
    dsr_render(&dsr_surface, &scene, &cam);

    SDL_UpdateWindowSurface(window);
  }

  SDL_DestroySurface(surface);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
