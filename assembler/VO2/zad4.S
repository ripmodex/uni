.section .data
	n: .long 10
	a: .long 0
	b: .long 1
	rez: .long 0
.section .text
.globl main
main:
	movl a, %eax
fibonacci: 
	addl %eax, b
	xchgl %eax, b
	movl %eax, rez
	decl n
	#jnz fibonacci jump if not zero flag
	cmpl $0, n
	ja fibonacci
	je end
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
