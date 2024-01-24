#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void str_lcat(char *dest, char *src, int size) {
  // go to the end of `dest`
  if (*dest != '\0' && size > 1) {
    do {
      dest += 1;
      size -= 1;
    } while (*dest != '\0' && size > 1);
  }

  // copy `src` to `dest`
  if (*src != '\0' && size > 1) {
    do {
      *dest = *src;
      dest += 1;
      src += 1;
      size -= 1;
    } while (*src != '\0' && size > 1);
  }

  // copy the null terminator
  *dest = '\0';
}

int main(void) {
  char dest[13] = {0};

  str_lcat(dest, "Hello, ", 13);
  str_lcat(dest, "World!", 13);

  printf("dest: `%s`\n", dest);
}
