\begin{lstlisting}[caption = {Basic functions.h}]

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

\end{lstlisting}



\begin{lstlisting}[caption = {Basic functions.c}]

#include <init/basic_functions.h>

void clrscr(void) {
	printf("%c[2J", ESC);
}

void clreol(void) {
	printf("%c[K", ESC);
}

void gotoxy(uint16_t x, uint16_t y) {
	printf("%c[?25l", ESC);
	printf("%c[%d;%d%c", ESC, y, x, 'H');
}

void underline(uint16_t x) {
	if (x == 1) {
		printf("%c[04m", ESC);
	} else {
		printf("%c[24m", ESC);
	}
}

void blink(uint16_t x) {
	if (x == 1) {
		printf("%c[05m", ESC);
	} else {
		printf("%c[25m", ESC);
	}
}

void inverse(uint16_t x) {
	if (x == 1) {
		printf("%c[07m", ESC);
	} else {
		printf("%c[27m", ESC);
	}
}
void clrscraround(int x1, int y1, int x2, int y2) {
    for (int y = y1; y <= y2; y++) {
        for (int x = x1; x <= x2; x++) {
            gotoxy(x, y);
            printf(" ");
        }
    }
}

\end{lstlisting}