#include <graphics/gamestart.h>

void game_start() {
    init_baggrund(); // Initialize the entire background
    init_enemygo();  // Initialize enemies
}
gamestart(uint8_t color_of_stars, uint8_t color_of_meteor,
		uint8_t color_of_alien, uint8_t meteor_speed, uint8_t alien_speed) {
	enemygo(color_of_stars, color_of_meteor, color_of_alien, meteor_speed,
			alien_speed);
}
