#include <stdio.h>
#include <stdlib.h>
#include "iostring.h"

char * read_str(int length) {
  char * str = (char *) malloc(length);
  scanf("%s", str);
  return str;
}

void print_str(char * str) {
  printf("%s\n", str);
}