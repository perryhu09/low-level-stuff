#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int random_num(int max){
    int x;
    x = rand() % max + 1;
    return x;
}

int main(){
    int balance, bet, guess, rolltime, dice;

    srand(getpid());

    balance = 1000;
    while(1){
        printf("Make your bet: ");
        scanf("%d", &bet);

        printf("Make your guess(1-6, 0 = quit): ");
        fflush(stdout);
        scanf("%d", &guess);
        if(guess == 0) return 0;

        rolltime = random_num(5);
        for(int i = 0; i < rolltime; i++){
            printf("Rolling dice...\n");
            sleep(1);
        }

        dice = random_num(6);
        printf("The dice has landed on %d\n\n", dice);

        if(guess == dice){
            bet *= 3;
            balance += bet;
            printf("Congratulations! You have won 3x your bet!\n");
        }else{
            balance -= bet;
            printf("You have lost.\n");
        }

        printf("Current Balance: $%d\n\n", balance);

        if(balance <= 0){
            printf("GAME OVER\n");
            return 0;
        }
    }
    return 0;
}
