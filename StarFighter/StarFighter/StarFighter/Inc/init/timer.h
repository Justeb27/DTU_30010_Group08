#ifndef INIT_TIMER_H_
#define INIT_TIMER_H_

#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course
#include <init/init_GPIO.h>

volatile uint32_t cs;

void timer15(void);
void TIM1_BRK_TIM15_IRQHandler(void);
void reset_timer(void);
void running(uint8_t toggle);

#endif
