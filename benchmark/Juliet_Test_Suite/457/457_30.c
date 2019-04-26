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

void printDoubleLine(double doubleNumber) 
{
    printf("%g\n", doubleNumber);
}

#ifndef OMITBAD

void bad30()
{
    int data;
    if(globalReturnsTrueOrFalse())
    {
        /* POTENTIAL FLAW: Don't initialize data */
        ; /* empty statement needed for some flow variants */
    }
    else
    {
        /* FIX: Initialize data */
        data = 5;
    }
    if(globalReturnsTrueOrFalse())
    {
        /* POTENTIAL FLAW: Use data without initializing it */
        printIntLine(data);
    }
    else
    {
        /* FIX: Ensure data is initialized before use */
        data = 5;
        printIntLine(data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good30()
{
    int data;
    if(globalReturnsTrueOrFalse())
    {
        /* POTENTIAL FLAW: Don't initialize data */
        ; /* empty statement needed for some flow variants */
    }
    else
    {
        /* POTENTIAL FLAW: Don't initialize data */
        ; /* empty statement needed for some flow variants */
    }
    if(globalReturnsTrueOrFalse())
    {
        /* FIX: Ensure data is initialized before use */
        data = 5;
        printIntLine(data);
    }
    else
    {
        /* FIX: Ensure data is initialized before use */
        data = 5;
        printIntLine(data);
    }
}
#endif /* OMITGOOD */

int main(){
    good30();
	bad30();
    return 1;
}