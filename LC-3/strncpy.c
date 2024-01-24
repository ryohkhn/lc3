#include <string.h>
#include <stdio.h>

void strn_cpy(char* dst, char* src, size_t sz) {
    if (sz != 0) {
        do {
            if ((*dst++ = *src++) == 0) {
                while (--sz != 0)
                    *dst++ = 0;
                break;
            }
        } while (--sz != 0);
    }
}

#include <stdlib.h>

int main(int argc, char *argv[]) {
    char *dst = malloc(sizeof(char));
    int *test = calloc(sizeof(int) * 100, 100);
    *test = 5;

    char *src = "?";
    strn_cpy(dst, src, 2);
    printf("src: %s, dst: %s\n", src, dst);
    printf("char 1: %c", dst[1]);
    printf("char 2: %c", dst[2]);
    printf("char 3: %c", dst[3]);
    printf("char 4: %c", dst[4]);
    printf("char 5: %c", dst[5]);
    return 0;
}
