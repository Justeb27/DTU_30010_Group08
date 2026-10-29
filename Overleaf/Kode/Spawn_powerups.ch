\begin{lstlisting}[caption = {Spawn powerups.h}]
#ifndef FEATURES_SPAWN_POWERUPS_H_
#define FEATURES_SPAWN_POWERUPS_H_

#include <parameters.h>
#include <graphics/powerup.h>
#include <graphics/enemy.h>

void power(void);
void spawn_powerups(bullet_type *typ, uint32_t powerup_time,
		uint32_t *last_powerup_time);
void remove_powerups(void);

#endif /* FEATURES_SPAWN_POWERUPS_H_ */

\end{lstlisting}



\begin{lstlisting}[caption = {Spawn powerups.c}]


#include <features/spawn_powerups.h>

void spawn_powerups(bullet_type *typ, uint32_t powerup_time,
		uint32_t *last_powerup_time) {
	if (((cs - powerup_time) > 1000) && (typ->type)) {
		typ->type = 0; // Reset bullet type
	}

	if (!powerups_array[0].active) {
		if ((cs + 16) % 2000 == 0) {
			powerups_array[0].x = rand() % 243 >> 1;
			powerups_array[0].y = rand() % 76 >> 1;
			powerups_array[0].active = 1;
			powerups_array[0].powerup_effect = rand() % 3;
			powerups_array[0].x += 243 >> 2;
			powerups_array[0].y += 76 >> 2;
			powerup(11);
		}
		*last_powerup_time = cs; // Update last fire time
	}
}

void remove_powerups(void) {
	powerups_array[0].active = 0;

	for (int i = 0; i < 8; i++) {
		gotoxy(powerups_array[0].x, powerups_array[0].y + i);
		printf("                ");
	}

	powerups_array[0].x = 1000;
	powerups_array[0].y = 1000;
}

\end{lstlisting}