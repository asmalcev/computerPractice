#include "array.h"

int * read_array(int length) {
  int * arr = (int *) malloc(length * sizeof(int));

  for (int i = 0; i < length; i++) {
    scanf("%d", arr + i);
  }

  return arr;
}

void print_array(int * arr, int length) {
  for (int i = 0; i < length; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}