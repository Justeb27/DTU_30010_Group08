#ifndef FEATURES_BULLETS_H_
#define FEATURES_BULLETS_H_

#include <parameters.h>
#include <features/movement.h>
#include <init/timer.h>
#include <unistd.h>
#include <graphics/enemy.h>

typedef struct {
	uint8_t bx;
	uint8_t by;
	int8_t vx;
	int8_t vy;
	uint8_t active;
	uint8_t gravity;
} bullet;

bullet bullets_array[MAX_BULLETS];

void init_bullets(void);
void fire_bullet(position *pos, bullet_type typ);
void update_bullet_pos(void);
void bullet_spawn_correction(bullet bullets_array[MAX_BULLETS], position pos,
		uint8_t i);
void bullet_direction(position *pos, int8_t direction, uint8_t i);

#endif
