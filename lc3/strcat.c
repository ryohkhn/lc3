#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

char *str_cat(char *dest, char *src) {
  char *res = dest;

  // go to the end of `dest`
  if (*dest != '\0') {
    do {
      dest += 1;
    } while (*dest != '\0');
  }

  // copy `src` to `dest`
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
  char dest[14] = {0};

  assert(str_cat(dest, "Hello, ") == dest);
  assert(str_cat(dest, "World!") == dest);

  printf("dest: `%s`\n", dest);
}
