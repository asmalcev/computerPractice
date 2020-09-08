#include <stdio.h>

int main() {
  int n, result = 0, tmp;
  scanf("%d", &n);
  for (int i = 1; i <= n; i++) {
    tmp = i;
    for (int j = 1; j < i; j++) {
      tmp *= i;
    }
    result += tmp;
  }
  printf("S = %d\n", result);
}