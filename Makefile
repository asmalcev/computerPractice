1.1_SRC = lab1/firstPart
1.2_SRC = lab1/secondPart
1.3_SRC = lab1/secondPart
LIB1ARRAY_SRC = lab1/secondPart

2.1_SRC = lab2/firstPart
2.2_SRC = lab2/secondPart
2.3_SRC = lab2/thirdPart
IOSTRING_SRC = lab2/thirdPart

3_SRC = lab3

lab1: task1.1 task1.2 task1.3

lab1_libarray: $(LIB1ARRAY_SRC)/array.c $(LIB1ARRAY_SRC)/array.h
	gcc -c -o $(LIB1ARRAY_SRC)/array.o $(LIB1ARRAY_SRC)/array.c
	ar crs $(LIB1ARRAY_SRC)/libarray_func.a $(LIB1ARRAY_SRC)/array.o

task1.1: $(1.1_SRC)/1.c
	gcc -E -o $(1.1_SRC)/1.i $(1.1_SRC)/1.c
	gcc -S -o $(1.1_SRC)/1.s $(1.1_SRC)/1.c
	gcc -c -o $(1.1_SRC)/1.o $(1.1_SRC)/1.c
	gcc -o $(1.1_SRC)/1.out $(1.1_SRC)/1.o
	gcc -S -O1 -o $(1.1_SRC)/1opt.s $(1.1_SRC)/1.c
	gcc -S -O2 -o $(1.1_SRC)/1opt2.s $(1.1_SRC)/1.c
	gcc -S -O3 -o $(1.1_SRC)/1opt3.s $(1.1_SRC)/1.c

task1.2: $(1.2_SRC)/2.c lab1_libarray
	gcc -c -o $(1.2_SRC)/2.o $(1.2_SRC)/2.c
	gcc -o $(1.2_SRC)/2.lib.out $(1.2_SRC)/2.o -L./$(1.2_SRC) -larray_func

task1.3: $(1.3_SRC)/3.c lab1_libarray
	gcc -c -o $(1.3_SRC)/3.o $(1.3_SRC)/3.c
	gcc -o $(1.3_SRC)/3.lib.out $(1.3_SRC)/3.o -L./$(1.3_SRC) -larray_func

lab2: task2.1 task2.2 task2.3

lab2_libiostr: $(IOSTRING_SRC)/iostring.c $(IOSTRING_SRC)/iostring.h
	gcc -c -o $(IOSTRING_SRC)/iostring.o $(IOSTRING_SRC)/iostring.c
	ar crs $(IOSTRING_SRC)/libiostring.a $(IOSTRING_SRC)/iostring.o

task2.1: $(2.1_SRC)/1.c
	g++ -g -o $(2.1_SRC)/1.out $(2.1_SRC)/1.c

task2.2: $(2.2_SRC)/2.c
	gcc -g -o $(2.2_SRC)/2.out $(2.2_SRC)/2.c

task2.3: $(2.3_SRC)/3.c lab2_libiostr
	gcc -c -o $(2.3_SRC)/3.o $(2.3_SRC)/3.c
	gcc -g -o $(2.3_SRC)/3.out $(2.3_SRC)/3.o -L./$(2.3_SRC) -liostring

lab3: task3

lab3_libarray: $(3_SRC)/array/array.c $(3_SRC)/array/array.h
	gcc -c -fpic -o $(3_SRC)/array/array.o $(3_SRC)/array/array.c
	gcc -shared -o $(3_SRC)/array/libarray.so $(3_SRC)/array/array.o

lab3_libmatrix: $(3_SRC)/matrix/matrix.c $(3_SRC)/matrix/matrix.h
	gcc -c -fpic -o $(3_SRC)/matrix/matrix.o $(3_SRC)/matrix/matrix.c
	gcc -shared -o $(3_SRC)/matrix/libmatrix.so $(3_SRC)/matrix/matrix.o

task3: $(3_SRC)/main.c lab3_libarray lab3_libmatrix
	gcc -c -fpic -o $(3_SRC)/main.o $(3_SRC)/main.c
	gcc -o $(3_SRC)/main $(3_SRC)/main.o -ldl

all: lab1 lab2 lab3