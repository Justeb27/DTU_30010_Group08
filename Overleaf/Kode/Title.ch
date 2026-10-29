\begin{lstlisting}[caption = {Title.h}]

#ifndef GRAPHICS_TITLE_H_
#define GRAPHICS_TITLE_H_

#include <graphics/title.h>
#include <stm32f30x_conf.h> // STM32 config
#include <30010_io.h> // Input/output library for this course
#include <init/basic_functions.h>

void title_header(uint8_t x, uint8_t y);
void start_title(uint8_t x, uint8_t y);
void help_title(uint8_t x, uint8_t y);
void gameover_title(uint8_t x, uint8_t y);
void gameover_text(uint8_t x, uint8_t y);

#endif /* GRAPHICS_TITLE_H_ */

\end{lstlisting}






\begin{lstlisting}[caption = {Title.c}]

#include <graphics/title.h>
#include <init/basic_functions.h>


void title_header(uint8_t x, uint8_t y) {
    gotoxy(x, y);
    printf("       SSSSSSSSSSSSSSS TTTTTTTTTTTTTTTTTTTTTTT         AAA               RRRRRRRRRRRRRRRRR   FFFFFFFFFFFFFFFFFFFFFFIIIIIIIIII        GGGGGGGGGGGGGHHHHHHHHH     HHHHHHHHHTTTTTTTTTTTTTTTTTTTTTTTEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRR   \n");
    gotoxy(x, y + 1);
    printf("     SS:::::::::::::::ST:::::::::::::::::::::T        A:::A              R::::::::::::::::R  F::::::::::::::::::::FI::::::::I     GGG::::::::::::GH:::::::H     H:::::::HT:::::::::::::::::::::TE::::::::::::::::::::ER::::::::::::::::R  \n");
    gotoxy(x, y + 2);
    printf("    S:::::SSSSSS::::::ST:::::::::::::::::::::T       A:::::A             R::::::RRRRRR:::::R F::::::::::::::::::::FI::::::::I   GG:::::::::::::::GH:::::::H     H:::::::HT:::::::::::::::::::::TE::::::::::::::::::::ER::::::RRRRRR:::::R \n");
    gotoxy(x, y + 3);
    printf("    S:::::S     SSSSSSST:::::TT:::::::TT:::::T      A:::::::A            RR:::::R     R:::::RFF::::::FFFFFFFFF::::FII::::::II  G:::::GGGGGGGG::::GHH::::::H     H::::::HHT:::::TT:::::::TT:::::TEE::::::EEEEEEEEE::::ERR:::::R     R:::::R\n");
    gotoxy(x, y + 4);
    printf("    S:::::S            TTTTTT  T:::::T  TTTTTT     A:::::::::A             R::::R     R:::::R  F:::::F       FFFFFF  I::::I   G:::::G       GGGGGG  H:::::H     H:::::H  TTTTTT  T:::::T  TTTTTT  E:::::E       EEEEEE  R::::R     R:::::R\n");
    gotoxy(x, y + 5);
    printf("    S:::::S                    T:::::T            A:::::A:::::A            R::::R     R:::::R  F:::::F               I::::I  G:::::G                H:::::H     H:::::H          T:::::T          E:::::E               R::::R     R:::::R\n");
    gotoxy(x, y + 6);
    printf("     S::::SSSS                 T:::::T           A:::::A A:::::A           R::::RRRRRR:::::R   F::::::FFFFFFFFFF     I::::I  G:::::G                H::::::HHHHH::::::H          T:::::T          E::::::EEEEEEEEEE     R::::RRRRRR:::::R \n");
    gotoxy(x, y + 7);
    printf("      SS::::::SSSSS            T:::::T          A:::::A   A:::::A          R:::::::::::::RR    F:::::::::::::::F     I::::I  G:::::G    GGGGGGGGGG  H:::::::::::::::::H          T:::::T          E:::::::::::::::E     R:::::::::::::RR  \n");
    gotoxy(x, y + 8);
    printf("        SSS::::::::SS          T:::::T         A:::::A     A:::::A         R::::RRRRRR:::::R   F:::::::::::::::F     I::::I  G:::::G    G::::::::G  H:::::::::::::::::H          T:::::T          E:::::::::::::::E     R::::RRRRRR:::::R \n");
    gotoxy(x, y + 9);
    printf("           SSSSSS::::S         T:::::T        A:::::AAAAAAAAA:::::A        R::::R     R:::::R  F::::::FFFFFFFFFF     I::::I  G:::::G    GGGGG::::G  H::::::HHHHH::::::H          T:::::T          E::::::EEEEEEEEEE     R::::R     R:::::R\n");
    gotoxy(x, y + 10);
    printf("                S:::::S        T:::::T       A:::::::::::::::::::::A       R::::R     R:::::R  F:::::F               I::::I  G:::::G        G::::G  H:::::H     H:::::H          T:::::T          E:::::E               R::::R     R:::::R\n");
    gotoxy(x, y + 11);
    printf("                S:::::S        T:::::T      A:::::AAAAAAAAAAAAA:::::A      R::::R     R:::::R  F:::::F               I::::I   G:::::G       G::::G  H:::::H     H:::::H          T:::::T          E:::::E       EEEEEE  R::::R     R:::::R\n");
    gotoxy(x, y + 12);
    printf("    SSSSSSS     S:::::S      TT:::::::TT   A:::::A             A:::::A   RR:::::R     R:::::RFF:::::::FF           II::::::II  G:::::GGGGGGGG::::GHH::::::H     H::::::HH      TT:::::::TT      EE::::::EEEEEEEE:::::ERR:::::R     R:::::R\n");
    gotoxy(x, y + 13);
    printf("    S::::::SSSSSS:::::S      T:::::::::T  A:::::A               A:::::A  R::::::R     R:::::RF::::::::FF           I::::::::I   GG:::::::::::::::GH:::::::H     H:::::::H      T:::::::::T      E::::::::::::::::::::ER::::::R     R:::::R\n");
    gotoxy(x, y + 14);
    printf("    S:::::::::::::::SS       T:::::::::T A:::::A                 A:::::A R::::::R     R:::::RF::::::::FF           I::::::::I     GGG::::::GGG:::GH:::::::H     H:::::::H      T:::::::::T      E::::::::::::::::::::ER::::::R     R:::::R\n");
    gotoxy(x, y + 15);
    printf("     SSSSSSSSSSSSSSS         TTTTTTTTTTTAAAAAAA                   AAAAAAARRRRRRRR     RRRRRRRFFFFFFFFFFF           IIIIIIIIII        GGGGGG   GGGGHHHHHHHHH     HHHHHHHHH      TTTTTTTTTTT      EEEEEEEEEEEEEEEEEEEEEERRRRRRRR     RRRRRRR\n");
}


