#ifndef GRAPHICS_GAMESTART_H_
#define GRAPHICS_GAMESTART_H_

#include <stdlib.h>
#include <string.h>

#include <graphics/enemy.h>
#include <init/basic_functions.h>
#include <graphics/background.h>

gamestart(uint8_t color_of_stars, uint8_t color_of_meteor,
		uint8_t color_of_alien, uint8_t meteor_speed, uint8_t alien_speed);

#endif
