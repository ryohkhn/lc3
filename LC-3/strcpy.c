#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

char *str_cpy(char *dest, char *src) {
  char *res = dest;
  if (*src != '\0') {
    do {
      *dest = *src;
      dest += 1;
      src += 1;
    } while (*src != '\0');
  }

  // copy the null terminator
  *dest = *src;
  return res;
}

int main(void) {
  char *src = "Hello, World!";
  char dest[14] = {0};

  assert(str_cpy(dest, src) == dest);

  printf("dest: `%s`\n", dest);
}
