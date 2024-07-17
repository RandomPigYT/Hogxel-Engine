#include "doom-style-renderer.h"
#include "render-walls.h"
#include "util/dynamic_array.h"

#include <cglm/include/cglm/cglm.h>
#include <stdio.h>

static inline void get_world_coords(const vec2 map_coords, vec4 world_coords) {
  world_coords[0] = map_coords[0];
  world_coords[1] = 0.0f;
  world_coords[2] = map_coords[1];
  world_coords[3] = 1.0f;
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

static void draw_vertical_line(struct dsr_Surface *surface, uint32_t x,
                               uint32_t y1, uint32_t y2) {
}

void dsr_render_walls(struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera, mat4 view) {
  (void)surface;

  struct dsr_Wall *wall = &DA_AT(scene->walls, 0);
}
