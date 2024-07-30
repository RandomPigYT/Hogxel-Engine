#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"
#include "doom-style-renderer.h"
#include "util/dynamic_array.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define TOKENS_IN_HEADER_GUARD 3

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

// clang-format off

#define BLOCKS_GUARDS() \
  X(BLOCK_GUARD_NONE)   \
  X(BEGIN_WALLS)        \
  X(END_WALLS)          \
  X(BEGIN_SECTORS)      \
  X(END_SECTORS)


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

#undef BLOCKS_GUARDS

#define PARSE_ERRORS()							\
  X(PARSE_ERROR_NONE)								\
  X(PARSE_ERROR_EXPECTED_TOKEN)			\
  X(PARSE_ERROR_UNEXPECTED_TOKEN)		\
	X(PARSE_ERROR_ID_OUT_OF_RANGE)		\
	X(PARSE_ERROR_FLOAT_OUT_OF_RANGE) 

#define X(name) name,
enum ParseErrors {
	PARSE_ERRORS()
	
	PARSE_ERROR_COUNT,
};
#undef X

#define X(name) #name,
static const char *parse_errors[] = { 

	PARSE_ERRORS()

};
#undef X

#undef PARSE_ERRORS
// clang-format on

/*
 * The values of 'enum WallFields' must match the offsets of the fields
 * of 'struct dsr_Wall'.
 */
enum WallFields {

  WALL_FIELD_ID,

  WALL_FIELD_X1,
  WALL_FIELD_Z1,
  WALL_FIELD_X2,
  WALL_FIELD_Z2,

  WALL_FIELD_IS_PORTAL,

  WALL_FIELDS_COUNT,

};

enum SectorFields {

  SECTOR_FIELD_ID,
  SECTOR_FIELD_FLOOR_HEIGHT = 1,
  SECTOR_FIELD_CEIL_HEIGHT = 2,

  /* WALL1 WALL2 ... */

  SECTOR_FIELDS_COUNT,

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
  assert(guard != NULL);
  assert(tokens != NULL);

  uint64_t error_index__ = 0;
  enum ParseErrors error_type__ = PARSE_ERROR_NONE;

  *guard = BLOCK_GUARD_NONE;

  if (index >= tokens->count - 2) {
    error_index__ = tokens->count - 1;
    error_type__ = PARSE_ERROR_EXPECTED_TOKEN;

    goto Error;
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
    error_index__ = index + 1;
    error_type__ = PARSE_ERROR_UNEXPECTED_TOKEN;

    goto Error;
  }

  if (DA_AT(*tokens, index + 2).view[0] != ']') {
    error_index__ = index + 2;
    error_type__ = PARSE_ERROR_UNEXPECTED_TOKEN;

    goto Error;
  }

  return PARSE_ERROR_NONE;

Error:
  if (error_index != NULL) {
    *error_index = error_index__;
  }

  return error_type__;
}

// 'index' points to the start of the line
static enum ParseErrors parse_wall(const struct Tokens *tokens, uint64_t index,
                                   struct dsr_Wall *wall,
                                   uint64_t *error_index) {
  assert(tokens != NULL);
  assert(wall != NULL);

  uint64_t error_index__ = 0;
  enum ParseErrors error_type__ = PARSE_ERROR_NONE;

  uint64_t line_length = 0;
  for (uint64_t i = index; i < tokens->count; i++) {
    if (DA_AT(*tokens, i).view[0] == '\n') {
      break;
    }

    line_length++;
  }

  if (line_length == 0) {
    return PARSE_ERROR_NONE;
  }

  if (line_length != WALL_FIELDS_COUNT) {
    error_index__ = index + line_length - 1;
    error_type__ = line_length > WALL_FIELDS_COUNT
                     ? PARSE_ERROR_UNEXPECTED_TOKEN
                     : PARSE_ERROR_EXPECTED_TOKEN;
    goto Error;
  }

  // Wall id
  {
    struct StringView *tok = &DA_AT(*tokens, index + WALL_FIELD_ID);

    char *tmp = malloc(tok->length + 1);
    assert(tmp != NULL && "Failed to allocate memory");

    memcpy(tmp, tok->view, tok->length);
    tmp[tok->length] = 0;

    errno = 0;

    char *end = NULL;
    int64_t wall_id = strtoll(tmp, &end, 10);

    if (*end != 0) {
      free(tmp);
      error_index__ = index;
      error_type__ = PARSE_ERROR_UNEXPECTED_TOKEN;

      goto Error;
    }

    if (wall_id < 0 || errno == ERANGE) {
      free(tmp);
      error_index__ = index;
      error_type__ = PARSE_ERROR_ID_OUT_OF_RANGE;

      goto Error;
    }

    wall->id = wall_id;

    free(tmp);
  }

  // Wall vertices
  {
    float vertices[4] = { 0 };

    // Fetch vertices from source
    for (uint8_t i = WALL_FIELD_X1; i <= WALL_FIELD_Z2; i++) {
      struct StringView *tok = &DA_AT(*tokens, index + i);

      char *tmp = malloc(tok->length + 1);
      assert(tmp != NULL && "Failed to allocate memory");

      memcpy(tmp, tok->view, tok->length);
      tmp[tok->length] = 0;

      errno = 0;

      char *end = NULL;
      vertices[i - WALL_FIELD_X1] = strtof(tmp, &end);

      if (*end != 0) {
        free(tmp);
        error_index__ = index + i;
        error_type__ = PARSE_ERROR_UNEXPECTED_TOKEN;

        goto Error;
      }

      if (errno == ERANGE) {
        free(tmp);
        error_index__ = index + i;
        error_type__ = PARSE_ERROR_FLOAT_OUT_OF_RANGE;

        goto Error;
      }

      free(tmp);
    }

    wall->vertices[0][0] = vertices[0];
    wall->vertices[0][1] = vertices[1];
    wall->vertices[1][0] = vertices[2];
    wall->vertices[1][1] = vertices[3];
  }

  // Is portal
  {
    struct StringView *tok = &DA_AT(*tokens, index + WALL_FIELD_IS_PORTAL);

    if (strncmp(tok->view, "true", tok->length) == 0) {
      wall->is_portal = true;

    } else if (strncmp(tok->view, "false", tok->length) == 0) {
      wall->is_portal = false;

    } else {
      error_index__ = index + WALL_FIELD_IS_PORTAL;
      error_type__ = PARSE_ERROR_UNEXPECTED_TOKEN;

      goto Error;
    }
  }

Error:
  if (error_index != NULL) {
    *error_index = error_index__;
  }

  return error_type__;
}

