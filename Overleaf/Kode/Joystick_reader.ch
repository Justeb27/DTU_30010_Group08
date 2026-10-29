\begin{lstlisting}[caption = {Joystick reader.h}]

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

\end{lstlisting}







\begin{lstlisting}[caption = {Joystick reader.c}]

#include <init/joystick_reader.h>
#include <stdio.h>
#include <stm32f30x.h>
#include <stm32f30x.h> // Include the STM32 device-specific headers


void configure_adv_joystick(void) {

	// Enable clock for GPIO Port C
	RCC->AHBENR |= RCC_AHBENR_GPIOCEN;

	RCC->CFGR2  &= ~RCC_CFGR2_ADCPRE12;      // Clear ADC12 prescaler bits
	RCC->CFGR2  |=  RCC_CFGR2_ADCPRE12_DIV6; // Set ADC12 prescaler to 6
	RCC->AHBENR |=  RCC_AHBPeriph_ADC12;     // Enable clock for ADC12

	ADC1->CR    =  0x00000000; // Clear CR register
	ADC1->CFGR &=  0xFDFFC007; // Clear ADC1 config register
	ADC1->SQR1 &= ~ADC_SQR1_L; // Clear regular sequence register 1

	ADC1->CR |= 0x10000000; // Enable internal ADC voltage regulator
	for(int i = 0 ; i < 1000 ; i++) {} // Wait for about 16 microsecond

	ADC1->CR |= 0x80000000; // Start ADC1 calibration
	while (!(ADC1->CR & 0x80000000));// Wait for calibration to finish
	for (int i = 0 ; i < 100 ; i++) {} // Wait for a little whil

	ADC1->CR |= 0x00000001; // Enable ADC1 (0x01 -Enable, 0x02 -Disable)
	while (!(ADC1->ISR & 0x00000001));// Wait until ready


	GPIOC->MODER&= ~(0x00000003 << (2 * 2));
	GPIOC->MODER|=  (0x00000000 << (2 * 2));

	GPIOC->MODER&= ~(0x00000003 << (3 * 2));
	GPIOC->MODER|=  (0x00000000 << (3 * 2));

	GPIOC->PUPDR &= ~(0x3 << (2 * 2)); // Clear pull-up/pull-down register for PC2
	GPIOC->PUPDR |= (0x2 << (2 * 2));  // Enable pull-down for PC2

	GPIOC->PUPDR &= ~(0x3 << (3 * 2)); // Clear pull-up/pull-down register for PC3
	GPIOC->PUPDR |= (0x2 << (3 * 2));  // Enable pull-down for PC3

	//buttons setup

	// Set PC10 and PC12 to input mode
	GPIOC->MODER &= ~(0x3 << (10 * 2)); // Clear mode register for PC10
	GPIOC->MODER &= ~(0x3 << (12 * 2)); // Clear mode register for PC12

	// Configure pull-down resistors for PC10 and PC12
	GPIOC->PUPDR &= ~(0x3 << (10 * 2)); // Clear pull-up/pull-down register for PC10
	GPIOC->PUPDR |= (0x2 << (10 * 2));  // Enable pull-down for PC10

	GPIOC->PUPDR &= ~(0x3 << (12 * 2)); // Clear pull-up/pull-down register for PC12
	GPIOC->PUPDR |= (0x2 << (12 * 2));  // Enable pull-down for PC12

}

int read_adv_joystick_y(void) {  // Læser joystick i y-retningen
	ADC_RegularChannelConfig(ADC1, ADC_Channel_8, 1, ADC_SampleTime_1Cycles5);
	ADC_StartConversion(ADC1); // Start ADC read
	while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0); // Wait for ADC read

	return ADC_GetConversionValue(ADC1);// Read the ADCvalue
}

int read_adv_joystick_x(void) {  //Læser joystick i x retningen
	ADC_RegularChannelConfig(ADC1, ADC_Channel_9, 1, ADC_SampleTime_1Cycles5);
	ADC_StartConversion(ADC1); // Start ADC read
	while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0); // Wait for ADC read

	return ADC_GetConversionValue(ADC1);// Read the ADCvalue
}

int read_joystick(void) {  //Denne funktion outputter joystick inputne i 8 forskellige retninger (efter uret)
	int y = read_adv_joystick_y();
	int x = read_adv_joystick_x();
	int old_value = 0;
	int new_value = 0;
	if ((1800 < x) & (x < 2000) & (1800 < y) & (y < 2000)) {
		new_value = 0;
	}
	if ((1700 < x) & (x < 2200) & (2900 < y)) {
		new_value = 8;
	}
	if ((3000 < x) & (1700 < y) & (y < 2200)) {
		new_value = 2;
	}
	if ((1700 < x) & (x < 2100) & (y < 1100)) {
		new_value = 4;
	}
	if ((x < 1100) & (1700 < y) & (y < 2200)) {
		new_value = 6;
	}
	if ((2100 < x) & (2500 < y)) {
		new_value = 1;
	}
	if ((2200 < x) & (y < 1600)) {
		new_value = 3;
	}
	if ((x < 1500) & (y < 1500)) {
		new_value = 5;
	}
	if ((x < 1500) & (2500 < y)) {
		new_value = 7;
	}

	if (new_value != old_value) {
		old_value = new_value;
		return new_value;
	}
}

int read_button(void) {		// Returnerer inputten fra de 2 knapper
    if (GPIOC->IDR & (1 << 12)) { // Check if PC12 is high
        return 1; // Button on PC12 pressed
    }
    if (GPIOC->IDR & (1 << 10)) { // Check if PC10 is high
        return 2; // Button on PC10 pressed
    }
    else {
    	return 0; // No button pressed
    }
}

\end{lstlisting}