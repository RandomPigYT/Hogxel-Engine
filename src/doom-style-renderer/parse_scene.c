#include "doom-style-renderer.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

char *read_file(const char *path) {
  FILE *f = fopen(path, "rb");

  struct stat s;

  fstat(fileno(f), &s);

  uint64_t size = s.st_size;

  char *buf = malloc(size + 1);

  fread(buf, 1, size, f);

  buf[size] = 0;
  fflush(stdout);

  fclose(f);

  return buf;
}

void dsr_load_scene(const char *scene_source, struct dsr_Scene *scene) {
  (void)scene_source;
  (void)scene;
}
