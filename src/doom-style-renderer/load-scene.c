#include "doom-style-renderer.h"

#define UTIL_FILE_IO_IMPLEMENTATION
#include "util/fileIO.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define ASSERT_VIEW_BOUNDS(str_view, str)                                    \
  do {                                                                       \
    assert((((str_view).view >= (str)) || (str_view).view == NULL) &&        \
           "View out of bounds");                                            \
                                                                             \
    assert((str_view).view < (str) + strlen((str)) && "View out of bounds"); \
                                                                             \
  } while (0)

struct StringView {
  const char *view;
  uint64_t length;
};

enum BlockType {
  BLOCK_TYPE_NONE = 0,
  BLOCK_TYPE_WALLS,
  BLOCK_TYPE_SCENES,
};

// str -> Start of the current line
// len -> size of the entire string containing the line, starting from 'str'
static uint64_t get_line_len(const char *str, uint64_t len) {
  const char *temp = str;
  while (*temp) {
    if (*temp == '\n') {
      return temp - str == 0 ? 0 : temp - str;
    }

    temp++;
  }

  return len;
}

static void next_line(struct StringView *view, const char *scene_src) {
  ASSERT_VIEW_BOUNDS(*view, scene_src);

  if (view->view == NULL) {
    *view = (struct StringView){
      .view = scene_src,
      .length = get_line_len(scene_src, strlen(scene_src)),
    };

    return;
  }

  const char *scene_src_end = scene_src + strlen(scene_src);

  view->view += view->length + 1;
  if (view->view >= scene_src_end) {
    *view = (struct StringView){ 0 };
    return;
  }

  view->length = get_line_len(view->view, strlen(view->view));
}

static void lstrip_line(struct StringView *view) {
  assert(view != NULL);
  if (view->length == 0 || view->view == NULL)
    return;

  for (uint64_t i = 0; i < view->length; i++) {
    if (view->view[i] != ' ' && view->view[i] != '\t') {
      view->view = &view->view[i];
      view->length = view->length - i;

      return;
    }
  }

  view->view = &view->view[view->length];
  view->length = 0;
}

bool dsr_load_scene(const char *scene_path, struct dsr_Scene *scene) {
  (void)scene;

  char *scene_src = fio_read_file(scene_path);
  if (!scene_src) {
    return false;
  }

  struct StringView view = { 0 };

  //printf("Lines: \n");

  int line = 0;
  do {
    next_line(&view, scene_src);
    lstrip_line(&view);

    if (view.length) {
      printf("line %d: ", line);
      printf("%.*s\n", (int)view.length, view.view);
    }

    if (!view.length)
      line--;

    line++;
  } while (view.view);

  free(scene_src);
  return true;
}
