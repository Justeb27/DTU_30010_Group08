#ifndef GRAPHICS_SPACESHIP_H_
#define GRAPHICS_SPACESHIP_H_

#include <stdint.h>
#include <stdio.h>

#include <graphics/ansi.h>
#include <features/movement.h>

void draw_spaceship(position pos, uint8_t buffer);
void draw_spaceship_right(position pos);
void draw_spaceship_left(position pos);
void draw_spaceship_up(position pos);
void draw_spaceship_down(position pos);

#endif /* SPACESHIP_H_ */
