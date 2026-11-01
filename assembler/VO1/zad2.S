.section .data
.section .text
.globl main
main:
	movl $5, %eax
	movl $3, %ebx
	movl $0, %ecx
mult:
	cmpl %ebx, %eax
	ja zamena
	addl %ebx, %ecx
	decl %eax
	cmpl $0, %eax
	ja mult
	je end
zamena:
	xchgl %ebx, %eax
	jmp mult
end:
	movl $1, %eax
	movl $0, %ebx
	movl $1, %ecx
	int $0x80
