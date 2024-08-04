#include "render-walls.h"

#include "doom-style-renderer.h"

#include <stdio.h>
#include <string.h>
#include <assert.h>

void dsr_render(struct dsr_Surface *surface, const struct dsr_Scene *scene,
                const struct hog_Camera *camera, int64_t current_sector) {
  assert(surface->pixel_format.bytes_per_pixel == 4 &&
         "Unsupported pixel format");

  mat4 view = GLM_MAT4_IDENTITY_INIT;
  glm_look((float *)camera->position, (float *)camera->direction,
           (vec3){ 0.0f, 1.0f, 0.0f }, view);

  vec2 proj_plane_size = { 0 };

  proj_plane_size[0] =
    tan(camera->fov * 0.5f) * camera->near_clipping_plane * 2;
  proj_plane_size[1] = proj_plane_size[0] / camera->aspect_ratio;

  //memset(surface->pixels, 0,
  //       surface->width * surface->height *
  //         surface->pixel_format.bytes_per_pixel);

  dsr_render_walls(surface, scene, camera, current_sector, proj_plane_size);
}
