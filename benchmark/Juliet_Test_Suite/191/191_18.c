// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 191 Integer Underflow
 */

#include "191.h"

void printHexCharLine (char charHex)
{
    printf("%d\n", (int)charHex);
}

void printLine (const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}

void printIntLine (int intNumber)
{
    printf("%d\n", intNumber);
}

void printLongLine (int64_t longIntNumber)
{
    printf("%ld\n", longIntNumber);
}

void printUnsignedLine(unsigned unsignedNumber) 
{
    printf("%u\n", unsignedNumber);
}


#ifndef OMITBAD

void bad18()
{
    char data;
    data = ' ';
    if(5==5)
    {
        data = -90;
    }
    if(5==5)
    {
        {
            /* POTENTIAL FLAW: Subtracting 1 from data could cause an underflow */
            char result = data - 'A';
            printHexCharLine(result);
        }
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good18()
{
    char data;
    data = ' ';
    if(5!=5)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Use a small, non-zero value that will not cause an underflow in the sinks */
        data = -2;
    }
    if(5==5)
    {
        {
            /* POTENTIAL FLAW: Subtracting 1 from data could cause an underflow */
            char result = data - 1;
            printHexCharLine(result);
        }
    }
}


#endif /* OMITGOOD */

int main(){
    good18();
	bad18();
    return 1;
}