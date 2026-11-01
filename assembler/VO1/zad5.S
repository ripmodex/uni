.section .data
.section .text
.globl main
main:
	movl $8, %eax
	movl $4, %ebx
	movl $0, %ecx
deli:
	cmpl %ebx, %eax
	jb end
	subl %ebx, %eax
	incl %ecx
	jmp deli
end:
	movl $1, %eax
	movl $0, %ebx
	movl $1, %ecx
	int $0x80
