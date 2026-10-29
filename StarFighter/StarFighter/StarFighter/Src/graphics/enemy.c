#include <graphics/enemy.h>

void init_enemy_state(void) {
	for (int i = 0; i < MAX_ALIENS; i++) {
		aliens_array[i].active = 0;
	}
	for (int i = 0; i < MAX_METEORS; i++) {
		meteors_array[i].active = 0;
	}
}

void enemy_go(uint8_t *health, uint32_t *last_spawn_time, uint32_t *last_meteor_time,
		uint32_t *last_damage_time, uint8_t alien_speed) {
	// METEORS
	for (int i = 0; i < MAX_METEORS; i++) {
		if ((cs + 1) % 100 == 0) {
			if (!meteors_array[i].active) {
				spawn_meteor(last_meteor_time);
			}
		}
		if ((cs + 3) % METEOR_SPEED == i) {
			if (meteors_array[i].active) {
				// Delete back of meteor
				if (meteors_array[i].x < 243 - 20) {
					for (int j = 0; j < 10; j++) {
						gotoxy(meteors_array[i].x + 20, meteors_array[i].y + j);
						printf(" ");
					}
					init_background_section(meteors_array[i].x + 20,
							meteors_array[i].y, meteors_array[i].x + 20,
							meteors_array[i].y + 10, COLOR_OF_STARS);
				}

				// Calculate new position
				meteors_array[i].x--;

				// Check position
				if (meteors_array[i].x <= -20) {
					meteors_array[i].active = 0;
				} else {
					// Print front meteor
					if (meteors_array[i].x > 0) {
						fgcolor(COLOR_OF_METEORS);
						for (uint8_t j = 0; j < 10; j++) {
							gotoxy(meteors_array[i].x, meteors_array[i].y + j);
							printf("#");
						}
						resetbgcolor();
					}
				}
			}
		}
	}

// ALIENS
	for (int i = 0; i < MAX_ALIENS; i++) {
		if ((cs + 5) % alien_speed == i) {
			if (!aliens_array[i].active) {
				spawn_alien(last_spawn_time);
			}
			if (aliens_array[i].active) {
				// Delete back of alien
				if (aliens_array[i].x < 243 - 4) {
					for (int j = 0; j < 4; j++) {
						gotoxy(aliens_array[i].x + 4, aliens_array[i].y + j);
						printf(" ");
					}
					init_background_section(aliens_array[i].x + 4,
							aliens_array[i].y, aliens_array[i].x + 4,
							aliens_array[i].y + 4, COLOR_OF_STARS);
				}

				// Calculate new position
				aliens_array[i].x--;

				// Check position
				if (aliens_array[i].x <= -4) {
					aliens_array[i].active = 0;
					last_damage_time = cs; // Update last fire time
					(*health)--;
				} else {
					// Print alien
					fgcolor(COLOR_OF_ALIENS);
					gotoxy(aliens_array[i].x + 1, aliens_array[i].y);
					printf("O");
					for (uint8_t j = 1; j < 4; j++) {
						gotoxy(aliens_array[i].x, aliens_array[i].y + j);
						printf("O");
					}
					gotoxy(aliens_array[i].x + 4, aliens_array[i].y + 3);
					printf("O");
					gotoxy(aliens_array[i].x + 1, aliens_array[i].y + 3);
					printf("   ");
					gotoxy(aliens_array[i].x + 4, aliens_array[i].y);
					printf(" ");

					resetbgcolor();
				}
			}
		}
	}
}

void spawn_meteor(uint32_t *last_meteor_time) {
	// Spawn delay
	if (cs - *last_meteor_time < METEOR_SPAWN_DELAY) {
		return;
	}
	*last_meteor_time = cs; // Update last spawn time

	// Create new meteor
	for (int i = 0; i < MAX_METEORS; i++) {
		if (!meteors_array[i].active) {
			meteors_array[i].x = 243;
			meteors_array[i].y = (cs % 64) + 1;

			meteors_array[i].active = 1; // Activate meteor
			break;
		}
	}
}

void spawn_alien(uint32_t *last_spawn_time) {
	// Spawn delay
	if (cs - *last_spawn_time < ALIEN_SPAWN_DELAY) {
		return;
	}
	*last_spawn_time = cs; // Update last spawn time

	// Create new alien
	for (int i = 0; i < MAX_ALIENS; i++) {
		if (!aliens_array[i].active) {
			// Sæt startposition
			aliens_array[i].x = 243;
			aliens_array[i].y = (cs % 70) + 1;

			// Marker alien som aktiv
			aliens_array[i].active = 1;
			break;
		}
	}
}

void remove_alien(uint8_t i) { // Remove dead aliens
	aliens_array[i].active = 0;
	for (int j = 0; j < 4; j++) {
		gotoxy(aliens_array[i].x, aliens_array[i].y + j);
		printf("      "); // Clear width of 5 for safety
	}
	init_background_section(aliens_array[i].x, aliens_array[i].y,
			aliens_array[i].x + 5, aliens_array[i].y + 5,
			COLOR_OF_STARS);
	aliens_array[i].x = 500;
	aliens_array[i].y = 500;
}
