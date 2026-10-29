#ifndef INIT_JOYSTICK_READER_H_
#define INIT_JOYSTICK_READER_H_

#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course
#include <stm32f30x.h> // Replace with your specific device header if different
#include <stm32f30x_gpio.h>
#include <stm32f30x_rcc.h>

void configure_adv_joystick(void);
int read_adv_joystick_x(void);
int read_adv_joystick_y(void);
int read_joystick(void);

#endif
