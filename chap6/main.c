#include <stdio.h>
#include <stdlib.h>

size_t upper(char* instr, char* outstr);

int main()
{
    char* instr = "this is a string which will be uppercased from a assembly function from C";
    char* outstr = malloc(256);
    int length = upper(instr, outstr);
    printf("%s", outstr);
    return 0;
}
