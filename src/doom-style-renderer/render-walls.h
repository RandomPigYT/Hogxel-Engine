#ifndef DSR_RENDER_WALLS_H
#define DSR_RENDER_WALLS_H

#include "doom-style-renderer.h"

void dsr_render_walls(const struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera);

#endif // DSR_RENDER_WALLS_H
