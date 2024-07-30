#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"
#include "doom-style-renderer.h"
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
  BLOCK_TYPE_SECTORS,

  BLOCK_COUNT,
};

struct Tokens {
  struct StringView *items;
  uint64_t count;
  uint64_t capacity;
};

static const char seperators[] = " \t"; // Removed
static const char special[] = "[]#\n"; // Preseverved as tokens

#define BLOCKS_GUARDS() \
  X(BLOCK_GUARD_NONE)   \
  X(BEGIN_WALLS)        \
  X(END_WALLS)          \
  X(BEGIN_SECTORS)      \
  X(END_SECTORS)

// clang-format off

#define X(name) name,
enum BlockGuard {
  BLOCKS_GUARDS()

	BLOCK_GUARDS_COUNT,
};
#undef X

#define X(name) #name,
static const char *block_guards[] = { 

	BLOCKS_GUARDS()

};
#undef X

// clang-format on

enum ParseErrors {
  PARSE_ERROR_NONE = 0,

  PARSE_ERROR_EXPECTED_TOKEN,
  PARSE_ERROR_UNEXPECTED_TOKEN,
};

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

static enum ParseErrors parse_block_guard(const struct Tokens *tokens,
                                          uint64_t index,
                                          enum BlockGuard *guard,
                                          uint64_t *error_index) {
  *guard = BLOCK_GUARD_NONE;

  if (index >= tokens->count - 2) {
    *error_index = tokens->count - 1;
    return PARSE_ERROR_EXPECTED_TOKEN;
  }

  for (uint32_t i = 1; i < BLOCK_GUARDS_COUNT; i++) {
    const struct StringView *tok_view = &DA_AT(*tokens, index + 1);

    char *tmp = malloc(tok_view->length + 1);
    assert(tmp != NULL && "Failed to allocate memory");

    memcpy(tmp, tok_view->view, tok_view->length);
    tmp[tok_view->length] = 0;

    if (strcmp(tmp, block_guards[i]) == 0) {
      *guard = i;

      free(tmp);
      break;
    }

    free(tmp);
  }

  if (*guard == BLOCK_GUARD_NONE) {
    *error_index = index + 1;
    return PARSE_ERROR_UNEXPECTED_TOKEN;
  }

  if (DA_AT(*tokens, index + 2).view[0] != ']') {
    *error_index = index + 2;
    return PARSE_ERROR_UNEXPECTED_TOKEN;
  }

  return PARSE_ERROR_NONE;
}

static enum ParseErrors parse(const struct Tokens *tokens,
                              struct dsr_Scene *scene, const char **error_loc) {
  bool is_comment = false;
  enum BlockType block_type = BLOCK_TYPE_NONE;

  uint64_t inc_by = 1;
  for (uint64_t i = 0; i < tokens->count; i += inc_by) {
    inc_by = 1;

    assert(DA_AT(*tokens, i).length > 0 &&
           "Should only contain non-zero length tokens");

    if (DA_AT(*tokens, i).view[0] == '\n') {
      is_comment = false;

      continue;
    }

    if (is_comment) {
      continue;
    }

    if (block_type == BLOCK_TYPE_NONE) {
      if (strstr(special, (char[]){ DA_AT(*tokens, i).view[0], 0 })) {
        switch (DA_AT(*tokens, i).view[0]) {
          case '[': {
            enum BlockGuard guard = BLOCK_GUARD_NONE;
            uint64_t error;

            enum ParseErrors error_type;
            if ((error_type = parse_block_guard(tokens, i, &guard, &error)) !=
                PARSE_ERROR_NONE) {
              printf("Error!\n");
              *error_loc =
                DA_AT(*tokens, error).view + (DA_AT(*tokens, error).length - 1);
              return error_type;
            }

            switch (guard) {
              case BEGIN_WALLS: {
                block_type = BLOCK_TYPE_WALLS;
              } break;

              case BEGIN_SECTORS: {
                block_type = BLOCK_TYPE_SECTORS;
              } break;

              case END_WALLS:
              case END_SECTORS: {
                if (block_type == BLOCK_TYPE_NONE) {
                  *error_loc = DA_AT(*tokens, i).view;
                  return PARSE_ERROR_UNEXPECTED_TOKEN;
                }

                block_type = BLOCK_TYPE_NONE;
              } break;

              default: {
                *error_loc = DA_AT(*tokens, i).view;
                return PARSE_ERROR_UNEXPECTED_TOKEN;
              } break;
            }

          } break;

          case '#': {
            is_comment = true;
          } break;

          case ']':
            break;

          default: {
            return PARSE_ERROR_UNEXPECTED_TOKEN;
          }
        }
      }

    } else if (block_type == BLOCK_TYPE_WALLS) {
      /* do stuff */

    } else if (block_type == BLOCK_TYPE_SECTORS) {
      /* do stuff */
    }
  }

  return PARSE_ERROR_NONE;
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
  printf("\nblock guards count: %d\n", BLOCK_GUARDS_COUNT);

  const char *error_loc = 0;
  printf("Parse result: %d\n", parse(&toks, scene, &error_loc));

  DA_FREE(&toks);
  free(scene_src);
  return true;
}

/*
 * TODO: Set parse error messages
 */
