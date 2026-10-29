\begin{lstlisting}[caption = {init GPIO.h}]

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

\end{lstlisting}



\begin{lstlisting}[caption = {init GPIO.c}]

#include <init/init_GPIO.h>

void configure_pins(void) {
	// Enable clock for GPIO Port A
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN;

	// Set pin PA0 to input
	GPIOA->MODER &= ~(0x3 << (0 * 2)); // Clear mode register for PA0
	GPIOA->PUPDR &= ~(0x3 << (0 * 2)); // Clear pull-up/pull-down register for PA0
	GPIOA->PUPDR |= (0x2 << (0 * 2));  // Set pull-down for PA0
}

void configure_joystick(void) {
	// Enable clocks for GPIO ports
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN | RCC_AHBENR_GPIOBEN | RCC_AHBENR_GPIOCEN;

	// Set joystick pins to input mode
	GPIOC->MODER &= ~(0x3 << (0 * 2)); // PC0 (Right)
	GPIOA->MODER &= ~(0x3 << (4 * 2)); // PA4 (Up)
	GPIOB->MODER &= ~(0x3 << (5 * 2)); // PB5 (Center)
	GPIOC->MODER &= ~(0x3 << (1 * 2)); // PC1 (Left)
	GPIOB->MODER &= ~(0x3 << (0 * 2)); // PB0 (Down)

	// Configure pull-down resistors for joystick pins
	GPIOC->PUPDR |= (0x2 << (0 * 2)); // PC0
	GPIOA->PUPDR |= (0x2 << (4 * 2)); // PA4
	GPIOB->PUPDR |= (0x2 << (5 * 2)); // PB5
	GPIOC->PUPDR |= (0x2 << (1 * 2)); // PC1
	GPIOB->PUPDR |= (0x2 << (0 * 2)); // PB0
}

uint8_t mcu_read_joystick(void) {
	uint8_t state = 0;

	// Read joystick inputs and set bits accordingly
	state |= (GPIOA->IDR & (1 << 4)) ? (1 << 0) : 0; // Up
	state |= (GPIOB->IDR & (1 << 0)) ? (1 << 1) : 0; // Down
	state |= (GPIOC->IDR & (1 << 1)) ? (1 << 2) : 0; // Left
	state |= (GPIOC->IDR & (1 << 0)) ? (1 << 3) : 0; // Right
	state |= (GPIOB->IDR & (1 << 5)) ? (1 << 4) : 0; // Center

	return state;
}

void configure_led(void) {
	// Enable clocks for GPIO ports
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN | RCC_AHBENR_GPIOBEN | RCC_AHBENR_GPIOCEN;

	// Configure PB4 (Red)
	GPIOB->MODER &= ~(0x3 << (4 * 2)); // Clear mode bits
	GPIOB->MODER |= (0x1 << (4 * 2)); // Set PB4 as output

	// Configure PC7 (Green)
	GPIOC->MODER &= ~(0x3 << (7 * 2)); // Clear mode bits
	GPIOC->MODER |= (0x1 << (7 * 2)); // Set PC7 as output

	// Configure PA9 (Blue)
	GPIOA->MODER &= ~(0x3 << (9 * 2)); // Clear mode bits
	GPIOA->MODER |= (0x1 << (9 * 2)); // Set PA9 as output
}

void set_led(uint8_t R, uint8_t G, uint8_t B) {
	// Turn off all LEDs
	GPIOB->ODR |= (1 << 4); // Turn off Red
	GPIOC->ODR |= (1 << 7); // Turn off Green
	GPIOA->ODR |= (1 << 9); // Turn off Blue

	// Turn on LEDs based on arguments
	if (R) {
		GPIOB->ODR &= ~(1 << 4); // Turn on Red
	}
	if (G) {
		GPIOC->ODR &= ~(1 << 7); // Turn on Green
	}
	if (B) {
		GPIOA->ODR &= ~(1 << 9); // Turn on Blue
	}
}

\end{lstlisting}