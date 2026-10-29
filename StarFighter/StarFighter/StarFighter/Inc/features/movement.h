#ifndef FEATURES_MOVEMENT_H_
#define FEATURES_MOVEMENT_H_

#include <stdint.h>
#include <stdio.h>

typedef struct {
	uint8_t x;
	uint8_t y;
	uint8_t direction;
} position;

typedef struct {
	uint8_t type;
} bullet_type;

#include <init/timer.h>
#include <init/init_GPIO.h>
#include <init/basic_functions.h>
#include <features/bullets.h>
#include <init/joystick_reader.h>
#include <graphics/spaceship.h>
#include <graphics/background.h>

void movement(position *pos, position *oldpos, bullet_type typ);
void set_pos_and_dir(position *pos, position *oldpos, bullet_type typ,
		uint8_t joystick_type, uint8_t buffer);

#endif
