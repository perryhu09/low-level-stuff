#include <stdio.h>
#include <ctype.h>

void fileParser(char *filename) {
    FILE *file = fopen(filename, "r");
    if(file == NULL) {
        perror("Error opening file");
        return;
    }

    int lines = 1, words = 0, letters = 0;
    char ch;

    int inWord = 0;

    while((ch = fgetc(file)) != EOF) {
        if(ch == '\n') {
            lines++;
        }
        if(isalpha(ch)) {
            letters++;
        }
        if(!isspace(ch) && !inWord) {
            inWord = 1;
            words++;
        } else if (isspace(ch)) {
            inWord = 0;
        }
    }

    printf("FILE STATISTICS\n");
    for(int i = 0; i < 50; i++) {
        printf("-");
    }
    putchar('\n');

    printf("Word Count: %d\n", words);
    printf("Line Count: %d\n", lines);
    printf("Letter Count: %d\n", letters);
}

int main(int argc, char *argv[]) {
    if(argc != 2) {
        printf("Usage: %s <pathname>\n", argv[0]);
        return -1;
    }

    fileParser(argv[1]);

    return 0;
}
