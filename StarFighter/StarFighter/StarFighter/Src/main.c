#include "stm32f30x_conf.h" // STM32 config
#include "30010_io.h"		// Input/output library for this course

#include <features/boss_key.h>
#include <features/bullets.h>
#include <features/collision_detection.h>
#include <features/gravity.h>
#include <features/led.h>
#include <features/movement.h>
#include <graphics/ansi.h>
#include <graphics/background.h>
#include <graphics/enemy.h>
#include <graphics/gamestart.h>
#include <graphics/lcd.h>
#include <graphics/spaceship.h>
#include <graphics/Title.h>
#include <init/basic_functions.h>
#include <init/init_GPIO.h>
#include <init/joystick_reader.h>
#include <init/timer.h>
#include <Menus/game_menu.h>
#include <Menus/help_menu.h>
#include <Menus/Main_menu.h>

int main(void) {
	uart_init(345600);
	// initialize everything
	printf("\033[8;76;243t"); // Resolution to: 243x76
	clrscr();
	configure_pins();
	configure_joystick();
	configure_adv_joystick();
	configure_led();
	timer15();
	lcd_init();

	// Main-loop

	uint8_t nav = 0;

	while (1) {
		if (nav == 0) {
			main_menu(&nav);
		}
		if (nav == 1) {
			help_menu(&nav);
		}
		if (nav == 2) {
			game_menu();
			game_over(&nav);
		}
	}
}
