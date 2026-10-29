\begin{lstlisting}[caption = {Powerups.h}]

#ifndef GRAPHICS_POWERUP_H_
#define GRAPHICS_POWERUP_H_

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <init/basic_functions.h>
#include <graphics/background.h>
#include <init/timer.h>
#include <graphics/enemy.h>
#include <graphics/ansi.h>
#include <features/movement.h>

void drawwindow(uint8_t c);
void powerup(uint8_t color);

#endif /* GRAPHICS_POWERUP_H_ */

\end{lstlisting}




\begin{lstlisting}[caption = {Powerups.c}]

#include <graphics/powerup.h>  // Inkluder headeren for grafikdrivere
#include <init/basic_functions.h>

void powerup(uint8_t color) {
	fgcolor(color);

	// Beregn midten af vinduet (fast størrelse 16x8)
	int center_x = powerups_array[0].x + 8;  // Halvdelen af bredden
	int center_y = powerups_array[0].y + 4;  // Halvdelen af højden
	drawwindow(color);
	switch (powerups_array[0].powerup_effect) {
	case 0: //Shotgun
		gotoxy(center_x, center_y + 2);
		printf("%c", 92);
		gotoxy(center_x, center_y);
		printf("%c", 45);
		gotoxy(center_x + 1, center_y);
		printf("%c", 62);
		gotoxy(center_x, center_y - 2);
		printf("%c", 47);

		break;

	case 1: //Laser
		gotoxy(center_x - 3, center_y);
		printf("%c", 45);
		gotoxy(center_x - 2, center_y);
		printf("%c", 45);
		gotoxy(center_x - 1, center_y);
		printf("%c", 45);
		gotoxy(center_x, center_y);
		printf("%c", 45);
		gotoxy(center_x + 1, center_y);
		printf("%c", 45);
		gotoxy(center_x + 2, center_y);
		printf("%c", 45);
		gotoxy(center_x + 3, center_y);
		printf("%c", 45);

		break;

	case 2: //hjerte
		gotoxy(center_x, center_y - 2);
		printf("%c", 47);
		gotoxy(center_x - 1, center_y - 2);
		printf("%c", 92);
		gotoxy(center_x - 2, center_y - 3);
		printf("%c", 95);
		gotoxy(center_x + 1, center_y - 3);
		printf("%c", 95);
		gotoxy(center_x + 2, center_y - 2);
		printf("%c", 92);
		gotoxy(center_x - 3, center_y - 2);
		printf("%c", 47);
		gotoxy(center_x - 3, center_y - 1);
		printf("%c", 92);
		gotoxy(center_x - 2, center_y);
		printf("%c", 92);
		gotoxy(center_x - 1, center_y + 1);
		printf("%c", 92);
		gotoxy(center_x, center_y + 1);
		printf("%c", 47);
		gotoxy(center_x + 1, center_y);
		printf("%c", 47);
		gotoxy(center_x + 2, center_y - 1);
		printf("%c", 47);

		break;
	}

	resetbgcolor();
}









// Funktion til at tegne en firkant
void drawwindow(uint8_t c) {
	const int width = 16;  // Fast bredde
	const int height = 8;  // Fast højde

	fgcolor(c);  // Sæt farven

	// Øverste kant
	gotoxy(powerups_array[0].x, powerups_array[0].y);
	for (int i = 0; i < width; i++) {
		printf("%c", 205);  // Tegn horisontal linje (ASCII: 205 = ═)
	}

	// Sider og indhold
	for (int i = 1; i < height - 1; i++) {
		gotoxy(powerups_array[0].x, powerups_array[0].y + i);  // Venstre side
		printf("%c", 186);         // Vertikal linje (ASCII: 186 = ║)

		// Flyt til højre kant
		gotoxy(powerups_array[0].x + width - 1, powerups_array[0].y + i);
		printf("%c", 186);         // Vertikal linje (ASCII: 186 = ║)
	}

	// Nederste kant
	gotoxy(powerups_array[0].x, powerups_array[0].y + height - 1);
	for (int i = 0; i < width; i++) {
		printf("%c", 205);  // Tegn horisontal linje (ASCII: 205 = ═)
	}

	// Tegn hjørnerne
	gotoxy(powerups_array[0].x, powerups_array[0].y);                       // Øverste venstre hjørne
	printf("%c", 201);                          // ASCII: 201 = ╔

	gotoxy(powerups_array[0].x + width - 1, powerups_array[0].y);           // Øverste højre hjørne
	printf("%c", 187);                          // ASCII: 187 = ╗

	gotoxy(powerups_array[0].x, powerups_array[0].y + height - 1);          // Nederste venstre hjørne
	printf("%c", 200);                          // ASCII: 200 = ╚

	gotoxy(powerups_array[0].x + width - 1, powerups_array[0].y + height - 1); // Nederste højre hjørne
	printf("%c", 188);                          // ASCII: 188 = ╝

	resetbgcolor();
}

\end{lstlisting}