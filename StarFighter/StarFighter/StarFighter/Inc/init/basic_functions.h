#ifndef INIT_BASIC_FUNCTIONS_H_
#define INIT_BASIC_FUNCTIONS_H_

#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course

#define ESC 0x1B

void clrscr(void);
void clreol(void);
void gotoxy(uint16_t x, uint16_t y);
void underline(uint16_t x);
void blink(uint16_t x);
void inverse(uint16_t x);
void clrscraround();

#endif
