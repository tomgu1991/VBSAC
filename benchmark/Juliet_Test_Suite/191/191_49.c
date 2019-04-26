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


static int staticReturnsTrue()
{
    return 1;
}

static int staticReturnsFalse()
{
    return 0;
}

#ifndef OMITBAD

void bad49()
{
    short data;
    data = 0;
    if(staticReturnsTrue())
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%hd", &data);
    }
    if(staticReturnsTrue())
    {
        if(data < 0) /* ensure we won't have an overflow */
        {
            /* POTENTIAL FLAW: if (data * 2) < SHRT_MIN, this will underflow */
            short result = data * 2;
            printIntLine(result);
        }
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good49()
{
    short data;
    data = 0;
    if(staticReturnsTrue())
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%hd", &data);
    }
    if(staticReturnsFalse())
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        if(data < 0) /* ensure we won't have an overflow */
        {
            /* FIX: Add a check to prevent an underflow from occurring */
            if (data > (SHRT_MIN/2))
            {
                short result = data * 2;
                printIntLine(result);
            }
            else
            {
                printLine("data value is too small to perform multiplication.");
            }
        }
    }
}



#endif /* OMITGOOD */


int main(){
	good49();
    bad49();
    return 1;
}