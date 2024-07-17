#include "doom-style-renderer/doom-style-renderer.h"
#include "util/dynamic_array.h"
#include "common/camera.h"

#include <SDL/include/SDL3/SDL.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#define WIDTH 16
#define HEIGHT 9
#define FACTOR 60

void update_dsr_surface(struct dsr_Surface *dsr_surface,
                        const SDL_Surface *sdl_surface) {
  const SDL_PixelFormatDetails *format =
    SDL_GetPixelFormatDetails(sdl_surface->format);

  struct dsr_Surface s = {
    .width = sdl_surface->w,
    .height = sdl_surface->h,
    .stride = sdl_surface->pitch,

    .pixel_format = ({
      struct dsr_Pixel_format pixel_format = {
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

      pixel_format;
    }),

    .pixels = sdl_surface->pixels,
  };

  *dsr_surface = s;
}

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

  struct dsr_Surface dsr_surface = { 0 };
  update_dsr_surface(&dsr_surface, surface);

  struct hog_Camera cam = {
    .fov = M_PI / 2.0f,
    .aspect_ratio = (float)dsr_surface.width / (float)dsr_surface.height,

    .near_clipping_plane = 0.1f,
    .far_clipping_plane = 20,

    .position = { 0.0f, 1.0f, 0.0f },
    .direction = { 0.0f, 0.0f, 1.0f },

    .proj_type = HOG_PROJECTION_NONE,
  };

  struct dsr_Scene scene = {
    .walls = { 0 },
  };

  DA_APPEND(&scene.walls,
            ((struct dsr_Wall) {
              .vertices = { 
								{ -3.0f, 5.0f }, 
								{ 2.0f, 4.0f }, 
							}, 

							.height = 3.0f,
            }));

  SDL_Event e;
  for (;;) {
    if (SDL_PollEvent(&e)) {
      if (e.type == SDL_EVENT_QUIT) {
        break;
      }

      if (e.type == SDL_EVENT_WINDOW_RESIZED ||
          e.type == SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED) {
        surface = SDL_GetWindowSurface(window);
        update_dsr_surface(&dsr_surface, surface);
        cam.aspect_ratio = (float)dsr_surface.width / (float)dsr_surface.height;
      }
    }

    dsr_render(&dsr_surface, &scene, &cam);

    SDL_UpdateWindowSurface(window);
  }

  SDL_DestroySurface(surface);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}
