#include <stdio.h>
#include <stdint.h>

int64_t add(int64_t i, int64_t j) {
  int64_t res = 0;
  __asm ("ADD %[result], %[input_i], %[input_j]"
    : [result] "=r" (res)
    : [input_i] "r" (i), [input_j] "r" (j)
  );
  return res;
}


int main(void) {
	printf("Hello, arm64\n%d + %d = %ld\n", 123, 456, add(123, 456));
}
