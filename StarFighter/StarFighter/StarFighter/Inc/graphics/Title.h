#ifndef GRAPHICS_TITLE_H_
#define GRAPHICS_TITLE_H_

#include <graphics/title.h>
#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course
#include <init/basic_functions.h>

void title_header(uint8_t x, uint8_t y);
void start_title(uint8_t x, uint8_t y);
void help_title(uint8_t x, uint8_t y);
void gameover_title(uint8_t x, uint8_t y);
void gameover_text(uint8_t x, uint8_t y);

#endif /* GRAPHICS_TITLE_H_ */
