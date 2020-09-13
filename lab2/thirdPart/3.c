#include <stdio.h>
#include "iostring.h"

#define N 100

int main() {
  char * str = read_str(N);
  for (int i = 0; i < N; i++) {
    if (
      (str[i] >= '0' && str[i] <= '9')
      || (str[i] >= 'a' && str[i] <= 'f')
      || (str[i] >= 'A' && str[i] <= 'F')
    ) {
      continue;
    } else {
      if (str[i] == '\0') break;
      print_str("It isn't hexdecimal");
      return 0;
    }
  }
  print_str("It's hexdecimal");
}