#ifndef FEATURES_SPAWN_POWERUPS_H_
#define FEATURES_SPAWN_POWERUPS_H_

#include <parameters.h>
#include <graphics/powerup.h>
#include <graphics/enemy.h>

void power(void);
void spawn_powerups(bullet_type *typ, uint32_t powerup_time,
		uint32_t *last_powerup_time);
void remove_powerups(void);

#endif /* FEATURES_SPAWN_POWERUPS_H_ */
