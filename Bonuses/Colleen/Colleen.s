section .data
string db "section .data%cstring db %c%s%c%csection .text%cextern _printf%cglobal _start%cglobal _main%c_start:%c_main:%cpush rbp%cmov rbp, rsp%cmov rcx, 30 %c Needs to be a multiple of 2 for the stack to be align on 16 bytes%cstack_setup:%cpush 10%cdec rcx%ccmp rcx, 0%cje done%cjmp stack_setup%cdone:%cadd dword [rsp + 64], 49 %c Dark arts at work here%cadd dword [rsp + 136], 49%clea rdi, [rel string]%cmov rsi, 10%cmov rdx, 34%clea rcx, [rel string]%cmov r8, 34%cmov r9, 10%ccall _printf%cmov rsp, rbp%cleave%cret"
section .text
extern _printf
global _start
global _main
_start:
_main:
push rbp
mov rbp, rsp
mov rcx, 30 ; Needs to be a multiple of 2 for the stack to be align on 16 bytes
stack_setup:
push 10
dec rcx
cmp rcx, 0
je done
jmp stack_setup
done:
add dword [rsp + 64], 49 ; Dark arts at work here
add dword [rsp + 136], 49
lea rdi, [rel string]
mov rsi, 10
mov rdx, 34
lea rcx, [rel string]
mov r8, 34
mov r9, 10
call _printf
mov rsp, rbp
leave
ret