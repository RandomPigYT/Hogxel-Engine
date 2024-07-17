#include "doom-style-renderer.h"

#include <stdio.h>

void dsr_render(const struct dsr_Surface *surface,
                const struct dsr_Scene *scene,
                const struct hog_Camera *camera) {
  (void)surface;
  (void)scene;
  (void)camera;

  printf("Hello from doom\n");
}
