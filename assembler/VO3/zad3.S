.section .data
	NELEM = 8
	niz: .long 2,3,4,567,53,12,32,332
	rez: .long 0
	ost: .long 0
.section .text
.globl main
main:
	movl $0, %esi
	movl $0, %eax
petlja:
	addl niz(, %esi, 4), %eax
	incl %esi
	cmpl $NELEM, %esi
	jl petlja
	movl $0, %edx
	movl $NELEM, %ecx
	divl %ecx
end:
	movl %eax, rez
	movl %edx, ost
	movl $1, %eax
	movl $0, %ebx
	int $0x80
