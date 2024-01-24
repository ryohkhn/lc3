#include <stdio.h>

int str_cmp(const char *s1, const char *s2) {
    while (*s1 && (*s1 == *s2)) {
        s1++;
        s2++;
    }
    return (unsigned char)*s1 - (unsigned char)*s2;
}

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    printf("Result: %d\n", strcmp("hello", "hello"));
    printf("Result: %d\n", strcmp("apple", "banana"));
    printf("Result: %d\n", strcmp("", ""));

    printf("Result: %d\n", strcmp("Hello", "hello"));
    printf("Result: %d\n", strcmp("ApPlE", "aPpLe"));

    printf("Result: %d\n", strcmp("apple", "applepie"));
    printf("Result: %d\n", strcmp("orangejuice", "orange"));

    printf("Result: %d\n", strcmp("a@b#c", "a&b#c"));
    printf("Result: %d\n", strcmp("line1\nline2", "line1\tline2"));

    printf("Result: %d\n", strcmp("  hello", "hello"));
    printf("Result: %d\n", strcmp("hello\tworld", "hello world"));

    return 0;
}
