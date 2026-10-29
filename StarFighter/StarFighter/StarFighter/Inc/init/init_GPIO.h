#ifndef INIT_INIT_GPIO_H_
#define INIT_INIT_GPIO_H_

#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course
#include <init/joystick_reader.h>

void configure_pins(void);
void configure_joystick(void);
void configure_led(void);
void set_led(uint8_t R, uint8_t G, uint8_t B);

#endif
