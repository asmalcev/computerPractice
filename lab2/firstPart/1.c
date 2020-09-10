#include <stdio.h>
#include <math.h>

int main() {
  double Y = 0;
  for (double i = 1; i <= 2; i += 0.1) {
    Y += sin(i);
  }
  printf("%f\n", Y);
}