#include <stdio.h>
#include "array.h"

#define N 5

int main() {
  int template[N] = { [0 ... N - 1] = 1};
  int * arr = read_array(N);
  print_array(arr, N);

  for (int i = 0; i < N; i++) {
    if (arr[i] <= N && arr[i] > 0) {
      template[arr[i] - 1] = 0;
    }
  }

  for (int i = 0; i < N; i++) {
    if (template[i]) {
      printf("Array isn't permutation\n");
      return 0;
    }
  }
  printf("Array is permutation\n");
}