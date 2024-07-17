#include "doom-style-renderer.h"
#include "render-walls.h"
#include "util/dynamic_array.h"

#include <cglm/include/cglm/cglm.h>
#include <stdio.h>
#include <complex.h>

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
  return relative_coords[0] * camera->near_clipping_plane / relative_coords[2];
}

static inline void y_projection(const struct hog_Camera *camera,
                                const vec4 relative_coords, float wall_height,
                                vec2 projected) {
  float depth = relative_coords[2];
  float cam_height = camera->position[1];

  projected[0] = wall_height - cam_height;
  projected[1] = -cam_height;

  glm_vec2_divs(projected, depth, projected);
  glm_vec2_scale(projected, camera->near_clipping_plane, projected);
}

static void clipped_wall_positions(const struct dsr_Wall *wall,
                                   struct hog_Camera *camera) {
}

static void draw_vertical_line(struct dsr_Surface *surface, uint32_t x,
                               uint32_t y1, uint32_t y2, uint8_t colour[4]) {
  if (y2 < y1) {
    uint32_t temp = y1;
    y1 = y2;
    y2 = temp;
  }

  for (uint32_t y = y1; y <= y2; y++) {
    DSR_PIXEL_AT(surface, surface->pixels, x, y) = DSR_COLOUR(
      surface->pixel_format, colour[0], colour[1], colour[2], colour[3]);
  }
}

static inline void to_screen_space(const struct dsr_Surface *surface,
                                   const vec2 projected, vec2 proj_plane_size,
                                   uint32_t screen_space[2]) {
  assert(proj_plane_size[0] > 0 && proj_plane_size[1] > 0);

  screen_space[0] =
    lround(glm_clamp((projected[0] / proj_plane_size[0]) + 0.5f, 0.0f, 1.0f) *
           (surface->width - 1));

  screen_space[1] = lround(
    (1.0f - glm_clamp((projected[1] / proj_plane_size[1]) + 0.5f, 0.0f, 1.0f)) *
    (surface->height - 1));
}

void dsr_render_walls(struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera, mat4 view,
                      vec2 proj_plane_size) {
  struct dsr_Wall *wall = &DA_AT(scene->walls, 0);

  vec4 wall_world_coords[2] = { 0 };
  get_world_coords(wall->vertices[0], wall_world_coords[0]);
  get_world_coords(wall->vertices[1], wall_world_coords[1]);

  vec4 relative_coords[2] = { 0 };
  get_relative_coords(camera, wall_world_coords[0], relative_coords[0]);
  get_relative_coords(camera, wall_world_coords[1], relative_coords[1]);

  // Counter-clockwise
  vec2 projected[4] = { 0 };
  vec2 projected_x = {
    x_projection(camera, relative_coords[0]),
    x_projection(camera, relative_coords[1]),
  };

  {
    vec2 temp = { 0 };
    y_projection(camera, relative_coords[0], wall->height, temp);

    projected[0][0] = projected_x[0];
    projected[0][1] = temp[0];

    projected[1][0] = projected_x[0];
    projected[1][1] = temp[1];
  }

  {
    vec2 temp = { 0 };
    y_projection(camera, relative_coords[1], wall->height, temp);

    projected[2][0] = projected_x[1];
    projected[2][1] = temp[1];

    projected[3][0] = projected_x[1];
    projected[3][1] = temp[0];
  }

  uint32_t screen_space[4][2] = { 0 };
  for (uint32_t i = 0; i < 4; i++) {
    to_screen_space(surface, projected[i], proj_plane_size, screen_space[i]);
  }

  //draw_vertical_line(surface, screen_space[0][0], screen_space[0][1],
  //                   screen_space[1][1], (uint8_t[]){ 255, 0, 0, 255 });
  //draw_vertical_line(surface, screen_space[2][0], screen_space[2][1],
  //                     screen_space[3][1], (uint8_t[]){ 255, 0, 0, 255 });

  uint32_t l = screen_space[2][0] - screen_space[0][0];
  for (uint32_t x = screen_space[0][0]; x < screen_space[2][0]; x++) {
    float t = (float)(x - screen_space[0][0]) / (float)l;

    uint32_t y1 = lround(glm_lerp(screen_space[0][1], screen_space[3][1], t));
    uint32_t y2 = lround(glm_lerp(screen_space[1][1], screen_space[2][1], t));

    draw_vertical_line(surface, x, y1, y2, (uint8_t[]){ 255, 0, 0, 255 });
  }
}
