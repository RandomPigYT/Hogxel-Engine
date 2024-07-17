#include "doom-style-renderer.h"

#include <stdio.h>
#include <string.h>
#include <assert.h>

void dsr_render(struct dsr_Surface *surface, const struct dsr_Scene *scene,
                const struct hog_Camera *camera) {
  (void)surface;
  (void)scene;
  (void)camera;

  uint32_t colour1 = DSR_COLOUR(surface->pixel_format, 255, 0, 0, 255);
  uint32_t colour2 = DSR_COLOUR(surface->pixel_format, 255, 0, 255, 255);

  for (uint32_t y = 0; y < surface->height; y++) {
    for (uint32_t x = 0; x < surface->width; x++) {
      if (x < surface->width * 0.5f && y < surface->height * 0.5f)
        DSR_PIXEL_AT(surface, surface->pixels, x, y) = colour1;
      else
        DSR_PIXEL_AT(surface, surface->pixels, x, y) = colour2;
    }
  }
}
