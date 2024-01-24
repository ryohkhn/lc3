#include <stdio.h>

char* index_asm(char r1, char* r2) {
    while (*r2 != '\0') {
        if (*r2 == r1)
            return r2;
        r2++;
    }
    return 0;
}

int main(int argc, char *argv[]) {
    char* s = "Hello World";
    char c = 'o';
    printf("index(%c, %s): %s", c, s, index_asm(c, s));
    return 0;
}
