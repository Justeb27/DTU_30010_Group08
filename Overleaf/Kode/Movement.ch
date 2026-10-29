\begin{lstlisting}[caption = {Movement.h}]

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

\end{lstlisting}





\begin{lstlisting}[caption = {Movement.c}]

#include <features/movement.h>

void movement(position *pos, position *oldpos, bullet_type typ) {
	if ((cs + 10) % 7 == 0) {
		uint8_t buffer = 0;
		// Remove old spaceship
		if ((pos->x != oldpos->x) || (pos->y != oldpos->y)) {
			switch (oldpos->direction) {
			case 1:
			case 2:
			case 3:
			case 5:
			case 6:
			case 7:
				for (int i = 0; i < 4; i++) {
					gotoxy(oldpos->x, oldpos->y + i);
					printf("      ");
				}
				init_background_section(oldpos->x, oldpos->y, oldpos->x + 6,
						oldpos->y + 4, 11);
				break;
			case 4:
			case 8:
				for (int i = 0; i < 4; i++) {
					gotoxy(oldpos->x, oldpos->y + i);
					printf("       ");
				}
				init_background_section(oldpos->x, oldpos->y, oldpos->x + 7,
						oldpos->y + 4, 11);
				break;
			}
			oldpos->x = pos->x;
			oldpos->y = pos->y;
			oldpos->direction = pos->direction;
			buffer = 1;
		}

		// Spaceship position and set direction
		set_pos_and_dir(pos, oldpos, typ, 1, buffer);
	}
}

void set_pos_and_dir(position *pos, position *oldpos, bullet_type typ,
		uint8_t joystick_type, uint8_t buffer) {
	if (joystick_type == 0) {
		switch (mcu_read_joystick()) {
		case 9:
			pos->x += 2;
			pos->y--;
			pos->direction = 1;
			break;
		case 8: // Right
			pos->x += 2;
			pos->direction = 2;
			break;
		case 10:
			pos->x += 2;
			pos->y++;
			pos->direction = 3;
			break;
		case 2: // Down
			pos->y++;
			pos->direction = 4;
			break;
		case 6:
			pos->x -= 2;
			pos->y++;
			pos->direction = 5;
			break;
		case 4: // Left
			pos->x -= 2;
			pos->direction = 6;
			break;
		case 5:
			pos->x -= 2;
			pos->y--;
			pos->direction = 7;
			break;
		case 1: // Up
			pos->y--;
			pos->direction = 8;
			break;
		}

		// Print new spaceship
			draw_spaceship(*pos, buffer);

		if (mcu_read_joystick() == 16) { // center
			fire_bullet(&*pos, typ);
		}
	}

	if (joystick_type == 1) {
		switch (read_joystick()) {
		case 1:
			pos->x += 2;
			pos->y--;
			pos->direction = 1;
			break;
		case 2: // Right
			pos->x += 2;
			pos->direction = 2;
			break;
		case 3:
			pos->x += 2;
			pos->y++;
			pos->direction = 3;
			break;
		case 4: // Down
			pos->y++;
			pos->direction = 4;
			break;
		case 5:
			pos->x -= 2;
			pos->y++;
			pos->direction = 5;
			break;
		case 6: // Left
			pos->x -= 2;
			pos->direction = 6;
			break;
		case 7:
			pos->x -= 2;
			pos->y--;
			pos->direction = 7;
			break;
		case 8: // Up
			pos->y--;
			pos->direction = 8;
			break;
		}

		// Print new spaceship
		draw_spaceship(*pos, buffer);

		if (read_button() == 2) {
			fire_bullet(&*pos, typ);
		}
	}
}

\end{lstlisting}