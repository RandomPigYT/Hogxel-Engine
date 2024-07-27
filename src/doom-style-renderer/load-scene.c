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

  struct StringView token = { 0 };
  while (*src) {
    if (strstr(seperators, (char[]){ *src, 0 })) {
      if (token.length)
        DA_APPEND(&toks, token);

      token = (struct StringView){ 0 };

    } else if (strstr(special, (char[]){ *src, 0 })) {
      if (token.length)
        DA_APPEND(&toks, token);

      token.view = src;
      token.length = 1;
      DA_APPEND(&toks, token);

      token = (struct StringView){ 0 };

    } else {
      if (token.view == NULL)
        token.view = src;

      token.length++;
    }

    src++;
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

  const int toks_per_line = 7;

  printf("Tokens {\n");
  for (uint32_t i = 0; i < toks.count; i++) {
    if (i % toks_per_line == 1 || i == 0) {
      printf("  ");
    }

    if (*DA_AT(toks, i).view == '\n') {
      printf("\\n, ");
    } else {
      printf("%.*s, ", (int)DA_AT(toks, i).length, DA_AT(toks, i).view);
    }

    if ((i % toks_per_line == 0 && i != 0) || i == toks.count - 1) {
      if (i != toks.count - 1)
        printf("\n");
      printf("\n");
    }
  }
  printf("}\n");

  DA_FREE(&toks);
  free(scene_src);
  return true;
}
