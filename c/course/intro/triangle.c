#include <stdio.h>

int triangle_area(int b, int h){
    int a; 
    a = (b * h) / 2;
    return a;
}

int main(){
    int b, h, a; 
    printf("Base: ");
    fflush(stdout);
    scanf("%d", &b);

    printf("Height: ");
    fflush(stdout);
    scanf("%d", &h);

    a = triangle_area(b, h);
    printf("The area of your triangle is: %d\n", a);
    return 0;
}
