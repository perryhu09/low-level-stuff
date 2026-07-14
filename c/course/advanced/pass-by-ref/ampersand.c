#include <stdio.h>

void addition(int *target, int a, int b) {
    *target = a + b;

    return;
}

int main() {
    int x, y, answer; 

    x = 5;
    y = 15;

    addition(&answer, x, y);
    printf("%d\n", answer);
    return 0;
}
