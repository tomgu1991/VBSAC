// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
 /*
 * @description
 * CWE: 416 Use After Free
 */

#include "416.h"

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


#ifndef OMITBAD

void bad44()
{
    int * data;
    /* Initialize data */
    data = NULL;
    goto source;
source:
    data = (int *)malloc(100*sizeof(int));
    if (data == NULL) return;
    {
        size_t i;
        for(i = 0; i < 100; i++)
        {
            data[i] = 5;
        }
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    free(data);
    goto sink;
sink:
    /* POTENTIAL FLAW: Use of data that may have been freed */
    printIntLine(data[0]);
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good44()
{
    int * data;
    /* Initialize data */
    data = NULL;
    goto source;
source:
    data = (int *)malloc(100*sizeof(int));
    if (data == NULL) return;
    {
        size_t i;
        for(i = 0; i < 100; i++)
        {
            data[i] = 5;
        }
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    free(data);
    goto sink;
sink:
    /* FIX: Don't use data that may have been freed already */
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    /* do nothing */
    ; /* empty statement needed for some flow variants */
}
#endif /* OMITGOOD */

int main(){
	bad44();
	good44();
    return 1;
}