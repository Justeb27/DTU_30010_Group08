\begin{lstlisting}[caption = {LCD.h}]
#ifndef GRAPHICS_LCD_H_
#define GRAPHICS_LCD_H_

#include <30010_io.h>
#include <string.h>
#include <charset.h>
#include <init/timer.h>
#include <stdint.h>
#include <features/movement.h>
#include <features/bullets.h>
#include <Menus/game_menu.h>

void heart(int start);
void remove_heart(int start);
void lcd_write_string(const char *str, int start);
void points_counter(int start);
void shooting_modes_lcd(void);
void point_loop(void);
void shooting_mode_box(bullet_type typ);
void remove_shooting_mode_box(bullet_type typ);
void hearts_left(uint8_t health);

void lcd_starter(void);

void run_lcd(uint8_t health, bullet_type typ);

#endif

\end{lstlisting}







\begin{lstlisting}[caption = {LCD.c}]
#include <graphics/lcd.h>

uint8_t lcd_buffer[512]; // Declares the buffer

void heart(int start) {
	lcd_buffer[start] = 0x00; //Blank strip before printing of heart
	lcd_buffer[start + 1] = 0x06;
	lcd_buffer[start + 2] = 0x0F;
	lcd_buffer[start + 3] = 0x1F;
	lcd_buffer[start + 4] = 0x3F;
	lcd_buffer[start + 5] = 0x7E;
	lcd_buffer[start + 6] = 0xFC;
	lcd_buffer[start + 7] = 0x7E;
	lcd_buffer[start + 8] = 0x3F;
	lcd_buffer[start + 9] = 0x1F;
	lcd_buffer[start + 10] = 0x0F;
	lcd_buffer[start + 11] = 0x06;
}

void lcd_write_string(const char *str, int start) { // Takes string and start position as inputs
	while (*str) {
		uint8_t c = *str++;
		c -= 32;

		for (int i = 0; i < 5; i++) {
			lcd_buffer[start + i] = character_data[c][i];
		}
		start += 6;
	}
}

void remove_heart(int start) {

	lcd_buffer[start] = 0x00; //Blank strip before printing of heart
	lcd_buffer[start + 1] = 0x06;
	lcd_buffer[start + 2] = 0x09;
	lcd_buffer[start + 3] = 0x11;
	lcd_buffer[start + 4] = 0x21;
	lcd_buffer[start + 5] = 0x42;
	lcd_buffer[start + 6] = 0x84;
	lcd_buffer[start + 7] = 0x42;
	lcd_buffer[start + 8] = 0x21;
	lcd_buffer[start + 9] = 0x11;
	lcd_buffer[start + 10] = 0x09;
	lcd_buffer[start + 11] = 0x06;
}

void shooting_modes_lcd(void) {

	lcd_write_string("Shotgun", 384 + 1);
	lcd_write_string("Normal", 384 + 43 + 4);
	lcd_write_string("Laser", 511 - 43 + 8);

}

void shooting_mode_box(bullet_type typ) {

	uint16_t lines[] = { 256, 384, 256 + 43, 384 + 43, 383 - 43, 511 - 43, 383,
			511 };

	if (typ.type == 1) { // Shotgun
		lcd_buffer[lines[0]] = 0xFF; //First line
		lcd_buffer[lines[1]] = 0xFF;

		lcd_buffer[lines[2]] = 0xFF; //Second line
		lcd_buffer[lines[3]] = 0xFF;

	}
	if (typ.type == 0) { //Normal
		lcd_buffer[lines[2]] = 0xFF; //Second line
		lcd_buffer[lines[3]] = 0xFF;

		lcd_buffer[lines[4]] = 0xFF; //Third line
		lcd_buffer[lines[5]] = 0xFF;

	}
	if (typ.type == 2) { // Laser
		lcd_buffer[lines[4]] = 0xFF; //Third line
		lcd_buffer[lines[5]] = 0xFF;

		lcd_buffer[lines[6]] = 0xFF; //Fourth line
		lcd_buffer[lines[7]] = 0xFF;
	}
}

void remove_shooting_mode_box(bullet_type typ) {
	uint16_t lines[] = { 256, 384, 256 + 43, 384 + 43, 383 - 43, 511 - 43, 383,
			511 };
	if (typ.type != 1) {
		lcd_buffer[lines[0]] = 0x00; //First line
		lcd_buffer[lines[1]] = 0x00;
	}

	if ((typ.type != 1) && (typ.type != 0)) {
		lcd_buffer[lines[2]] = 0x00; //Second line
		lcd_buffer[lines[3]] = 0x00;
	}

	if ((typ.type != 2) && (typ.type != 0)) {
		lcd_buffer[lines[4]] = 0x00; //Third line
		lcd_buffer[lines[5]] = 0x00;
	}
	if (typ.type != 2) {
		lcd_buffer[lines[6]] = 0x00; //Fourth line
		lcd_buffer[lines[7]] = 0x00;
	}
}

void points_counter(int start) {
	char points_to_string[6]; // Points can print up to 5 decimals + 1 for /0

	if (cs % (rand() % 200) == 0){//Randomizes the points
		snprintf(points_to_string, sizeof(points_to_string), "%d", cs); // Converts points to string
		lcd_write_string(points_to_string, 256 - 40);
	}
}




void hearts_left(int health){
	if (health == 3) {
		heart(128);
		heart(128 + 12);
		heart(128 + 24);
	}
	if (health == 2) {
		heart(128);
		heart(128+12);
		remove_heart(128 + 24);
	}
	if (health == 1) {
		heart(128);
		remove_heart(128 + 12);
		remove_heart(128 + 24);
	}
	if (health == 0) {
		remove_heart(128);
		remove_heart(128 + 12);
		remove_heart(128 + 24);
	}
}

void point_loop(void) { //Loop makes the lcd update, including the points

		points_counter(128 - 40);
		lcd_push_buffer(lcd_buffer);

}

void lcd_starter(void) { //Initializes the LCD additions

	memset(lcd_buffer, 0x00, 512); //Clears LCD screen
	heart(128); //Draw Hearts
	heart(128 + 12);
	heart(128 + 24);

	lcd_write_string("Lives:", 1);
	lcd_write_string("Points:", 128 - 40);
	points_counter(256 - 40); //Remember to write location and mode
	shooting_modes_lcd();

	lcd_push_buffer(lcd_buffer); //Push to lcd
}

void run_lcd(int health, bullet_type typ) {
	hearts_left(health);
	point_loop();
	shooting_mode_box(typ);
	remove_shooting_mode_box(typ);
}

\end{lstlisting}