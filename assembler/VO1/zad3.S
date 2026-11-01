.section .data
.section .text
.globl main
main:
	movl $6, %eax
	movl $0, %ebx
	movl $1, %ecx
fib:
	addl %ecx, %ebx
	xchgl %ecx, %ebx
	decl %eax
	cmpl $1, %eax
	ja fib
	je end
end:
	movl $1, %eax
	movl $0, %ebx
	movl $1, %ecx
	int $0x80

