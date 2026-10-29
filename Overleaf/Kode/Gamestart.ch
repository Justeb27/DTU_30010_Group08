\begin{lstlisting}[caption = {Gamestart.h}]

#ifndef GRAPHICS_GAMESTART_H_
#define GRAPHICS_GAMESTART_H_

#include <stdlib.h>
#include <string.h>

#include <graphics/enemy.h>
#include <init/basic_functions.h>
#include <graphics/background.h>

gamestart(uint8_t color_of_stars, uint8_t color_of_meteor,
		uint8_t color_of_alien, uint8_t meteor_speed, uint8_t alien_speed);

#endif

\end{lstlisting}

\begin{lstlisting}[caption = {Gamestart.c}]

#include <graphics/gamestart.h>

void game_start() {
    init_baggrund(); // Initialize the entire background
    init_enemygo();  // Initialize enemies
}
gamestart(uint8_t color_of_stars, uint8_t color_of_meteor,
		uint8_t color_of_alien, uint8_t meteor_speed, uint8_t alien_speed) {
	enemygo(color_of_stars, color_of_meteor, color_of_alien, meteor_speed,
			alien_speed);
}

\end{lstlisting}