#ifndef HOG_CAMERA_H
#define HOG_CAMERA_H

#include <cglm/include/cglm/cglm.h>

enum hog_Camera_projection_type {
  HOG_PROJECTION_NONE = 0,

  HOG_PERSPECTIVE_PROJECTION,
  HOG_ORTHOGRAPHIC_PROJECTION,
};

struct hog_Camera {
  float fov; // In radians
  float aspect_ratio;

  float near_clipping_plane;
  float far_clipping_plane;

  vec4 position;
  vec3 direction;

  enum hog_Camera_projection_type proj_type;
};

#endif // HOG_CAMERA_H
