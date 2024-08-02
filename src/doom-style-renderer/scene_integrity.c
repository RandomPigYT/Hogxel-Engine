#include "doom-style-renderer.h"
#include "scene_integrity.h"

// clang-format off

#define X(name) #name,
const char *fail_conditions[] = {

  FAIL_CONDITIONS()

};
#undef X

// clang-format on

enum FailConditions assert_scene_integrity(struct dsr_Scene *scene,
                                           uint32_t *failed_at_sector,
                                           uint32_t *failed_at_wall,
                                           uint32_t *actual_wall_index)
{
  return FAIL_CONDITION_NONE;
}
