#include "matrix.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int * create_matrix(int length1, int length2) {
  int * m = (int *) malloc(length1 * length2 * sizeof(int));
  return m;
}

int * fill_matrix(int * m, int length1, int length2) {
  srand(time(0));
  for (int i = 0; i < length1 * length2; i++) {
    m[i] = rand() % 100 - 50;
  }
  return m;
}

void print_matrix(int * m, int length1, int length2) {
  for (int j = 0; j < length1; j++) {
    for (int i = 0; i < length2; i++) {
      printf("%d ", m[j * length2 + i]);
    }
    printf("\n");
  }
}

int find_count_of_multiples_by(int * m, int length1, int length2, int num) {
  int count = 0;
  for (int i = 0; i < length1 * length2; i++) {
    if (!(m[i] % num)) {
      count++;
    }
  }
  return count;
}