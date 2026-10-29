#include <features/gravity.h>

void gravity(position *pos, bullet bullets_array[MAX_BULLETS]) {
	// Calculate distance to meteor
	for (uint8_t i = 0; i < MAX_BULLETS; i++) {
		if (bullets_array[i].gravity == 0) {
			for (uint8_t j = 0; j < MAX_METEORS; j++) {
				if ((bullets_array[i].bx >= meteors_array[j].x - 20)
						&& (bullets_array[i].bx <= meteors_array[j].x)
						&& (bullets_array[i].by == meteors_array[j].y + 5)) { //10 // Left of meteor
					bullets_array[i].vx++;
					bullets_array[i].gravity = 1;
				}
				if ((bullets_array[i].bx >= meteors_array[j].x + 20)
						&& (bullets_array[i].bx <= meteors_array[j].x + 40)
						&& (bullets_array[i].by == meteors_array[j].y + 5)) { // Right of meteor
					bullets_array[i].vx--;
					bullets_array[i].gravity = 1;
				}
				if (((bullets_array[i].bx == meteors_array[j].x + 10)
						|| (bullets_array[i].bx == meteors_array[j].x + 11))
						&& (bullets_array[i].by >= meteors_array[j].y - 10)
						&& (bullets_array[i].by <= meteors_array[j].y)) { // Above meteor
					bullets_array[i].vy++;
					bullets_array[i].gravity = 1;
				}
				if (((bullets_array[i].bx == meteors_array[j].x + 10)
						|| (bullets_array[i].bx == meteors_array[j].x + 11))
						&& (bullets_array[i].by >= meteors_array[j].y + 10)
						&& (bullets_array[i].by <= meteors_array[j].y + 20)) { // Below meteor
					bullets_array[i].vy--;
					bullets_array[i].gravity = 1;
				}
			}
		}
	}
}
