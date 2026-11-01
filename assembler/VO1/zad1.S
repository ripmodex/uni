.section .data
.section .text
.globl main
main:
	movl $5, %eax
	movl $10, %ebx
add:
	addl %ebx, %eax
	cmpl $55, %eax
	jb add
	je end
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
