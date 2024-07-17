#include "doom-style-renderer.h"
#include "render-walls.h"

#include <stdio.h>
#include <string.h>
#include <assert.h>

void dsr_render(struct dsr_Surface *surface, const struct dsr_Scene *scene,
                const struct hog_Camera *camera) {
  assert(surface->pixel_format.bytes_per_pixel == 4 &&
         "Unsupported pixel format");

  // uint32_t colour1 = DSR_COLOUR(surface->pixel_format, 255, 0, 0, 255);
  // uint32_t colour2 = DSR_COLOUR(surface->pixel_format, 0, 0, 0, 255);

  // for (uint32_t y = 0; y < surface->height; y++) {
  //   for (uint32_t x = 0; x < surface->width; x++) {
  //     if (x < surface->width * 0.5f && y < surface->height * 0.5f)
  //       DSR_PIXEL_AT(surface, surface->pixels, x, y) = colour1;
  //     else
  //       DSR_PIXEL_AT(surface, surface->pixels, x, y) = colour2;
  //   }
  // }

  mat4 view = GLM_MAT4_IDENTITY_INIT;
  glm_look((float *)camera->position, (float *)camera->direction,
           (vec3){ 0.0f, 1.0f, 0.0f }, view);

  vec2 proj_plane_size = { 0 };

  proj_plane_size[0] =
    tan(camera->fov * 0.5f) * camera->near_clipping_plane * 2;
  proj_plane_size[1] = proj_plane_size[0] / camera->aspect_ratio;

  dsr_render_walls(surface, scene, camera, view, proj_plane_size);
}
