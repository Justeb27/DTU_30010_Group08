\begin{lstlisting}[caption = {Background.h}]

#ifndef GRAPHICS_BACKGROUND_H_
#define GRAPHICS_BACKGROUND_H_

#include <stdint.h>
#include <stdio.h>

#include <parameters.h>

// Function declarations
void draw_background();
void big_planet();
void set_terminal_background();
void stars();
void init_background();
void init_background_section();
void init_baggrund_menu();

#endif /* BACKGROUND_H_ */

\end{lstlisting}





\begin{lstlisting}[caption = {Background.c}]

#include <graphics/background.h>

void init_background_section(int x1, int y1, int x2, int y2) {
	stars(x1, y1, x2, y2);

	/*
	 if (x1 <= 56 && x2 >= 48 && y1 <= 28 && y2 >= 20) {
	 //big_planet(48, 20, 4, 2);
	 }

	 if (x1 <= 112 && x2 >= 104 && y1 <= 44 && y2 >= 36) {
	 //big_planet(104, 36, 3, 1);
	 }

	 if (x1 <= 168 && x2 >= 160 && y1 <= 60 && y2 >= 52) {
	 //big_planet(160, 52, 5, 3);
	 }
	 */
}

void init_background() {
	stars(1, 1, 243, 76);
}

void init_baggrund_menu() {
	stars(1, 1, 243, 76, 6);
	big_planet(200, 3, 4, 2);
	big_planet(59, 3, 1, 3);
	big_planet(30, 53, 3, 4);
	big_planet(100, 45, 2, 7);
	big_planet(210, 45, 5, 6);
}

void stars(int x1, int y1, int x2, int y2, int c) {
	int star_positions[][2] = { { 11, 11 }, { 17, 12 }, { 20, 9 }, { 27, 11 }, {
			39, 17 }, { 50, 25 }, { 49, 31 }, { 56, 36 }, { 74, 43 },
			{ 80, 39 }, { 76, 53 }, { 86, 14 }, { 93, 19 }, { 99, 22 }, { 116,
					30 }, { 123, 38 }, { 126, 19 }, { 140, 20 }, { 138, 33 }, {
					153, 36 }, { 163, 43 }, { 168, 25 }, { 174, 8 },
			{ 177, 14 }, { 185, 17 }, { 191, 19 }, { 204, 32 }, { 213, 27 }, {
					214, 58 }, { 228, 11 }, { 231, 27 }, { 239, 19 },
			{ 15, 68 }, { 37, 71 }, { 53, 71 }, { 83, 74 }, { 99, 71 }, { 124,
					68 }, { 137, 71 }, { 154, 76 }, { 178, 74 }, { 191, 69 }, {
					212, 61 }, { 236, 72 }, { 22, 17 }, { 50, 44 }, { 83, 74 } };

	int num_stars = sizeof(star_positions) / sizeof(star_positions[0]);

	fgcolor(COLOR_OF_STARS);

	for (int i = 0; i < num_stars; i++) {
		int x = star_positions[i][0];
		int y = star_positions[i][1];

		if (x >= x1 && x <= x2 && y >= y1 && y <= y2) {
			gotoxy(x, y);
			printf("*");
		}
	}

	resetbgcolor();
}

void big_planet(int x, int y, int c1, int c2) {
	//1 line
	gotoxy(x, y);
	int i;
	for (i = 0; i < 5; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 5, y);
	bgcolor(c2);
	printf("%c", 32);

	//2 line
	gotoxy(x - 2, y + 1);
	for (i = 0; i < 6; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 4, y + 1);
	for (i = 0; i < 4; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}

	//3 line
	gotoxy(x - 4, y + 2);
	for (i = 0; i < 2; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}
	gotoxy(x - 2, y + 2);
	for (i = 0; i < 7; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 5, y + 2);
	for (i = 0; i < 5; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}

	//4 line
	gotoxy(x - 4, y + 3);
	for (i = 0; i < 3; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}
	gotoxy(x - 1, y + 3);
	for (i = 0; i < 7; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 6, y + 3);
	for (i = 0; i < 4; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}

	//5 line
	gotoxy(x - 4, y + 4);
	for (i = 0; i < 4; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}
	gotoxy(x, y + 4);
	for (i = 0; i < 10; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}

	//6 line
	gotoxy(x - 2, y + 5);
	for (i = 0; i < 3; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}
	gotoxy(x + 1, y + 5);
	for (i = 0; i < 5; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 6, y + 5);
	for (i = 0; i < 2; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}

	//7 line
	gotoxy(x, y + 6);
	for (i = 0; i < 1; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}
	gotoxy(x + 1, y + 6);
	for (i = 0; i < 3; i++) {
		bgcolor(c1);
		printf("%c", 32);
	}
	gotoxy(x + 4, y + 6);
	for (i = 0; i < 2; i++) {
		bgcolor(c2);
		printf("%c", 32);
	}

	resetbgcolor();

}

\end{lstlisting}