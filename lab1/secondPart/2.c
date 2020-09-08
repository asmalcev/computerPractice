#include <stdio.h>
#include "array.h"

#define N 5

int main() {
  int * arr = read_array(N);
  print_array(arr, N);

  int * fst_neg = NULL, * snd_neg = NULL;
  for (int i = 0; i < N; i++) {
    if (arr[i] < 0) {
      if (!fst_neg) fst_neg = arr + i;
      snd_neg = arr + i;
    }
  }
  if (fst_neg) {
    int tmp = * fst_neg;
    * fst_neg = * snd_neg;
    * snd_neg = tmp;
  }

  print_array(arr, N);
}