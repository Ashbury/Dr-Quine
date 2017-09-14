#include <fcntl.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define MAGIC_NUMBER 5

int main(void)
{
	char spawn[10] = {0};
	sprintf(spawn,"Sully_%d", MAGIC_NUMBER);
	char spawn_file[12] = {0};
	sprintf(spawn_file,"Sully_%d.c", MAGIC_NUMBER);
	char *args[] = {"gcc", "-Wall", "-Wextra", "-Werror", "-o", spawn, spawn_file, NULL};
	char *null_tab[] = {NULL};
	char *data = "#include <fcntl.h>%c#include <stdio.h>%c#include <sys/types.h>%c#include <sys/wait.h>%c#include <unistd.h>%c%c#define MAGIC_NUMBER %d%c%cint main(void)%c{%c%cchar spawn[10] = {0};%c%csprintf(spawn,%cSully_%cd%c, MAGIC_NUMBER);%c%cchar spawn_file[12] = {0};%c%csprintf(spawn_file,%cSully_%cd.c%c, MAGIC_NUMBER);%c%cchar *args[] = {%cgcc%c, %c-Wall%c, %c-Wextra%c, %c-Werror%c, %c-o%c, spawn, spawn_file, NULL};%c%cchar *null_tab[] = {NULL};%c%cchar *data = %c%s%c;%c%cint  fd =  open(spawn_file, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);%c%c%cif (!fd)%c%c%creturn -1;%c%cdprintf(fd,data,10,10,10,10,10,10,MAGIC_NUMBER-1,10,10,10,10,9,10,9,34,37,34,10,9,10,9,34,37,34,10,9,34,34,34,34,34,34,34,34,34,34,10,9,10,9,34,data,34,10,9,10,10,9,10,9,9,10,9,10,9,10,9,10,9,9,10,9,9,10,9,9,10,9,9,9,34,34,10,9,9,9,10,9,9,10,9,9,10,9,9,10,9,9,9,10,9,9,9,10,9,9,9,10,9,9,10,9,10,9,10);%c%cif (MAGIC_NUMBER > 0)%c%c{%c%c%cpid_t pid = fork();%c%c%cif (pid == 0)%c%c%c{%c%c%c%cexecve(%c/usr/bin/gcc%c, args, null_tab);%c%c%c%creturn -2;%c%c%c}%c%c%celse%c%c%c{%c%c%c%cwaitpid(0, NULL, 0);%c%c%c%cexecve(spawn, null_tab, null_tab);%c%c%c%creturn -3;%c%c%c}%c%c}%c%creturn 0;%c}";
	int  fd =  open(spawn_file, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);

	if (!fd)
		return -1;
	dprintf(fd,data,10,10,10,10,10,10,MAGIC_NUMBER-1,10,10,10,10,9,10,9,34,37,34,10,9,10,9,34,37,34,10,9,34,34,34,34,34,34,34,34,34,34,10,9,10,9,34,data,34,10,9,10,10,9,10,9,9,10,9,10,9,10,9,10,9,9,10,9,9,10,9,9,10,9,9,9,34,34,10,9,9,9,10,9,9,10,9,9,10,9,9,10,9,9,9,10,9,9,9,10,9,9,9,10,9,9,10,9,10,9,10);
	if (MAGIC_NUMBER > 0)
	{
		pid_t pid = fork();
		if (pid == 0)
		{
			execve("/usr/bin/gcc", args, null_tab);
			return -2;
		}
		else
		{
			waitpid(0, NULL, 0);
			execve(spawn, null_tab, null_tab);
			return -3;
		}
	}
	return 0;
}