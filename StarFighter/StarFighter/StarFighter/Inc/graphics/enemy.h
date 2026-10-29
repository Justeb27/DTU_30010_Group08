#ifndef GRAPHICS_ENEMY_H_
#define GRAPHICS_ENEMY_H_

#include <stdlib.h> // For rand()
#include <string.h>

#include <parameters.h>
#include <init/basic_functions.h>
#include <graphics/background.h>
#include <init/timer.h>
#include <graphics/ansi.h>
#include <features/collision_detection.h>

typedef struct {
	int x;
	int y;
	uint8_t active;
	uint8_t powerup_effect;
} enemy_state;

enemy_state aliens_array[MAX_ALIENS];
enemy_state meteors_array[MAX_METEORS];
enemy_state powerups_array[MAX_POWERUPS];

void init_enemy_state(void);
void enemy_go(uint8_t *health, uint32_t *last_spawn_time,
		uint32_t *last_meteor_time, uint32_t *last_damage_time,
		uint8_t alien_speed);
void spawn_meteor(uint32_t *last_meteor_time);
void spawn_alien(uint32_t *last_spawn_time);
void remove_alien(uint8_t i);

#endif /* GRAPHICS_ENEMY_H_ */
