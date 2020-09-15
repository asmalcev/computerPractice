#ifndef MATRIX_H
#define MATRIX_H

int * create_matrix(int length1, int length2);
int * fill_matrix(int * m, int length1, int length2);
void print_matrix(int * m, int length1, int length2);
int find_count_of_multiples_by(int * m, int length1, int length2, int num);

#endif