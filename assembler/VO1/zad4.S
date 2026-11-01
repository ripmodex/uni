.section .data
.section .text
.globl main
main:
	movl $4, %eax
	movl %eax, %ebx
	decl %ebx
	movl %eax, %ecx
	movl $0, %edx
mult:
	addl %ecx, %edx
	decl %ebx
	cmpl $0, %ebx
	je fakt
	ja mult
fakt:
	movl %edx, %ecx
	movl $0, %edx
	decl %eax
	movl %eax, %ebx
	decl %ebx
	cmpl $1, %eax
	je end
	ja mult 
end:
	movl $1, %eax
	movl $0, %ebx
	movl $1, %ecx
	movl $0, %edx
	int $0x80

