#include "SDL/include/SDL3/SDL.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#define WIDTH 16
#define HEIGHT 9
#define FACTOR 60

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

  SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Bytes per pixel: %d\n",
              format->bytes_per_pixel);

  SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Must lock surface: %s\n",
              SDL_MUSTLOCK(surface) ? "true" : "false");

  int32_t width = WIDTH * FACTOR;
  int32_t height = HEIGHT * FACTOR;

  uint32_t bytes_per_pixel =
    SDL_GetPixelFormatDetails(surface->format)->bytes_per_pixel;

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

    for (int32_t y = 0; y < height; y++) {
      for (int32_t x = 0; x < width; x++) {
        ((uint8_t *)
           surface->pixels)[y * surface->pitch + x * bytes_per_pixel + 0] =
          (rand() / (float)RAND_MAX) * 255;
        ((uint8_t *)
           surface->pixels)[y * surface->pitch + x * bytes_per_pixel + 1] =
          (rand() / (float)RAND_MAX) * 255;
        ((uint8_t *)
           surface->pixels)[y * surface->pitch + x * bytes_per_pixel + 2] =
          (rand() / (float)RAND_MAX) * 255;
        ((uint8_t *)
           surface->pixels)[y * surface->pitch + x * bytes_per_pixel + 3] = 255;
      }
    }

    SDL_UpdateWindowSurface(window);
  }

  SDL_DestroySurface(surface);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
