// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 369 Divide by Zero
 */

#include "369.h"

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

static int staticFive = 5;

#ifndef OMITBAD

void bad27()
{
    int data;
    /* Initialize data */
    data = -1;
    if(1)
    {
        /* POTENTIAL FLAW: Read data from the console using fscanf() */
        fscanf(stdin, "%d", &data);
    }
    if(1)
    {
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 % data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good27()
{
    int data;
    /* Initialize data */
    data = -1;
    if(1)
    {
        /* POTENTIAL FLAW: Read data from the console using fscanf() */
        fscanf(stdin, "%d", &data);
    }
    if(0)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: test for a zero denominator */
        if( data != 0 )
        {
            printIntLine(100 % data);
        }
        else
        {
            printLine("This would result in a divide by zero");
        }
    }
}

#endif /* OMITGOOD */

int main(){
	good27();
    bad27();
    return 1;
}