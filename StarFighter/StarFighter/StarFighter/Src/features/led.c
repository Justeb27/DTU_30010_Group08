#include <features/led.h>

void update_led(int health) {
	switch (health) {
	case 0:
		set_led(0, 0, 0);
		break;
	case 1:
		set_led(1, 0, 0);
		break;
	case 2:
		set_led(0, 0, 1);
		break;
	case 3:
		set_led(0, 1, 0);
		break;
	}
}
