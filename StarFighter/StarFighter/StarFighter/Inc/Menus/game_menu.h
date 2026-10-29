#ifndef MENUS_GAME_MENU_H_
#define MENUS_GAME_MENU_H_

#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h>

#include <stdint.h>
#include <features/boss_key.h>
#include <features/bullets.h>
#include <features/collision_detection.h>
#include <features/gravity.h>
#include <features/led.h>
#include <features/movement.h>
#include <features/spawn_powerups.h>
#include <graphics/background.h>
#include <graphics/enemy.h>
#include <graphics/lcd.h>
#include <graphics/spaceship.h>
#include <graphics/title.h>
#include <init/joystick_reader.h>

void game_menu(void);
void game_over(uint8_t *nav);

#endif /* MENUS_GAME_MENU_H_ */
