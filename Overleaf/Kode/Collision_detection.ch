\begin{lstlisting}[caption = {Collision detection.h}]

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

\end{lstlisting}

\begin{lstlisting}[caption = {Collision detection.c}]

#include <features/collision_detection.h>

void bullet_collision(void) {
	for (uint8_t i = 0; i < MAX_BULLETS; i++) {
		for (uint8_t j = 0; j < MAX_METEORS; j++) {
			if (bullets_array[i].active) {
				// Meteor
				if ((bullets_array[i].bx >= meteors_array[j].x)
						&& (bullets_array[i].bx < meteors_array[j].x + 20)
						&& (bullets_array[i].by >= meteors_array[j].y)
						&& (bullets_array[i].by < meteors_array[j].y + 10)) {
					bullets_array[i].active = 0;
					gotoxy(bullets_array[i].bx, bullets_array[i].by);
					fgcolor(8);
					printf("#");
					resetbgcolor();
				}
				// Aliens
				for (uint8_t j = 0; j < MAX_ALIENS; j++) {
					if ((bullets_array[i].bx >= aliens_array[j].x)
							&& (bullets_array[i].bx < aliens_array[j].x + 5)
							&& (bullets_array[i].by >= aliens_array[j].y)
							&& (bullets_array[i].by < aliens_array[j].y + 5)) {
						bullets_array[i].active = 0;
						remove_alien(j);

						gotoxy(bullets_array[i].bx, bullets_array[i].by);
						printf(" ");
					}
				}
			}
		}
	}
}

void spaceship_collision(position pos, uint8_t *health, uint32_t *last_damage_time) {
	// Meteor
	for (uint8_t i = 0; i < MAX_METEORS; i++) {
		if ((pos.x + 5 >= meteors_array[i].x)
				&& (pos.x < meteors_array[i].x + 20)
				&& (pos.y + 5 >= meteors_array[i].y)
				&& (pos.y < meteors_array[i].y + 10)) {
			// Damage delay
			if (cs - *last_damage_time < DAMAGE_DELAY) {
				return;
			}
			*last_damage_time = cs; // Update last fire time
			*health = 0;
		}
	}

	// Aliens
	for (uint8_t i = 0; i < MAX_ALIENS; i++) {
		if ((pos.x + 5 >= aliens_array[i].x) && (pos.x < aliens_array[i].x + 5)
				&& (pos.y + 5 >= aliens_array[i].y)
				&& (pos.y < aliens_array[i].y + 5)) {
			remove_alien(i);
			// Damage delay
			if (cs - *last_damage_time < DAMAGE_DELAY) {
				return;
			}
			*last_damage_time = cs; // Update last fire time
			(*health)--;
		}
	}
}

void powerup_collision(position pos, uint8_t *health, bullet_type *typ,
		uint32_t *powerup_time) {
	if (powerups_array[0].active) {
		if (cs % 20 == 0) {
			// Spaceship
			if ((pos.x + 5 >= powerups_array[0].x)
					&& (pos.x <= powerups_array[0].x + 16)
					&& (pos.y + 5 >= powerups_array[0].y)
					&& (pos.y <= powerups_array[0].y + 8)) {
				remove_powerups();
				switch (powerups_array[0].powerup_effect) {
				case 0:
					typ->type = 1;
					*powerup_time = cs;
					break;
				case 1:
					typ->type = 2;
					*powerup_time = cs;
					break;
				case 2:
					if (*health < 3) {
						(*health)++;
					}
					break;
				}
			}

			// Aliens
			for (uint8_t i = 0; i < MAX_ALIENS; i++) {
				if ((aliens_array[i].x + 5 >= powerups_array[0].x)
						&& (aliens_array[i].x <= powerups_array[0].x + 16)
						&& (aliens_array[i].y + 5 >= powerups_array[0].y)
						&& (aliens_array[i].y <= powerups_array[0].y + 8)) {
					remove_powerups();
				}
			}
		}
	}
}

\end{lstlisting}