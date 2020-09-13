#include <stdio.h>
#include <stdlib.h>

char * read_str(int length) {
  char * str = (char *) malloc(length);
  scanf("%s", str);
  return str;
}

void print_str(char * str) {
  printf("%s\n", str);
}

int main() {
  int n, length;
  char * str = read_str(100);
  scanf("%d", &n);
  length = sprintf(str, "%s", str);
  char tmp;
  if (n < length) {
    for (int i = 0; i < n; i++) {
      tmp = str[i];
      str[i] = str[length - n + i];
      str[length - n + i] = tmp;
    }
  }
  print_str(str);
  free(str);
}