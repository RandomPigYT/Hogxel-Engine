#include "doom-style-renderer.h"

#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

bool dsr_load_scene(const char *scene_path, struct dsr_Scene *scene) {
  (void)scene;
  char *scene_src = fio_read_file(scene_path);
  if (!scene_src) {
    return false;
  }

  printf("Scene: \n%s\n", scene_src);

  free(scene_src);
  return true;
}
