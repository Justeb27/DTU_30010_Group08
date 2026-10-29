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

