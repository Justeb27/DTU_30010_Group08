#include <graphics/spaceship.h> // Include the corresponding header for baggrund
#include <init/basic_functions.h>

void draw_spaceship(position pos, uint8_t buffer) {
	if (buffer) {
		switch (pos.direction) {
		case 1:
		case 2:
		case 3:
			draw_spaceship_right(pos);
			break;
		case 4:
			draw_spaceship_down(pos);
			break;
		case 5:
		case 6:
		case 7:
			draw_spaceship_left(pos);
			break;
		case 8:
			draw_spaceship_up(pos);
			break;
		}
	}
}

void draw_spaceship_left(position pos) {
	fgcolor(COLOR_OF_SPACESHIP);

	// 1. linje
	gotoxy(pos.x + 4, pos.y);
	printf("%c", 95);  //print _
	printf("%c", 95);  //print _

	// 2. linje
	gotoxy(pos.x + 1, pos.y + 1);
	printf("%c", 95);  //print _
	printf("%c", 95);  //print _
	printf("%c", 47);  //
	gotoxy(pos.x + 5, pos.y + 1);
	printf("%c", 47);  //

	//3. linje
	gotoxy(pos.x, pos.y + 2);
	printf("%c", 60);  //print _
	printf("%c", 95);  //print _
	printf("%c", 95);  //print _
	printf("%c", 95);  //print _
	printf("%c", 61);  //
	printf("%c", 125);  //

	// 4. linje
	gotoxy(pos.x + 3, pos.y + 3);
	printf("%c", 92);
	printf("%c", 95);
	printf("%c", 92);

	resetbgcolor();
}

void draw_spaceship_right(position pos) {
	fgcolor(COLOR_OF_SPACESHIP);

	// 1. linje
	gotoxy(pos.x, pos.y);
	printf("%c", 95);
	printf("%c", 95);

	// 2. linje
	gotoxy(pos.x, pos.y + 1);
	printf("%c", 92);
	gotoxy(pos.x + 2, pos.y + 1);
	printf("%c", 92);
	printf("%c", 95);
	printf("%c", 95);

	// 3. linje
	gotoxy(pos.x, pos.y + 2);
	printf("%c", 123);
	printf("%c", 61);
	printf("%c", 95);
	printf("%c", 95);
	printf("%c", 95);
	printf("%c", 62);

	// 4. linje
	gotoxy(pos.x, pos.y + 3);
	printf("%c", 47);
	printf("%c", 95);
	printf("%c", 47);

	resetbgcolor();
}

void draw_spaceship_up(position pos) {
	fgcolor(COLOR_OF_SPACESHIP); // Set the foreground color

	gotoxy(pos.x + 2, pos.y);
	printf("%c", 47); // Print '/' (ASCII 47)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 92); // Print '\' (ASCII 92)

	gotoxy(pos.x + 1, pos.y + 1);
	printf("%c", 95); // Print '_' (ASCII 95)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 95); // Print '_' (ASCII 95)

	gotoxy(pos.x, pos.y + 2);
	printf("%c", 47); // Print '/' (ASCII 47)
	printf("%c", 95); // Print '_' (ASCII 95)
	printf("%c", 35); // Print '#' (ASCII 35)
	printf("%c", 61); // Print '=' (ASCII 61)
	printf("%c", 35); // Print '#' (ASCII 35)
	printf("%c", 95); // Print '_' (ASCII 95)
	printf("%c", 92); // Print '\' (ASCII 92)

	resetbgcolor(); // Reset colors to default
}

void draw_spaceship_down(position pos) {
	fgcolor(COLOR_OF_SPACESHIP); // Set the foreground color

	gotoxy(pos.x + 1, pos.y);
	printf("%c", 95); // Print '_' (ASCII 95)
	gotoxy(pos.x + 5, pos.y);
	printf("%c", 95); // Print '_' (ASCII 95)

	gotoxy(pos.x, pos.y + 1);
	printf("%c", 92); // Print '/' (ASCII 47)
	printf("%c", 95); // Print '_' (ASCII 95)
	printf("%c", 35); // Print '#' (ASCII 35)
	printf("%c", 61); // Print '=' (ASCII 61)
	printf("%c", 35); // Print '#' (ASCII 35)
	printf("%c", 95); // Print '_' (ASCII 95)
	printf("%c", 47); // Print '\' (ASCII 92)

	gotoxy(pos.x + 2, pos.y + 2);
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 124); // Print '|' (ASCII 124)

	gotoxy(pos.x + 2, pos.y + 3);
	printf("%c", 92); // Print '/' (ASCII 47)
	printf("%c", 124); // Print '|' (ASCII 124)
	printf("%c", 47); // Print '\' (ASCII 92)

	resetbgcolor(); // Reset colors to default
}

