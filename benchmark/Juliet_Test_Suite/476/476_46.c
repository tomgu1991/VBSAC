// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
 /*
 * @description
 * CWE: 476 Null Pointer Dereference
 */
#include "476.h"


const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */
const int GLOBAL_CONST_FIVE = 5; 

int globalTrue = 1; /* true */
int globalFalse = 0; /* false */
int globalFive = 5; 

int globalReturnsTrue() 
{
    return 1;
}

int globalReturnsFalse() 
{
    return 0;
}

int globalReturnsTrueOrFalse() 
{
    return (rand() % 2);
}

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


static const int STATIC_CONST_FIVE = 5;

#ifndef OMITBAD

void bad46()
{
    if(STATIC_CONST_FIVE==5)
    {
        {
            int *intPointer = NULL;
            intPointer = (int *)malloc(sizeof(int));
            *intPointer = 5;
            printIntLine(*intPointer);
            /* FLAW: Check for NULL after dereferencing the pointer. This NULL check is unnecessary. */
            if (intPointer != NULL)
            {
                *intPointer = 10;
            }
            printIntLine(*intPointer);
        }
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good46()
{
    if(STATIC_CONST_FIVE!=5)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        {
            /* FIX: Check for NULL and do not dereference the pointer if it is NULL */
            int *intPointer = NULL;
            if (intPointer == NULL)
            {
                printLine("pointer is NULL");
            }
        }
    }
}

#endif /* OMITGOOD */

int main(){
    good46();
	bad46();
    return 1;
}