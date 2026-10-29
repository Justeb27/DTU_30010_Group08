#ifndef GRAPHICS_POWERUP_H_
#define GRAPHICS_POWERUP_H_

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <init/basic_functions.h>
#include <graphics/background.h>
#include <init/timer.h>
#include <graphics/enemy.h>
#include <graphics/ansi.h>
#include <features/movement.h>

void drawwindow(uint8_t c);
void powerup(uint8_t color);

#endif /* GRAPHICS_POWERUP_H_ */
