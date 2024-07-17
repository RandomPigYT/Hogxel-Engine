#ifndef DSR_RENDER_WALLS_H
#define DSR_RENDER_WALLS_H

#include "doom-style-renderer.h"

void dsr_render_walls(struct dsr_Surface *surface,
                      const struct dsr_Scene *scene,
                      const struct hog_Camera *camera, mat4 view,
                      vec2 proj_plane_size);

#endif // DSR_RENDER_WALLS_H
