#include <stdio.h>

int main(void) {
    int n1, n2;
    int choice;
    int ret;

    printf("Welcome to the Calculator!\n"); 
    printf("(1) Addition\n");
    printf("(2) Subtraction\n");
    printf("(3) Multiplication\n");
    printf("(4) Division\n");

    printf("Choose your operation: ");
    scanf("%d", &choice);

    printf("num1: ");
    scanf("%d", &n1);

    printf("num2: ");
    scanf("%d", &n2);

    switch (choice) {
        case 1:
            ret = n1 + n2;
            break;
        case 2:
            ret = n1 - n2;
            break;
        case 3: 
            ret = n1 * n2;
            break;
        case 4:
            ret = n1 / n2;
            break;
        default: 
            break;
    }

    printf("Result: %d\n", ret);

    return 0;
}
