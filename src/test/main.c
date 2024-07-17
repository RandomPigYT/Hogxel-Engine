#include "doom-style-renderer/doom-style-renderer.h"
#include "util/dynamic_array.h"

#include <SDL/include/SDL3/SDL.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#define WIDTH 16
#define HEIGHT 9
#define FACTOR 60

#define COLOUR(format, r, g, b, a)       \
  ({                                     \
    uint32_t colour = 0;                 \
                                         \
    colour |= (r) << (format)->Rshift;   \
    colour |= (g) << (format)->Gshift;   \
    colour |= (b) << (format)->Bshift;   \
    if ((format)->Abits) {               \
      colour |= (a) << (format)->Ashift; \
    }                                    \
                                         \
    colour;                              \
  })

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

  int32_t width = 0;
  int32_t height = 0;
  SDL_GetWindowSizeInPixels(window, &width, &height);

  struct dsr_Surface s = {
    .width = width,
    .height = height,
    .stride = surface->pitch,

    .pixel_format = ({
      struct dsr_Pixel_format pf = {
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

      pf;
    }),

    .pixels = surface->pixels,
  };

  SDL_Event e;
  for (;;) {
    if (SDL_PollEvent(&e)) {
      if (e.type == SDL_EVENT_QUIT) {
        break;
      }

      if (e.type == SDL_EVENT_WINDOW_RESIZED ||
          e.type == SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED) {
        surface = SDL_GetWindowSurface(window);
        SDL_GetWindowSizeInPixels(window, &width, &height);
      }
    }

    SDL_UpdateWindowSurface(window);
  }

  SDL_DestroySurface(surface);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
