#ifndef DSR_RENDER_WALLS_H
#define DSR_RENDER_WALLS_H

#include "doom-style-renderer.h"

void dsr_render_walls(struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera, mat4 view);

#endif // DSR_RENDER_WALLS_H
