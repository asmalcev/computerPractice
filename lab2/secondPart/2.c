#include <stdio.h>
#include <stdlib.h>

int main() {
  int n, length;
  char * str = (char *) malloc(100);
  scanf("%s", str);
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
  printf("%s\n", str);
  free(str);
}