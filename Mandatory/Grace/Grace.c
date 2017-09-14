/*
	This program will print its own source code when run.
*/

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define DATA "/*%c%cThis program will print its own source code when run.%c*/%c%c#include <stdio.h>%c#include <unistd.h>%c#include <fcntl.h>%c%c#define DATA %c%s%c%c#define FILE %c%s%c%c#define GRACE()int main(){int fd = open(FILE,O_CREAT|O_WRONLY|O_TRUNC,S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);if (fd){dprintf(fd,DATA,10,9,10,10,10,10,10,10,10,34,DATA,34,10,34,FILE,34,10,10,10);close(fd);}return 0;}%c%cGRACE()"
#define FILE "./Grace_kid.c"
#define GRACE()int main(){int fd = open(FILE,O_CREAT|O_WRONLY|O_TRUNC,S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);if (fd){dprintf(fd,DATA,10,9,10,10,10,10,10,10,10,34,DATA,34,10,34,FILE,34,10,10,10);close(fd);}return 0;}

GRACE()