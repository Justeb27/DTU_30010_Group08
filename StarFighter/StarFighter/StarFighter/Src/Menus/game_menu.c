#include <Menus/game_menu.h>

void game_menu(void) {
	// Initialize game variables
	position pos = { 243 >> 2, 76 >> 1, 3 }; // Spawn to in the middle to the left
	position oldpos = { };
	cs = 0;
	bullet_type typ = { 0 };
	uint32_t powerup_time = 0;
	uint32_t last_damage_time = 0;
	uint32_t last_spawn_time = 0;
	uint32_t last_meteor_time = 0;
	uint32_t last_powerup_time = 0;
	uint8_t health = 3;
	uint8_t alien_speed = 15;
	lcd_init(); //Initialize the lcd display

	// Initialize game features
	init_enemy_state();
	init_bullets();
	init_background();
	draw_spaceship(pos, 1);
	lcd_starter(alien_speed);

	// Game while-loop
	while (1) {
		// Increase alien speed
		if (cs % 2500 == 0) {
			alien_speed--;
		}

		// Game updates
		enemy_go(&health, &last_spawn_time, &last_meteor_time,
				&last_damage_time, alien_speed);
		movement(&pos, &oldpos, typ);
		bullet_collision();
		spaceship_collision(pos, &health, &last_damage_time);
		update_bullet_pos();
		gravity(&pos, bullets_array);
		update_led(health);
		run_lcd(health, typ, alien_speed);
		spawn_powerups(&typ, powerup_time, &last_powerup_time);
		powerup_collision(pos, &health, &typ, &powerup_time);
		boss_key(cs);

		// Death
		if (health == 0) {
			break;
		}
	}
}

void game_over(uint8_t *nav) { // Game over
	// Initialize game over
	init_background();
	gameover_title(50, 28);
	gameover_text(40, 52);

	// Game over while-loop
	while (1) {
		if ((read_button() == 2) | (read_button() == 1)) {
			*nav = 0;
			clrscr();
			break;
		}
	}
}
