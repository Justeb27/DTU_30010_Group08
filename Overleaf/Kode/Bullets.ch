\begin{lstlisting}[caption = {Bullets.h}]

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

\end{lstlisting}

\begin{lstlisting}[caption = {Bullets.c}]

#include <features/bullets.h>

void init_bullets() {
	for (uint8_t i = 0; i < MAX_BULLETS; i++) {
		bullets_array[i].active = 0;
		bullets_array[i].gravity = 0;
	}
}

void fire_bullet(position *pos, bullet_type typ) {
	static uint32_t last_fire_time = 0;
	int8_t d;
	// Fire delay
	if (cs - last_fire_time < BULLET_FIRE_DELAY) {
		return;
	}
	last_fire_time = cs; // Update last fire time

	// Create new bullet
	switch (typ.type) {
	case 0: // Normal bullets
		for (int i = 0; i < MAX_BULLETS; i++) {
			if (!bullets_array[i].active) {
				bullets_array[i].bx = pos->x;
				bullets_array[i].by = pos->y;
				bullets_array[i].gravity = 0;

				// Correct bullet spawn position
				bullet_spawn_correction(bullets_array, *pos, i);

				// Bullet direction
				bullet_direction(&*pos, pos->direction, i);

				//Activate bullet
				bullets_array[i].active = 1;
				break;
			}
		}
		break;

	case 1: // Shotgun
		d = pos->direction;
		d += 7;

		if (!bullets_array[0].active && !bullets_array[1].active
				&& !bullets_array[2].active) {
			for (uint8_t i = 0; i < 3; i++) {
				if (!bullets_array[i].active) {
					bullets_array[i].bx = pos->x;
					bullets_array[i].by = pos->y;
					bullets_array[i].gravity = 0;

					if (d > 8) {
						d -= 8;
					}

					// Correct bullet spawn position
					bullet_spawn_correction(bullets_array, *pos, i);

					// Bullet direction
					bullet_direction(&*pos, d, i);

					//Activate bullet
					bullets_array[i].active = 1;
					d += 1;
				}
			}
		}
		break;

	case 2: //Laser
		if (!bullets_array[0].active) {
			bullets_array[0].bx = pos->x;
			bullets_array[0].by = pos->y;

			// Correct bullet spawn position
			bullet_spawn_correction(bullets_array, *pos, 0);

			switch (pos->direction) {
			case 2:
				for (uint8_t j = 0; j < MAX_ALIENS; j++) {
					if ((bullets_array[0].bx < aliens_array[j].x)
							&& (bullets_array[0].by >= aliens_array[j].y)
							&& (bullets_array[0].by < aliens_array[j].y + 5)) {
						aliens_array[j].active = 0;
					}
					gotoxy(bullets_array[0].bx, bullets_array[0].by);
					for (uint8_t i = bullets_array[0].bx; i < 243; i++) {
						printf("%c", 254);
					}
					gotoxy(bullets_array[0].bx, bullets_array[0].by);
					for (uint8_t i = bullets_array[0].bx; i < 243; i++) {
						printf(" ");
					}
				}
				break;
			case 4:
				for (uint8_t j = 0; j < MAX_ALIENS; j++) {
					if ((bullets_array[0].by < aliens_array[j].y)
							&& (bullets_array[0].bx >= aliens_array[j].x)
							&& (bullets_array[0].bx < aliens_array[j].x + 10)) {
						aliens_array[j].active = 0;
					}
					for (uint8_t i = bullets_array[0].by; i < 76; i++) {
						gotoxy(bullets_array[0].bx, i);
						printf("%c", 219);
					}
					for (uint8_t i = bullets_array[0].by; i < 76; i++) {
						gotoxy(bullets_array[0].bx, i);
						printf(" ");
					}
				}
				break;
			case 6:
				for (uint8_t j = 0; j < MAX_ALIENS; j++) {
					if ((bullets_array[0].bx > aliens_array[j].x)
							&& (bullets_array[0].by >= aliens_array[j].y)
							&& (bullets_array[0].by < aliens_array[j].y + 5)) {
						aliens_array[j].active = 0;
					}
					gotoxy(0, bullets_array[0].by);
					for (uint8_t i = 0; i < bullets_array[0].bx; i++) {
						printf("%c", 254);
					}
					gotoxy(0, bullets_array[0].by);
					for (uint8_t i = 0; i < bullets_array[0].bx; i++) {
						printf(" ");
					}
				}
				break;
			case 8:
				for (uint8_t j = 0; j < MAX_ALIENS; j++) {
					if ((bullets_array[0].by > aliens_array[j].y)
							&& (bullets_array[0].bx >= aliens_array[j].x)
							&& (bullets_array[0].bx < aliens_array[j].x + 10)) {
						aliens_array[j].active = 0;
					}
					for (uint8_t i = 0; i < bullets_array[0].by; i++) {
						gotoxy(bullets_array[0].bx, i);
						printf("%c", 219);
					}
					for (uint8_t i = 0; i < bullets_array[0].by; i++) {
						gotoxy(bullets_array[0].bx, i);
						printf(" ");
					}
				}
				break;
			}
		}
		break;
	}
}

void update_bullet_pos() {
	for (uint8_t i = 0; i < MAX_BULLETS; i++) {
		if (((cs + 11) % MAX_BULLETS) == i) {
			if (bullets_array[i].active) {
				// Delete bullet
				gotoxy(bullets_array[i].bx, bullets_array[i].by);
				printf(" ");

				// Calculate new position
				bullets_array[i].bx += bullets_array[i].vx;
				bullets_array[i].by += bullets_array[i].vy;

				// Check position
				if (bullets_array[i].bx <= 0 || bullets_array[i].by <= 0
						|| bullets_array[i].bx >= 243
						|| bullets_array[i].by >= 76) {
					bullets_array[i].active = 0;
				} else {
					// Print bullet
					gotoxy(bullets_array[i].bx, bullets_array[i].by);
					printf("%c", 254);
				}
			}
		}
	}
}

void bullet_spawn_correction(bullet bullets_array[MAX_BULLETS], position pos,
		uint8_t i) {
	switch (pos.direction) {
	case 1:
	case 2:
	case 3:
		bullets_array[i].bx += 6;
		bullets_array[i].by += 2;
		break;
	case 4:
		bullets_array[i].bx += 3;
		bullets_array[i].by += 4;
		break;
	case 5:
	case 6:
	case 7:
		bullets_array[i].bx -= 1;
		bullets_array[i].by += 2;
		break;
	case 8:
		bullets_array[i].bx += 3;
		bullets_array[i].by -= 1;
		break;
	}
}

void bullet_direction(position *pos, int8_t direction, uint8_t i) {
	switch (direction) {
	case 1:
		bullets_array[i].vx = 2;
		bullets_array[i].vy = -1;
		break;
	case 2: // Right
		bullets_array[i].vx = 2;
		bullets_array[i].vy = 0;
		break;
	case 3:
		bullets_array[i].vx = 2;
		bullets_array[i].vy = 1;
		break;
	case 4: // Down
		bullets_array[i].vx = 0;
		bullets_array[i].vy = 1;
		break;
	case 5:
		bullets_array[i].vx = -2;
		bullets_array[i].vy = 1;
		break;
	case 6: // Left
		bullets_array[i].vx = -2;
		bullets_array[i].vy = 0;
		break;
	case 7:
		bullets_array[i].vx = -2;
		bullets_array[i].vy = -1;
		break;
	case 8: // Up
		bullets_array[i].vx = 0;
		bullets_array[i].vy = -1;
		break;
	}
}

\end{lstlisting}