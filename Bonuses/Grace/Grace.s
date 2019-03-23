%define DATA "%cdefine DATA %c%s%c%c%cdefine NO_MAIN global _main%c%cdefine I_MEAN_REALLY_NO_MAIN _main:%csection .data%cfile db %cGrace_kid.s%c, 0%cdata db DATA%csection .text%cextern _dprintf%cglobal _start%cNO_MAIN%c_start:%cI_MEAN_REALLY_NO_MAIN%cpush rbp%cmov rbp, rsp%clea rdi, [rel file]%cmov rsi, 1537%cmov rdx, 420%cmov rax, 0x2000005%csyscall%cmov rcx, 48 %c Needs to be a multiple of 2 for the stack to be aligned on 16 bytes%cstack_setup:%cpush 10%cdec rcx%ccmp rcx, 0%cje done%cjmp stack_setup%cdone:%cadd dword [rsp + 8], 27%cadd dword [rsp + 24], 27%cadd dword [rsp + 48], 24%cadd dword [rsp + 56], 24%cadd dword [rsp + 184], 49%cmov rdi, rax%clea rsi, [rel data]%cmov rdx, 37%cmov rcx, 34%clea r8, [rel data]%cmov r9, 34%ccall _dprintf%cmov rax, 0x2000006%csyscall%cleave%cret"
%define NO_MAIN global _main
%define I_MEAN_REALLY_NO_MAIN _main:
section .data
file db "Grace_kid.s", 0
data db DATA
section .text
extern _dprintf
global _start
NO_MAIN
_start:
I_MEAN_REALLY_NO_MAIN
push rbp
mov rbp, rsp
lea rdi, [rel file]
mov rsi, 1537
mov rdx, 420
mov rax, 0x2000005
syscall
mov rcx, 48 ; Needs to be a multiple of 2 for the stack to be aligned on 16 bytes
stack_setup:
push 10
dec rcx
cmp rcx, 0
je done
jmp stack_setup
done:
add dword [rsp + 8], 27
add dword [rsp + 24], 27
add dword [rsp + 48], 24
add dword [rsp + 56], 24
add dword [rsp + 184], 49
mov rdi, rax
lea rsi, [rel data]
mov rdx, 37
mov rcx, 34
lea r8, [rel data]
mov r9, 34
call _dprintf
mov rax, 0x2000006
syscall
leave
ret