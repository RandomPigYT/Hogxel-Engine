#ifndef UTIL_DYNAMIC_ARRAY
#define UTIL_DYNAMIC_ARRAY

#include <assert.h>

#define DA_TYPE(type)  \
  struct {             \
    type *items;       \
    uint64_t count;    \
    uint64_t capacity; \
  }

#define DA_INIT_CAPACITY 8
#define DA_GROW_FACTOR 2

#define DA_AT(arr, index)                                    \
  (assert((arr).items != NULL), assert(index < (arr).count), \
   (arr).items[(index)])

#define DA_APPEND(arr, item)                                            \
  do {                                                                  \
    if ((arr)->count >= (arr)->capacity) {                              \
      (arr)->capacity = (arr)->capacity == 0                            \
                          ? DA_INIT_CAPACITY                            \
                          : DA_GROW_FACTOR * (arr)->capacity;           \
      (arr)->items =                                                    \
        realloc((arr)->items, (arr)->capacity * sizeof(*(arr)->items)); \
      assert((arr)->items != NULL && "Failed to allocate memory");      \
    }                                                                   \
    (arr)->items[(arr)->count++] = (item);                              \
  } while (0)

#define DA_APPEND_NO_ASSIGN(arr)                                        \
  do {                                                                  \
    if ((arr)->count >= (arr)->capacity) {                              \
      (arr)->capacity = (arr)->capacity == 0                            \
                          ? DA_INIT_CAPACITY                            \
                          : DA_GROW_FACTOR * (arr)->capacity;           \
      (arr)->items =                                                    \
        realloc((arr)->items, (arr)->capacity * sizeof(*(arr)->items)); \
      assert((arr)->items != NULL && "Failed to allocate memory");      \
    }                                                                   \
    (arr)->count++;                                                     \
  } while (0)

#define DA_FREE(arr)     \
  do {                   \
    free((arr)->items);  \
    (arr)->items = NULL; \
    (arr)->count = 0;    \
    (arr)->capacity = 0; \
  } while (0)

#define DA_DELETE_ITEM(arr, index)                                            \
  do {                                                                        \
    assert((arr)->count != 0 && "Attempted to pop from empty dynamic array"); \
    assert((index) < (arr)->count && "Invalid index");                        \
    if ((index) == (arr)->count - 1) {                                        \
      (arr)->count--;                                                         \
    } else {                                                                  \
      memmove(&((arr)->items[index]), &((arr)->items[index + 1]),             \
              ((arr)->count - index - 1) * sizeof(*(arr)->items));            \
      (arr)->count--;                                                         \
    }                                                                         \
  } while (0)

#endif // UTIL_DYNAMIC_ARRAY
