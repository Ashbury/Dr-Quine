; Did you like C? You will LOVE ASM!
section .data
string db "%c Did you like C? You will LOVE ASM!%csection .data%cstring db %c%s%c%csection .text%cextern _printf%cglobal _start%cglobal _main%c_start:%c_main:%cpush rbp%cmov rbp, rsp%cmov rcx, 30%cstack_setup:%cpush 10%cdec rcx%ccmp rcx, 0%cje done%cjmp stack_setup%cdone:%cadd dword [rsp], 24 %c Dark arts at work here%cadd dword [rsp + 144], 49%clea rdi, [rel string]%cmov rsi, 59%cmov rdx, 10%cmov rcx, 10%cmov r8, 34%clea r9, [rel string]%ccall _printf%cmov rsp, rbp%cleave%cret"
section .text
extern _printf
global _start
global _main
_start:
_main:
push rbp
mov rbp, rsp
mov rcx, 30
stack_setup:
push 10
dec rcx
cmp rcx, 0
je done
jmp stack_setup
done:
add dword [rsp], 24 ; Dark arts at work here
add dword [rsp + 144], 49
lea rdi, [rel string]
mov rsi, 59
mov rdx, 10
mov rcx, 10
mov r8, 34
lea r9, [rel string]
call _printf
mov rsp, rbp
leave
ret