/*
	This program will print its own source code when run.
*/

#include <stdio.h>

static int this_was_a_triumph()
{
	return 0;
}

int main(void)
{
	char *data="/*%c%cThis program will print its own source code when run.%c*/%c%c#include <stdio.h>%c%cstatic int this_was_a_triumph()%c{%c%creturn 0;%c}%c%cint main(void)%c{%c%cchar *data=%c%s%c;%c%cprintf(data,10,9,10,10,10,10,10,10,10,9,10,10,10,10,10,9,34,data,34,10,9,10,9,10,9,9,10,9,10,9,10);%c%c/*%c%c%cThe cake is a lie!%c%c*/%c%creturn this_was_a_triumph();%c}";
	printf(data,10,9,10,10,10,10,10,10,10,9,10,10,10,10,10,9,34,data,34,10,9,10,9,10,9,9,10,9,10,9,10);
	/*
		The cake is a lie!
	*/
	return this_was_a_triumph();
}