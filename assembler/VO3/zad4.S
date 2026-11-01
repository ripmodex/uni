.section .data
	NELEM = 5
	niz1: .long 1, 2, 3, 4, 5
	niz2: .long 6, 7, 8, 9, 10
	rez: .fill 5, 4, 0
.section .text
.globl main
main:
	movl $0, %esi
petlja:	
	movl $0, %eax
	addl niz1(, %esi, 4), %eax
	addl niz2(, %esi, 4), %eax
	addl %eax, rez(, %esi, 4)
	incl %esi
	cmpl $NELEM, %esi
	jl petlja
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
