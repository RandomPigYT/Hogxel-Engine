#include "doom-style-renderer.h"
#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"
#include "util/dynamic_array.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define ERROR_BUF_SIZE 512

struct StringView {
  const char *view;
  uint64_t length;
};

enum BlockType {
  BLOCK_TYPE_NONE = 0,

  BLOCK_TYPE_WALLS,
  BLOCK_TYPE_SCENES,

  BLOCK_COUNT,
};

struct Tokens {
  struct StringView *items;
  uint64_t count;
  uint64_t capacity;
};

static const char seperators[] = " \t"; // Removed
static const char special[] = "[]#\n"; // Preseverved as tokens

// clang-format off

#define BLOCKS_SPECS() \
  X(BEGIN_WALLS)       \
  X(END_WALLS)         \
  X(BEGIN_SECTORS)     \
  X(END_SECTORS)

#define X(name) name,

enum BlockSpec {
  BLOCKS_SPECS()

  SPEC_COUNT,
};

#undef X

#define X(name) #name,

static const char *block_specs[] = { 
	BLOCKS_SPECS()
};

#undef X

// clang-format on

// Returned dynamic array must be freed by caller
static struct Tokens tokenize(const char *src) {
  struct Tokens toks = { 0 };

  struct StringView token = { 0 };
  while (*src) {
    if (strstr(seperators, (char[]){ *src, 0 })) {
      if (token.length) {
        DA_APPEND(&toks, token);
      }

      token = (struct StringView){ 0 };

    } else if (strstr(special, (char[]){ *src, 0 })) {
      if (token.length) {
        DA_APPEND(&toks, token);
      }

      token.view = src;
      token.length = 1;
      DA_APPEND(&toks, token);

      token = (struct StringView){ 0 };

    } else {
      if (token.view == NULL) {
        token.view = src;
      }

      token.length++;
    }

    src++;
  }

  return toks;
}

static bool parse(struct Tokens *tokens, struct dsr_Scene *scene, char *error) {
  DA_TYPE(struct StringView *) line_prev_toks = { 0 };

  bool is_comment = false;
  for (uint64_t i = 0; i < tokens->count; i++) {
    assert(DA_AT(*tokens, i).length != 0 &&
           "This should only contain non-zero length tokens");

    if (DA_AT(*tokens, i).view[0] == '\n') {
      is_comment = false;
      DA_FREE(&line_prev_toks);

      continue;
    }

    if (is_comment) {
      continue;
    }

    if (strstr(special, DA_AT(*tokens, i).view)) {
      switch (DA_AT(*tokens, i).view[0]) {
        case '[':
        case ']': {
          DA_APPEND(&line_prev_toks, &DA_AT(*tokens, i));
        } break;

        case '#': {
          is_comment = true;
        } break;

        default:
          assert(NULL && "Unreachable");
      }
    }
  }
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
      printf("\"\\n\", ");
    } else {
      printf("\"%.*s\", ", (int)DA_AT(toks, i).length, DA_AT(toks, i).view);
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
