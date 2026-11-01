.section .data
	n: .long 50
	a: .quad 0
	b: .quad 1
	rez: .quad 0
.section .text
.globl main
main: 
	movl a, %eax
	movl a+4, %edx
fibonacci:
	addl %eax, b
	adcl %edx, b+4
	xchgl %eax, b
	xchgl %edx, b+4
	decl n
	cmpl $0, n
	ja fibonacci
	je end
end:
	movl %eax, rez
	movl %edx, rez+4
	movl $1, %eax
	movl $0, %ebx
	int $0x80