static enum ParseErrors
get_block_type(enum BlockGuard guard, enum BlockType old, enum BlockType *new) {
  switch (guard) {
    case BEGIN_WALLS: {
      *new = BLOCK_TYPE_WALLS;
    } break;

    case BEGIN_SECTORS: {
      *new = BLOCK_TYPE_SECTORS;
    } break;

    case END_WALLS:
    case END_SECTORS: {
      if (old == BLOCK_TYPE_NONE) {
        printf("Next error from here\n");
        return PARSE_ERROR_UNEXPECTED_TOKEN;
      }

      *new = BLOCK_TYPE_NONE;
    } break;

    default: {
      return PARSE_ERROR_UNEXPECTED_TOKEN;
    } break;
  }

  return PARSE_ERROR_NONE;
}

// TODO: Refactor error handling to match the other functions
static enum ParseErrors parse(const struct Tokens *tokens,
                              struct dsr_Scene *scene, const char **error_loc) {
  (void)scene;

  assert(error_loc != NULL);

#ifndef RELEASE

  for (uint64_t i = 0; i < tokens->count; i++) {
    assert(DA_AT(*tokens, i).length > 0 &&
           "Should only contain non-zero length tokens");
  }

#endif

  bool is_comment = false;
  enum BlockType block_type = BLOCK_TYPE_NONE;

  uint64_t inc_by = 1;
  for (uint64_t i = 0; i < tokens->count; i += inc_by) {
    inc_by = 1;

    struct StringView *tok = &DA_AT(*tokens, i);

    if (tok->view[0] == '\n') {
      is_comment = false;

      continue;
    }

    if (is_comment) {
      continue;
    }

    if (strstr(special, (char[]){ tok->view[0], 0 })) {
      switch (tok->view[0]) {
        case '[': {
          enum BlockGuard guard = BLOCK_GUARD_NONE;
          uint64_t error_index;

          {
            enum ParseErrors error_type =
              parse_block_guard(tokens, i, &guard, &error_index);
            if (error_type != PARSE_ERROR_NONE) {
              printf("Error!\n");
              *error_loc = DA_AT(*tokens, error_index).view +
                           (DA_AT(*tokens, error_index).length - 1);
              return error_type;
            }
          }

          {
            enum ParseErrors error_type =
              get_block_type(guard, block_type, &block_type);
            if (error_type != PARSE_ERROR_NONE) {
              printf("Error from header, type: %s\n", parse_errors[error_type]);
              *error_loc = tok->view;
              return error_type;
            }
          }

          inc_by = TOKENS_IN_HEADER_GUARD;
        } break;

        case '#': {
          is_comment = true;
        } break;

        default: {
          *error_loc = tok->view;
          return PARSE_ERROR_UNEXPECTED_TOKEN;
        }
      }

      continue;
    }

    if (block_type == BLOCK_TYPE_WALLS) {
      struct dsr_Wall wall = { 0 };

      uint64_t error_index = 0;
      enum ParseErrors error_type = parse_wall(tokens, i, &wall, &error_index);

      if (error_type != PARSE_ERROR_NONE) {
        *error_loc = error_type == PARSE_ERROR_UNEXPECTED_TOKEN
                       ? (DA_AT(*tokens, error_index).view +
                          (DA_AT(*tokens, error_index).length - 1))
                       : DA_AT(*tokens, error_index).view;
        return error_type;
      }
      printf("wall {\n"
             "  .id = %d,\n\n"
             "  .vertices = {\n"
             "    { %f, %f },\n"
             "    { %f, %f },\n"
             "  },\n\n"
             "  .is_portal = %s,\n"
             "}\n\n",
             wall.id, wall.vertices[0][0], wall.vertices[0][1],
             wall.vertices[1][0], wall.vertices[1][1],
             wall.is_portal ? "true" : "false");

      inc_by = WALL_FIELDS_COUNT;
    } else if (block_type == BLOCK_TYPE_SECTORS) {
      /* do stuff */

    } else {
      *error_loc = tok->view;
      return PARSE_ERROR_UNEXPECTED_TOKEN;
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
