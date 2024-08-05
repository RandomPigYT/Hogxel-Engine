#include "render-walls.h"
#include "doom-style-renderer.h"
#include "util/dynamic_array.h"
#include "util/thread_pool.h"

#include <cglm/include/cglm/cglm.h>

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

struct Portal {
  uint32_t sector_index;
  uint32_t through;
  int32_t screen_space[4][2];
};

struct PortalQueue {
  DA_TYPE(struct Portal) portals;
};

struct WallSection {
  struct dsr_Surface *surface;
  const struct hog_Camera *camera;

  int32_t screen_space[4][2];
  int32_t x1, x2, z1, z2; // Range of the entire wall

  int32_t x_range[2]; // Range of wall section
  int32_t sign;

  uint8_t colour[4];
};

static inline void get_world_coords(const vec2 map_coords, vec4 world_coords) {
  world_coords[0] = map_coords[0];
  world_coords[1] = 0.0f;
  world_coords[2] = map_coords[1];
  world_coords[3] = 1.0f;
}

static inline void get_relative_coords(const struct hog_Camera *camera,
                                       const vec4 world_coords,
                                       vec4 relative_coords) {
  glm_vec3_sub((float *)world_coords, (float *)camera->position,
               relative_coords);
  relative_coords[3] = 1.0f;

  float theta = atan2(camera->direction[0], camera->direction[2]);
  mat4 rotate = GLM_MAT4_IDENTITY_INIT;
  glm_rotate(rotate, -theta, (vec3){ 0.0f, 1.0f, 0.0f });

  vec4 temp;
  glm_mat4_mulv_sse2(rotate, relative_coords, temp);

  glm_vec4_copy(temp, relative_coords);
}

static inline float x_projection(const struct hog_Camera *camera,
                                 vec4 relative_coords) {
  //printf("relative: %f\n", relative_coords[2]);
  return relative_coords[0] * camera->near_clipping_plane / relative_coords[2];
}

