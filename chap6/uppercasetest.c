#include <stdio.h>
#include <stdlib.h>

size_t upper(char* instr, char* outstr);

int main()
{
    char instr[256];
    char outstr[256];
    printf("Enter a string: ");
    fgets(instr, sizeof(instr), stdin);
    int length = upper(instr, outstr);
    printf("%s", outstr);
    printf("Length of input string: %d\n", length);
    return 0;
}
