#include <stdio.h>
#include <string.h>

struct person{
    char firstname[32];
    char lastname[32];
    int age;
};

int main(){
    struct person anna;
    strncpy(anna.firstname, "Anna", 31);
    strncpy(anna.lastname, "Anderson", 31);
    anna.age = 22;

    printf("%s %s of the age %d\n", anna.firstname, anna.lastname, anna.age);
    return 0;
}
