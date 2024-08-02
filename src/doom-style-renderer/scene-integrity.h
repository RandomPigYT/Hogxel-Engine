#ifndef DSR_SCENE_INTEGRITY_H
#define DSR_SCENE_INTEGRITY_H

#include "doom-style-renderer.h"

#define FAIL_CONDITIONS()              \
  X(FAIL_CONDITION_NONE)               \
  X(FAIL_CONDITION_SELF_INTERSECTION)  \
  X(FAIL_CONDITION_INCOMPLETE_HOLE)    \
  X(FAIL_CONDITION_INVALID_WALL_ORDER) \
  X(FAIL_CONDITION_CONCAVE_SECTOR)     \
  X(FAIL_CONDITION_HOLE_UNMATCHED)

// clang-format off

#define X(name) name,
enum FailConditions {
	FAIL_CONDITIONS()
	
	FAIL_CONDITIONS_COUNT,
};
#undef X


// clang-format off

enum FailConditions assert_scene_integrity(struct dsr_Scene *scene, uint32_t *failed_at_sector,
                            uint32_t *failed_at_wall,
                            uint32_t *actual_wall_index);


extern const char *fail_conditions[];


#endif // DSR_SCENE_INTEGRITY_H
