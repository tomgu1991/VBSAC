// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
 /*
 * @description
 * CWE: 457 Use Uninitialized Variable
 */
#include "457.h"


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

void bad37()
{
    int64_t data;
    /* POTENTIAL FLAW: Don't initialize data */
    ; /* empty statement needed for some flow variants */
    /* POTENTIAL FLAW: Use data without initializing it */
    printLongLine(data);
}

#endif /* OMITBAD */

#ifndef OMITGOOD

/* goodG2B uses the GoodSource with the BadSink */
static void goodG2B()
{
    int64_t data;
    /* FIX: Initialize data */
    data = 5;
    /* POTENTIAL FLAW: Use data without initializing it */
    printLongLine(data);
}

/* goodB2G uses the BadSource with the GoodSink */
static void goodB2G()
{
    int64_t data;
    /* POTENTIAL FLAW: Don't initialize data */
    ; /* empty statement needed for some flow variants */
    /* FIX: Ensure data is initialized before use */
    data = 5;
    printLongLine(data);
}

void good37()
{
    goodG2B();
    goodB2G();
}

#endif /* OMITGOOD */

int main(){
	good37();
    bad37();
    return 1;
}