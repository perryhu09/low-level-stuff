#include <ncurses.h>

int main(){
    char letter; 

    initscr();
    printw("Press any key");
    refresh();

    letter = getch();
    clear();
    printw("You pushed: '%c'", letter);

    getch();
    endwin();

    return 0;
}
