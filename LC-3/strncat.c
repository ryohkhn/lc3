#include <stdio.h>
#include <string.h>

char* strn_cat(char* dst, char* src, size_t sz) {
    int len;
    int i = 0;

    len = strlen(src);
    do {
        dst[len] = src[i];
        len++;
        i++;
    }
    while (src[i] && i < sz);
    dst[len] = '\0';
    return dst;
}
