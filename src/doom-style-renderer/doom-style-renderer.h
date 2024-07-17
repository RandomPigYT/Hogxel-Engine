#ifndef DOOM_STYLE_RENDERER_H
#define DOOM_STYLE_RENDERER_H

#include "util/dynamic_array.h"
#include "common/camera.h"

#include <cglm/include/cglm/cglm.h>
#include <stdint.h>

#define DSR_COLOUR(format, r, g, b, a)   \
  ({                                     \
    uint32_t colour = 0;                 \
                                         \
    colour |= (r) << (format).r_shift;   \
    colour |= (g) << (format).g_shift;   \
    colour |= (b) << (format).b_shift;   \
    if ((format).a_bits) {               \
      colour |= (a) << (format).a_shift; \
    }                                    \
                                         \
    colour;                              \
  })

#define DSR_PIXEL_AT(surface, pixels, x, y)                                 \
  *({                                                                       \
    assert((pixels) != NULL && "Null pixel buffer");                        \
                                                                            \
    uint32_t *pixel = (uint32_t *)(&(                                       \
      (uint8_t *)(pixels))[(y) * (surface)->stride +                        \
                           (x) * (surface)->pixel_format.bytes_per_pixel]); \
                                                                            \
    pixel;                                                                  \
  })

struct dsr_Pixel_format {
  uint8_t bits_per_pixel;
  uint8_t bytes_per_pixel;

  uint32_t r_mask;
  uint32_t g_mask;
  uint32_t b_mask;
  uint32_t a_mask;

  uint8_t r_bits;
  uint8_t g_bits;
  uint8_t b_bits;
  uint8_t a_bits;

  uint8_t r_shift;
  uint8_t g_shift;
  uint8_t b_shift;
  uint8_t a_shift;
};

struct dsr_Surface {
  uint32_t width, height;
  uint32_t stride; // In bytes

  struct dsr_Pixel_format pixel_format;

  void *pixels;
};

struct dsr_Wall {
  vec2 vertices[2];
  float height;
};

struct dsr_Scene {
  DA_TYPE(struct dsr_Wall) walls;
};

void dsr_render(struct dsr_Surface *surface, const struct dsr_Scene *scene,
                const struct hog_Camera *camera);

#endif // DOOM_STYLE_RENDERER_H
