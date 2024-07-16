#ifndef DOOM_STYLE_RENDERER_H
#define DOOM_STYLE_RENDERER_H

#include <stdint.h>

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

struct dsr_Scene {
  /* ... */
};

void dsr_render(struct dsr_Surface *surface, struct dsr_Scene *scene);

#endif // DOOM_STYLE_RENDERER_H
