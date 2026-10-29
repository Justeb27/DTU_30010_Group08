#ifndef GRAPHICS_LCD_H_
#define GRAPHICS_LCD_H_

#include <30010_io.h>
#include <string.h>
#include <charset.h>
#include <init/timer.h>
#include <stdint.h>
#include <features/movement.h>
#include <features/bullets.h>
#include <Menus/game_menu.h>

void heart(int start);
void remove_heart(int start);
void lcd_write_string(const char *str, int start);
void points_counter(int start, uint8_t alien_speed);
void shooting_modes_lcd(void);
void point_loop(uint8_t alien_speed);
void shooting_mode_box(bullet_type typ);
void remove_shooting_mode_box(bullet_type typ);
void hearts_left(uint8_t health);

void lcd_starter(uint8_t alien_speed);

void run_lcd(uint8_t health, bullet_type typ, uint8_t alien_speed);

#endif
