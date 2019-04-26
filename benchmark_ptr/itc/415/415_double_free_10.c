// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Resource management defects
* Defect Sub-type: Double free
*
*/

#include <stdlib.h>

/*
* Types of defects: Double free
* Complexity:Free in a while loop with a constant
*/

void double_free_010_bad()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int flag=1;

	while(flag)
	{
		free(ptr);
		flag--;
	}
	free(ptr); /*Tool should detect this line as error*/ /*ERROR:Double free*/
}

/*
* Types of defects: Double free
* Complexity:Free in a while loop with a constant
*/

void double_free_010_good()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int flag=1;

	while(flag)
	{
		free(ptr); /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
		flag--;
	}
}

int main ()
{
	double_free_010_good();
	double_free_010_bad();
	return 0;
}