void start_title(uint8_t x, uint8_t y) {

	gotoxy(x,y);
    printf("  _________ __                 __   \n");
	gotoxy(x,y+1);
    printf(" /   _____//  |______ ________/  |_ \n");
	gotoxy(x,y+2);
    printf(" \\_____  \\\\   __\\__  \\\\_  __ \\   __\\\n");
	gotoxy(x,y+3);
    printf(" /        \\|  |  / __ \\|  | \\/|  |  \n");
	gotoxy(x,y+4);
    printf("/_______  /|__| (____  /__|   |__|  \n");
	gotoxy(x,y+5);
    printf("        \\/           \\/              \n");
}

void help_title(uint8_t x, uint8_t y) {
    gotoxy(x, y);
    printf("   ___ ___         .__           \n");
    gotoxy(x, y + 1);
    printf("  |   |  |   ____  |  |  ______  \n");
    gotoxy(x, y + 2);
    printf("  |    ~ | _/ __ \\ |  |  \\____ \\ \n");
    gotoxy(x, y + 3);
    printf("  |    Y | \\  ___/ |  |__|  |_> >\n");
    gotoxy(x, y + 4);
    printf("  |___|_ |  \\___  >|____/|   __/ \n");
    gotoxy(x, y + 5);
    printf("       \\/        \\/       |__|    \n");
}

