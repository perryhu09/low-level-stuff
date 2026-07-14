#include <stdio.h>
#include <unistd.h>

int main(){
    int timer_length;
    get_timer_length:
        printf("Enter timer length (s): ");
        fflush(stdout);
        scanf("%d", &timer_length);
        if(timer_length < 1){
            printf("Please enter a positive number\n");
            goto get_timer_length; 
        }
    for(int i = timer_length; i > 0; i--){
        printf("%d\n", i);
        sleep(1);
    }
    printf("Timer Finished!!!\n");
    return 0;
}
