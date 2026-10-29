\begin{lstlisting}[caption = {Timer.h}]

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

\end{lstlisting}





\begin{lstlisting}[caption = {Timer.c}]

#include <init/timer.h>

void timer15(void) {
	RCC->APB2ENR |= RCC_APB2Periph_TIM15; // Enable clock line to timer 15;
	TIM15->CR1 = 0x0000; // Configure timer 15
	TIM15->ARR = 0x027F; // Set reload value
	TIM15->PSC = 0x03E7; // Set prescale value //0x03E7
	TIM15->CR1 = 0x0001; // Start timer 15

	TIM15->DIER |= 0x0001;

	NVIC_SetPriority(TIM1_BRK_TIM15_IRQn, 0x1); // Set interrupt priority
	NVIC_EnableIRQ(TIM1_BRK_TIM15_IRQn); // Enable interrupt
}

void TIM1_BRK_TIM15_IRQHandler(void) {
	cs++;
	TIM15->SR &= ~0x0001; // Clear interrupt bit
}

void reset_timer(void) { // resets the timer to 0
	cs = 0;
	TIM15->CR1 = 0x0000;
}

void running(uint8_t toggle) {
	if (toggle == 0) {
		TIM15->CR1 |= TIM_CR1_CEN; // Start
	} else {
		TIM15->CR1 &= ~TIM_CR1_CEN; // Stop
	}
}

\end{lstlisting}

