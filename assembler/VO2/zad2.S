.section .data
	a: .long 3
	b: .long 5
	rez: .long 0
.section .text
.globl main
main:
	cmpl $0, a
	je end
	cmpl $0, b
	je end
	movl a, %eax
	cmpl %eax, b
	ja menja
	jmp mnozenje
mnozenje:
	addl %eax, rez
	decl b
	cmpl $0, b
	ja mnozenje
	je end
menja:
	xchgl %eax, b
	jmp mnozenje
end:
	movl $1, %eax
	int $0x80

