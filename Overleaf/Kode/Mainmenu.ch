\begin{lstlisting}[caption = {Mainmenu.h}]

#ifndef MENUS_MAIN_MENU_H_
#define MENUS_MAIN_MENU_H_

#include <stdint.h>

void windows(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, char str[],
		uint8_t z);
void main_menu(uint8_t *nav);

#endif /* MENUS_MAIN_MENU_H_ */

\end{lstlisting}



\begin{lstlisting}[caption = {Mainmenu.c}]
#define ESC 0x1B
#include <stdint.h>

void main_menu(uint8_t *nav) {

	init_baggrund_menu();
	title_header(5, 10);

	start_title(243 / 3 - 18, 55);
	help_title(243 * 2 / 3 - 17, 55);

	windows(243 / 3 - 20, 55 - 2, 243 / 3 + 20, 60 + 2, 0);
	windows(243 * 2 / 3 - 19, 55 - 2, 243 * 2 / 3 + 19, 60 + 2, 0);

	int z = 2;
	while (1) {

		if (read_joystick() == 2) {
			z = z - 1;
		}
		if (read_joystick() == 6) {
			z = z + 1;
		}
		if (z < 1) {
			z = 1;
		}
		if (z > 2) {
			z = 2;
		}

		if (z == 1) {
			gotoxy(243 / 3 - 20, 63);
			printf("                                         ");
			gotoxy(243 * 2 / 3 - 19, 63);
			printf("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

		}
		if (z == 2) {
			gotoxy(243 * 2 / 3 - 19, 63);
			printf("                                         ");
			gotoxy(243 / 3 - 20, 63);
			printf("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		}
		if ((z == 2) & (read_button() == 2)) {
			//Launch game
			*nav = 2;
			clrscr(1);
			break;
		}
		if ((z == 1) & (read_button() == 2)) {
			//Launch Help
			*nav = 1;
			clrscr(1);
			break;
		}
	}

}

void windows(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, char *str,
		uint8_t z) {
	if (z == 1) {
		printf("%c[05m", ESC);
	}

	gotoxy(x1, y1); // Move to the starting position
	int i;
	for (i = 1; i < y2 - y1; i++) {
		gotoxy(x1, y1 + i);            // Left side
		printf("%c", 179);

		gotoxy(x2, y1 + i);       // Right side
		printf("%c", 179);
	}

	// Draw top and bottom sides
	for (i = 1; i < x2 - x1; i++) {
		gotoxy(x1 + i, y1);            // Top side
		printf("%c", 196);

		gotoxy(x1 + i, y2);        // Bottom side
		printf("%c", 196);
	}
	// Draw corners
	gotoxy(x1, y1);                    // Top-left corner
	printf("%c", 218);                 // Top-left corner character

	gotoxy(x2, y1);               // Top-right corner
	printf("%c", 191);                 // Top-right corner character

	gotoxy(x1, y2);                // Bottom-left corner
	printf("%c", 192);                 // Bottom-left corner character

	gotoxy(x2, y2);           // Bottom-right corner
	printf("%c", 217);                 // Bottom-right corner character

	if (z == 1) {
		printf("%c[00m", ESC);
	}
}
\end{lstlisting}