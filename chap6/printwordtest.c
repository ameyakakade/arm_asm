#include <stdio.h>
#include <stdlib.h>

void printword(size_t in);
size_t sumfn(size_t a, size_t b);

int main()
{
    size_t result = sumfn(0x432ED, 0x432);
    printf("The value returned is: %zx", result);
    return 0;
}