void gameover_title(uint8_t x, uint8_t y) {
gotoxy(x, y);
printf("          _____          _____        ______  _______        ______                 _____     ____      ____      ______        _____   \n");
gotoxy(x, y + 1);
printf("      ___|\\    \\     ___|\\    \\      |      \\/       \\   ___|\\     \\           ____|\\    \\   |    |    |    | ___|\\     \\   ___|\\    \\  \n");
gotoxy(x, y + 2);
printf("     /    /\\    \\   /    /\\    \\    /          /\\     \\ |     \\     \\         /     /\\    \\  |    |    |    ||     \\     \\ |    |\\    \\ \n");
gotoxy(x, y + 3);
printf("    |    |  |____| |    |  |    |  /     /\\   / /\\     ||     ,_____/|       /     /  \\    \\ |    |    |    ||     ,_____/||    | |    |\n");
gotoxy(x, y + 4);
printf("    |    |    ____ |    |__|    | /     /\\ \\_/ / /    /||     \\--'\\_|/      |     |    |    ||    |    |    ||     \\--'\\_|/|    |/____/ \n");
gotoxy(x, y + 5);
printf("    |    |   |    ||    .--.    ||     |  \\|_|/ /    / ||     /___/|        |     |    |    ||    |    |    ||     /___/|  |    |\\    \\ \n");
gotoxy(x, y + 6);
printf("    |    |   |_,  ||    |  |    ||     |       |    |  ||     \\____|\\       |\\     \\  /    /||\\    \\  /    /||     \\____|\\ |    | |    |\n");
gotoxy(x, y + 7);
printf("    |\\ ___\\___/  /||____|  |____||\\____\\       |____|  /|____ '     /|      | \\_____\\/____/ || \\ ___\\/___ / ||____ '     /||____| |____|\n");
gotoxy(x, y + 8);
printf("    | |   /____ / ||    |  |    || |    |      |    | / |    /_____/ |       \\ |    ||    | / \\ |   ||   | / |    /_____/ ||    | |    |\n");
gotoxy(x, y + 9);
printf("     \\|___|    | / |____|  |____| \\|____|      |____|/  |____|     | /        \\|____||____|/   \\|___||___|/  |____|     | /|____| |____|\n");
gotoxy(x, y + 10);
printf("       \\( |____|/    \\(      )/      \\(          )/       \\( |_____|/            \\(    )/        \\(    )/      \\( |_____|/   \\(     )/  \n");
gotoxy(x, y + 11);
printf("        '   )/        '      '        '          '         '    )/                '    '          '    '        '    )/       '     '   \n");
gotoxy(x, y + 12);
printf("            '                                                   '                                                    '                 \n");
}


void gameover_text(uint8_t x, uint8_t y) {
    gotoxy(x, y);
    printf("     ______                                 __            __    __                      __                                   __    __                          \n");
    gotoxy(x, y + 1);
    printf("    |   __ \\.----..-----..-----..-----.    |  |--..--.--.|  |_ |  |_ .-----..-----.    |  |_ .-----.    .----..-----..-----.|  |_ |__|.-----..--.--..-----.    \n");
    gotoxy(x, y + 2);
    printf("    |    __/|   _||  -__||__ --||__ --|    |  _  ||  |  ||   _||   _||  _  ||     |    |   _||  _  |    |  __||  _  ||     ||   _||  ||     ||  |  ||  -__| __ \n");
    gotoxy(x, y + 3);
    printf("    |___|   |__|  |_____||_____||_____|    |_____||_____||____||____||_____||__|__|    |____||_____|    |____||_____||__|__||____||__||__|__||_____||_____||__|\n");
}

\end{lstlisting}