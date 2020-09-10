#include <stdio.h>

int main() {
  char a;
  while (a = getchar()) {
    if (
      (a >= '0' && a <= '9')
      || (a >= 'a' && a <= 'f')
      || (a >= 'A' && a <= 'F')
    ) {
      continue;
    } else {
      if (a == '\n') break;
      printf("It isn't hexdecimal\n");
      return 0;
    }
  }
  printf("It's hexdecimal\n");
}