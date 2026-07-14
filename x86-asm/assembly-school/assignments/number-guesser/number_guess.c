#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

int main() {
    srand(time(0));
    int target = rand() % 101;
    int guess = -1;
    int guesses = 7;

    printf("Guess a number between 0 and 100: ");
    while(guesses > 0) {
        scanf("%d", &guess);
        if(guess == target) {
            printf("Congratulations! You have won!\n");
            break;
        }else if(guesses > 1) {
            if(guess > target) {
                printf("Too high, guess again: ");
            }else if(guess < target) {
                printf("Too low, guess again: ");
            }
        }
        guesses--;
    }
    if(!guesses) {
        printf("You've run out of guesses\n");
    }
    printf("The correct number was %d\n", target);
    return 0;
}
