#ifdef _WIN32

  #include <windows.h>

  #define LOAD_LIB LoadLibrary
  #define GET_FUNC GetProcAddress
  #define LIB_CAST (HINSTANCE)
  #define FREE_LIBRARY FreeLibrary

#else
  #ifdef __linux__

  #include <dlfcn.h>

  #define LOAD_LIB(arg) dlopen(arg, RTLD_LAZY)
  #define GET_FUNC dlsym
  #define LIB_CAST
  #define FREE_LIBRARY dlclose

  #endif
#endif

#include <stdio.h>

#define K 73
#define R1 7
#define R2 10

void * load_lib(const char * const lib_name) {
  void * lib;
  lib = LOAD_LIB(lib_name);
  if (!lib) {
    printf("cannot open library '%s'\n", lib_name);
    return NULL;
  }
  return lib;
}

int main() {
  void * lib;
  int * obj;
  char choice, flag = 1;
  printf("Choose what you want to use\n1. Array\n2. Matrix\n3. Quit\n");
  while(flag) {
    scanf("%c", &choice);
    if (choice == '1') {
      lib = load_lib("array/libarray.so");
      obj = ((int * (*)(int)) GET_FUNC(LIB_CAST lib, "create_array"))(K);
      ((int * (*)(int *, int)) GET_FUNC(LIB_CAST lib, "fill_array"))(obj, K);
      ((void (*)(int *, int)) GET_FUNC(LIB_CAST lib, "print_array"))(obj, K);
      printf("%d\n", ((int (*)(int *, int, int)) GET_FUNC(LIB_CAST lib, "find_count_of_multiples_by"))(obj, K, 7));
      flag = 0;
    } else if (choice == '2') {
      lib = load_lib("matrix/libmatrix.so");
      obj = ((int * (*)(int, int)) GET_FUNC(LIB_CAST lib, "create_matrix"))(R1, R2);
      ((int * (*)(int *, int, int)) GET_FUNC(LIB_CAST lib, "fill_matrix"))(obj, R1, R2);
      ((void (*)(int *, int, int)) GET_FUNC(LIB_CAST lib, "print_matrix"))(obj, R1, R2);
      printf("%d\n", ((int (*)(int *, int, int, int)) GET_FUNC(LIB_CAST lib, "find_count_of_multiples_by"))(obj, R1, R2, 7));
      flag = 0;
    } else if (choice == '3') {
      return 0;
    }
  }
  if (lib) {
    FREE_LIBRARY(LIB_CAST lib);
  }
}