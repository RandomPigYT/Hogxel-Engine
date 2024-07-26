#include "doom-style-renderer.h"
#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"
#include "util/dynamic_array.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct StringView {
  const char *view;
  uint64_t length;
};

enum BlockType {
  BLOCK_TYPE_NONE = 0,
  BLOCK_TYPE_WALLS,
  BLOCK_TYPE_SCENES,
};

struct Tokens {
  struct StringView *items;
  uint64_t count;
  uint64_t capacity;
};

// Returned dynamic array must be freed by caller
static struct Tokens tokenize(const char *src) {
  const char seperators[] = " \t"; // Removed
  const char special[] = "[]#\n"; // Preseverved as tokens

  struct Tokens toks = { 0 };

  uint32_t tok_len = 0;
  while (*src) {
    struct StringView token = { 0 };

    if (strstr(seperators, (char[]){ *src, 0 })) {
      // Do stuff

    } else if (strstr(special, (char[]){ *src, 0 })) {
      // Do stuff

    } else {
      // Do stuff
    }

    src += tok_len;
  }

  return toks;
}

bool dsr_load_scene(const char *scene_path, struct dsr_Scene *scene) {
  (void)scene;

  char *scene_src = fio_read_file(scene_path);
  if (!scene_src) {
    return false;
  }

  struct Tokens toks = tokenize(scene_src);

  DA_FREE(&toks);
  free(scene_src);
  return true;
}
