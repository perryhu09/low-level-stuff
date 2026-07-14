#include <stdio.h>

int main(){
    int x;
    printf("Choose between 1. apples, 2. bananas, or 3. oranges\n");
    scanf("%d", &x);

    switch(x){
        case 1:
            printf("Apples\n");
            break;
        case 2:
            printf("Bananas\n");
            break;
        case 3:
            printf("Oranges\n");
            break;
        default:
            printf("Something else\n");
    }
    return 0;
}
