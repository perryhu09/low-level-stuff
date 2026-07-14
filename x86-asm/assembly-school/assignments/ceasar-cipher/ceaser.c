#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

void clear(void) {
    while(getchar() != '\n');
}

void ceaserCipher(char *message, int shift, int encrypt) {
    for(int i = 0; message[i] != '\0'; i++) {
        char c = message[i];

        if(isalpha(c)) {
            char base = isupper(c)? 'A' : 'a';
            
            if(encrypt) {
                c = (c - base + shift) % 26 + base;
            }else {
                c = (c - base - shift) % 26 + base;
            }
        }
        message[i] = c;
    }
    return;
}

int main(int argc, char *argv[]) {
    int op, key;
    char *message = malloc(100 * sizeof(char));

    printf("Welcome to the Ceaser Cipher\n");  
    printf("1 - Encrypt\n");
    printf("2 - Decrypt\n");
    printf("Choose your operation: ");
    if(scanf("%d", &op) != 1 || (op != 1 && op != 2)) {
        printf("Invalid operation. Exiting...\n"); 
        free(message); 
        return 1;
    }

    clear();

    printf("Enter your message: ");
    scanf("%99s", message);

    printf("Enter the key: ");
    if(scanf("%d", &key) != 1) {
        printf("Invalid key value. Exiting...\n");
        free(message);
        return 1;
    }

    if(op == 1) {
        ceaserCipher(message, key, 1);
        printf("Encrypted Message: %s\n", message);
    }else {
        ceaserCipher(message, key, 0);
        printf("Decrypted Message: %s\n", message);
    }
    
    free(message);

    return 0;
}
