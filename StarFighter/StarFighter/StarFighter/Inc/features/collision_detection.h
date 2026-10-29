#ifndef FEATURES_COLLISION_DETECTION_H_
#define FEATURES_COLLISION_DETECTION_H_

#include <parameters.h>
#include <features/bullets.h>
#include <features/movement.h>
#include <graphics/enemy.h>
#include <graphics/ansi.h>
#include <graphics/background.h>
#include <features/spawn_powerups.h>
#include <graphics/enemy.h>

void bullet_collision(void);
void spaceship_collision(position pos, uint8_t *health, uint32_t *last_damage_time);
void powerup_collision(position pos, uint8_t *health, bullet_type *typ,
		uint32_t *powerup_time);

#endif