static inline void y_projection(const struct hog_Camera *camera,
                                const vec4 relative_coords, float floor_height,
                                float ceil_height, vec2 projected) {
  float depth = relative_coords[2];
  float cam_height = camera->position[1];

  projected[0] = ceil_height - cam_height;
  projected[1] = floor_height - cam_height;

  glm_vec2_divs(projected, depth, projected);
  glm_vec2_scale(projected, camera->near_clipping_plane, projected);
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

static bool clipped_wall_positions(const vec4 relative_coords[2],
                                   const struct hog_Camera *camera,
                                   vec4 clipped[2]) {
  glm_vec4_copy((float *)relative_coords[0], clipped[0]);
  glm_vec4_copy((float *)relative_coords[1], clipped[1]);

  // Clip by near clipping plane

  //printf("Clipped before: \n");
  //glm_vec4_print(clipped[0], stdout);
  //glm_vec4_print(clipped[1], stdout);
  if (clipped[0][2] < camera->near_clipping_plane) {
    vec4 dir;
    glm_vec4_sub((float *)clipped[0], (float *)clipped[1], dir);

    if (is_zero(dir[2], DSR_FLT_EPSILON)) {
      return false;
    }

    float t = (camera->near_clipping_plane - clipped[1][2]) / dir[2];

    clipped[0][2] = camera->near_clipping_plane;
    clipped[0][0] = clipped[1][0] + dir[0] * t;

    //glm_vec4_print(clipped[0], stdout);

  } else if (clipped[1][2] < camera->near_clipping_plane) {
    vec4 dir;
    glm_vec4_sub((float *)clipped[1], (float *)clipped[0], dir);

    if (is_zero(dir[2], DSR_FLT_EPSILON)) {
      return false;
    }

    float t = (camera->near_clipping_plane - clipped[0][2]) / dir[2];

    clipped[1][2] = camera->near_clipping_plane;
    clipped[1][0] = clipped[0][0] + dir[0] * t;
  }

  // Clip by far clipping plane

  if (clipped[0][2] > camera->far_clipping_plane) {
    vec4 dir;
    glm_vec4_sub((float *)clipped[0], (float *)clipped[1], dir);

    if (is_zero(dir[2], DSR_FLT_EPSILON)) {
      return false;
    }

    float t = (camera->far_clipping_plane - clipped[1][2]) / dir[2];

    clipped[0][2] = camera->far_clipping_plane;
    clipped[0][0] = clipped[1][0] + dir[0] * t;

  } else if (clipped[1][2] > camera->far_clipping_plane) {
    vec4 dir;
    glm_vec4_sub((float *)clipped[1], (float *)clipped[0], dir);

    if (is_zero(dir[2], DSR_FLT_EPSILON)) {
      return false;
    }

    float t = (camera->far_clipping_plane - clipped[0][2]) / dir[2];

    clipped[1][2] = camera->far_clipping_plane;
    clipped[1][0] = clipped[0][0] + dir[0] * t;
  }

  // Clip by view frustum

  vec2 thetas = {
    atan2(clipped[0][0], clipped[0][2]),
    atan2(clipped[1][0], clipped[1][2]),
  };

  if ((thetas[0] > camera->fov * 0.5f && thetas[1] > camera->fov * 0.5f) ||
      (thetas[0] < -camera->fov * 0.5f && thetas[1] < -camera->fov * 0.5f)) {
    return false;
  }

  vec4 intersections[2] = { 0 };
  bool intersected[2] = { 0 };

  float half_far_clipping_plane_length =
    camera->far_clipping_plane * tan(camera->fov * 0.5f);

  vec4 fov_boundary[4] = {
    { 0.0f, 0.0, 0.0f, 0.0f },
    { half_far_clipping_plane_length, 0.0f, camera->far_clipping_plane, 0.0f },
    { 0.0f, 0.0, 0.0f, 0.0f },
    { -half_far_clipping_plane_length, 0.0f, camera->far_clipping_plane, 0.0f },
  };

  intersected[0] =
    intersect_line_segments(clipped, fov_boundary, intersections[0]);
  intersected[1] =
    intersect_line_segments(clipped, fov_boundary + 2, intersections[1]);

  //printf("Intersections: \n");
  //glm_vec4_print(intersections[0], stdout);
  //glm_vec4_print(intersections[1], stdout);

  vec4 dv;
  glm_vec4_sub(clipped[1], clipped[0], dv);
  //printf("dv: \n");
  //glm_vec4_print(dv, stdout);

  if (intersected[0]) {
    if (thetas[0] <= thetas[1]) {
      glm_vec4_copy(intersections[0], clipped[1]);
      //printf("1. Copied to 2\n");

    } else {
      glm_vec4_copy(intersections[0], clipped[0]);
      //printf("1. Copied to 1\n");
    }
  }

  if (intersected[1]) {
    if (thetas[0] <= thetas[1]) {
      glm_vec4_copy(intersections[1], clipped[0]);
      //printf("2. Copied to 1\n");

    } else {
      glm_vec4_copy(intersections[1], clipped[1]);
      //printf("2. Copied to 2\n");
    }
  }
  //printf("Intersected: %d %d\n", intersected[0], intersected[1]);

  //printf("Clipped: \n");
  //glm_vec4_print(clipped[0], stdout);
  //glm_vec4_print(clipped[1], stdout);

  return true;
}

static inline int32_t int_clamp(int32_t val, int32_t min_val, int32_t max_val) {
  if (val < min_val) {
    return min_val;

  } else if (val > max_val) {
    return max_val;

  } else {
    return val;
  }
}

static void draw_vertical_line(struct dsr_Surface *surface, int32_t x,
                               int32_t y1, int32_t y2, uint8_t colour[4]) {
  if (x < 0 || x >= surface->width)
    return;

  if (y2 < y1) {
    int32_t temp = y1;
    y1 = y2;
    y2 = temp;
  }

  y1 = int_clamp(y1, 0, surface->height - 1);
  y2 = int_clamp(y2, 0, surface->height - 1);
  for (int32_t y = y1; y <= y2; y++) {
    DSR_PIXEL_AT(surface, surface->pixels, x, y) = DSR_COLOUR(
      surface->pixel_format, colour[0], colour[1], colour[2], colour[3]);
  }
}

static inline void to_screen_space(const struct dsr_Surface *surface,
                                   const vec2 projected,
                                   const vec2 proj_plane_size,
                                   int32_t screen_space[2]) {
  assert(proj_plane_size[0] > 0 && proj_plane_size[1] > 0);

  screen_space[0] =
    lround(((projected[0] / proj_plane_size[0]) + 0.5f) * (surface->width - 1));

  screen_space[1] =
    lround((1.0f - ((projected[1] / proj_plane_size[1]) + 0.5f)) *
           (surface->height - 1));
}

static void *draw_wall_section(struct WallSection *params) {
  int32_t l = params->x2 - params->x1;
  for (int32_t x = params->x_range[0]; x <= params->x_range[1]; x++) {
    float t = (float)(x - params->x1) / (float)l;

    float depth_lerp =
      glm_lerp(params->z1, params->z2, t) / params->camera->far_clipping_plane;

    if (params->sign < 0) {
      t = 1.0f - t;
    }

    int32_t y1 = lround(
      glm_lerp(params->screen_space[0][1], params->screen_space[3][1], t));
    int32_t y2 = lround(
      glm_lerp(params->screen_space[1][1], params->screen_space[2][1], t));

    uint8_t c[4] = {
      glm_lerp(params->colour[0] / 255.0f, 0.0f, depth_lerp) * 255.0f,
      glm_lerp(params->colour[1] / 255.0f, 0.0f, depth_lerp) * 255.0f,
      glm_lerp(params->colour[2] / 255.0f, 0.0f, depth_lerp) * 255.0f,
      255,
    };

    draw_vertical_line(params->surface, x, y1, y2, c);
    draw_vertical_line(params->surface, x, 0, y1,
                       (uint8_t[4]){ 35, 35, 35, 255 });
    draw_vertical_line(params->surface, x, y2, params->surface->height - 1,
                       (uint8_t[4]){ 100, 24, 24, 255 });
  }

  free(params);
  return NULL;
}

struct RenderWallArgs {
  struct dsr_Surface *surface;
  const struct dsr_Scene *scene;

  const struct hog_Camera *camera;
  const vec2 proj_plane_size;

  struct tp_ThreadPool *pool;

  uint32_t cam_sector_index;
  uint32_t drawing_sector_index;

  uint32_t wall_index;
  uint8_t wall_colour[4];

  struct PortalQueue portal_queue;
};

static void render_wall(struct RenderWallArgs *args) {
  (void)args->cam_sector_index;

  struct dsr_Wall *wall = &DA_AT(args->scene->walls, args->wall_index);

  vec4 wall_world_coords[2] = { 0 };
  get_world_coords(DA_AT(args->scene->vertices, wall->vertices[0]),
                   wall_world_coords[0]);
  get_world_coords(DA_AT(args->scene->vertices, wall->vertices[1]),
                   wall_world_coords[1]);

  vec4 relative_coords[2] = { 0 };
  get_relative_coords(args->camera, wall_world_coords[0], relative_coords[0]);
  get_relative_coords(args->camera, wall_world_coords[1], relative_coords[1]);

  if (relative_coords[0][2] < args->camera->near_clipping_plane &&
      relative_coords[1][2] < args->camera->near_clipping_plane) {
    return;

  } else if (relative_coords[0][2] > args->camera->far_clipping_plane &&
             relative_coords[1][2] > args->camera->far_clipping_plane) {
    return;
  }

  vec4 clipped_coords[2] = { 0 };
  if (!clipped_wall_positions(relative_coords, args->camera, clipped_coords)) {
    return;
  }

  // Counter-clockwise
  vec2 projected[4] = { 0 };
  vec2 projected_x = {
    x_projection(args->camera, clipped_coords[0]),
    x_projection(args->camera, clipped_coords[1]),
  };

  {
    struct dsr_Sector *s =
      &DA_AT(args->scene->sectors, args->drawing_sector_index);
    vec2 temp = { 0 };
    y_projection(args->camera, clipped_coords[0], s->floor_height,
                 s->ceil_height, temp);

    projected[0][0] = projected_x[0];
    projected[0][1] = temp[0];

    projected[1][0] = projected_x[0];
    projected[1][1] = temp[1];
  }

  {
    struct dsr_Sector *s =
      &DA_AT(args->scene->sectors, args->drawing_sector_index);
    vec2 temp = { 0 };
    y_projection(args->camera, clipped_coords[1], s->floor_height,
                 s->ceil_height, temp);

    projected[2][0] = projected_x[1];
    projected[2][1] = temp[1];

    projected[3][0] = projected_x[1];
    projected[3][1] = temp[0];
  }

  //printf("Projected: \n");
  for (uint32_t i = 0; i < 4; i++) {
    //glm_vec2_print(projected[i], stdout);
  }

  int32_t screen_space[4][2] = { 0 };
  //printf("Screen space: \n");
  for (uint32_t i = 0; i < 4; i++) {
    to_screen_space(args->surface, projected[i], args->proj_plane_size,
                    screen_space[i]);
  }

  if (wall->is_portal) {
    struct Portal p = { 0 };

    assert(wall->shared_count <= 2);

    p.sector_index = wall->shared_with[0] != args->drawing_sector_index
                       ? wall->shared_with[0]
                       : wall->shared_with[1];

    p.through = args->wall_index;
    memcpy(p.screen_space, screen_space, sizeof(screen_space));

    DA_APPEND(&args->portal_queue.portals, p);
  }

  //printf("\n");
  //printf("======================================================\n");
  //printf("\n");

  //draw_vertical_line(surface, screen_space[0][0], screen_space[0][1],
  //                   screen_space[1][1], (uint8_t[]){ 255, 0, 0, 255 });
  //draw_vertical_line(surface, screen_space[2][0], screen_space[2][1],
  //                     screen_space[3][1], (uint8_t[]){ 255, 0, 0, 255 });

  int32_t x1, x2, z1, z2;
  if (screen_space[2][0] >= screen_space[0][0]) {
    x1 = screen_space[0][0];
    z1 = clipped_coords[0][2];
    x2 = screen_space[2][0];
    z2 = clipped_coords[1][2];
  } else {
    x1 = screen_space[2][0];
    z1 = clipped_coords[1][2];
    x2 = screen_space[0][0];
    z2 = clipped_coords[0][2];
  }

  int32_t l = x2 - x1;

  int32_t sign = glm_sign(screen_space[2][0] - screen_space[0][0]);

  if (args->pool == NULL) {
    struct WallSection *tmp = malloc(sizeof(*tmp));

    *tmp = (struct WallSection){
      .surface = args->surface,
      .camera = args->camera,

      .x1 = x1,
      .z1 = z1,
      .x2 = x2,
      .z2 = z2,

      .x_range = { x1, x2 },

      .sign = sign,
    };

    memcpy(tmp->screen_space, screen_space, sizeof(screen_space));
    memcpy(tmp->colour, args->wall_colour, 4 * sizeof(*args->wall_colour));

    draw_wall_section(tmp);

  } else {
    uint32_t num_batches = args->pool->count;
    uint32_t section_size = l / num_batches;

    DA_TYPE(tp_JobHandle) handles = { 0 };

    for (uint32_t i = 0; i < num_batches; i++) {
      struct WallSection *tmp = malloc(sizeof(*tmp));

      *tmp = (struct WallSection){
        .surface = args->surface,
        .camera = args->camera,

        .x1 = x1,
        .z1 = z1,
        .x2 = x2,
        .z2 = z2,

        .sign = sign,
      };

      memcpy(tmp->screen_space, screen_space, sizeof(screen_space));
      memcpy(tmp->colour, args->wall_colour, 4 * sizeof(*args->wall_colour));

      tmp->x_range[0] = glm_imin(x1 + i * section_size, x2);
      tmp->x_range[1] = glm_imax(tmp->x_range[0] + section_size - 1, x2);

      tp_JobHandle handle =
        tp_add_job(args->pool, (tp_JobCallback)draw_wall_section, tmp);
      DA_APPEND(&handles, handle);
    }

    for (uint32_t i = 0; i < handles.count; i++) {
      tp_wait_job(args->pool, DA_AT(handles, i));
    }

    DA_FREE(&handles);
  }
}

void dsr_render_walls(struct tp_ThreadPool *pool, struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera, int64_t current_sector,
                      vec2 proj_plane_size) {
  srand((int)6942080085);
  for (int32_t i = 0; i < rand() % 100; i++) {
    rand();
  }
  DA_TYPE_ARRAY(uint8_t, 4) palette = { 0 };
  for (uint32_t i = 0; i < scene->walls.count; i++) {
    DA_APPEND_NO_ASSIGN(&palette);
    DA_AT(palette, palette.count - 1)
    [0] = ((float)rand() / (float)RAND_MAX) * 255.0f;
    DA_AT(palette, palette.count - 1)
    [1] = ((float)rand() / (float)RAND_MAX) * 255.0f;
    DA_AT(palette, palette.count - 1)
    [2] = ((float)rand() / (float)RAND_MAX) * 255.0f;
    DA_AT(palette, palette.count - 1)[3] = 255;
  }

  struct RenderWallArgs render_wall_args = {
    .surface = surface,
    .scene = scene,

    .camera = camera,
    .proj_plane_size = { proj_plane_size[0], proj_plane_size[1] },

    .pool = pool,

    .cam_sector_index = current_sector,
  };

  for (uint32_t i = 0; i < scene->sectors.count; i++) {
    struct dsr_Sector *sector = &DA_AT(scene->sectors, i);
    for (uint32_t j = 0; j < sector->walls.count; j++) {
      uint32_t wall_index = DA_AT(sector->walls, j);

      struct hog_Camera temp_cam = *camera;

      glm_vec3_add(
        temp_cam.position,
        (vec3){ 0.0f,
                DA_AT(scene->sectors, (uint32_t)current_sector).floor_height,
                0.0f },
        temp_cam.position);

      uint8_t colour[4] = {
        DA_AT(palette, wall_index)[0],
        DA_AT(palette, wall_index)[1],
        DA_AT(palette, wall_index)[2],
        255,
      };

      render_wall_args.drawing_sector_index = i;
      render_wall_args.wall_index = wall_index;
      render_wall_args.camera = &temp_cam;
      memcpy(render_wall_args.wall_colour, colour, sizeof(colour));

      // dsr_render_wall(pool, surface, scene, current_sector, i, wall_index,
      // &temp_cam, proj_plane_size, colour, &portal_queue);

      render_wall(&render_wall_args);
    }
  }

  DA_FREE(&palette);
  DA_FREE(&render_wall_args.portal_queue.portals);
}
