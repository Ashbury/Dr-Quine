section .data
data db "section .data%cdata db %c%s%c, 0%csystem db %cnasm -f macho64 Sully_%%d.s && ld -lSystem -macosx_version_min 10.12 -o Sully_%%d Sully_%%d.o && rm *.o && ./Sully_%%d%c, 0%cspawn_file db %cSully_%%d.s%c, 0%csection .text%cglobal _start%cglobal _main%cextern _sprintf%cextern _dprintf%cextern _malloc%cextern _free%cextern _system%c_start:%c_main:%cpush rbp%cmov rbp, rsp%cmov r14, %d%cmov r15, r14%cdec r15%cmov rdi, 10%ccall _malloc%cmov r13, rax%cmov rdi, r13%clea rsi, [rel spawn_file]%cmov rdx, r14%ccall _sprintf%cmov rdi, r13%cmov rsi, 1537%cmov rdx, 420%cmov rax, 0x2000005%csyscall%cmov r12, rax%cmov rdi, r13%ccall _free%cmov rcx, 80%cstack_setup:%cpush 10%cdec rcx%ccmp rcx, 0%cje done%cjmp stack_setup%cdone:%cadd dword [rsp + 8], 24%cadd dword [rsp + 16], 24%cadd dword [rsp + 32], 24%cadd dword [rsp + 40], 24%cmov qword [rsp + 152], r15%cmov rdi, r12%clea rsi, [rel data]%cmov rdx, 10%cmov rcx, 34%clea r8, [rel data]%cmov r9, 34%ccall _dprintf%cmov rdi, r12%cmov rax, 0x2000006%csyscall%ccmp r14, 0%cjle end%cmov rdi, 100%ccall _malloc%cmov r13, rax%cmov rdi, r13%clea rsi, [rel system]%cmov rdx, r14%cmov rcx, r14%cmov r8, r14%cmov r9, r14%ccall _sprintf%cmov rdi, r13%ccall _system%cmov rdi, r13%ccall _free%cend:%cleave%cret", 0
system db "nasm -f macho64 Sully_%d.s && ld -lSystem -macosx_version_min 10.12 -o Sully_%d Sully_%d.o && rm *.o && ./Sully_%d", 0
spawn_file db "Sully_%d.s", 0
section .text
global _start
global _main
extern _sprintf
extern _dprintf
extern _malloc
extern _free
extern _system
_start:
_main:
push rbp
mov rbp, rsp
mov r14, 5
mov r15, r14
dec r15
mov rdi, 10
call _malloc
mov r13, rax
mov rdi, r13
lea rsi, [rel spawn_file]
mov rdx, r14
call _sprintf
mov rdi, r13
mov rsi, 1537
mov rdx, 420
mov rax, 0x2000005
syscall
mov r12, rax
mov rdi, r13
call _free
mov rcx, 80
stack_setup:
push 10
dec rcx
cmp rcx, 0
je done
jmp stack_setup
done:
add dword [rsp + 8], 24
add dword [rsp + 16], 24
add dword [rsp + 32], 24
add dword [rsp + 40], 24
mov qword [rsp + 152], r15
mov rdi, r12
lea rsi, [rel data]
mov rdx, 10
mov rcx, 34
lea r8, [rel data]
mov r9, 34
call _dprintf
mov rdi, r12
mov rax, 0x2000006
syscall
cmp r14, 0
jle end
mov rdi, 100
call _malloc
mov r13, rax
mov rdi, r13
lea rsi, [rel system]
mov rdx, r14
mov rcx, r14
mov r8, r14
mov r9, r14
call _sprintf
mov rdi, r13
call _system
mov rdi, r13
call _free
end:
leave
ret