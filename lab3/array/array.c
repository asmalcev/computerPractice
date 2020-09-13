#include "array.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int * create_array(int length) {
  int * arr = (int *) malloc(length * sizeof(int));
  return arr;
}

int * fill_array(int * arr, int length) {
  for (int i = 0; i < length; i++) {
    arr[i] = rand() % 100 - 50;
  }
  return arr;
}
void print_array(int * arr, int length) {
  for (int i = 0; i < length; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}

int find_count_of_multiples_by(int * arr, int length, int num) {
  int count = 0;
  for (int i = 0; i < length; i++) {
    if (!(arr[i] % num)) {
      count++;
    }
  }
  return count;
}