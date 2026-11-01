.section .data
	NELEM = 10 
	niz: .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	ind1: .long 2
	ind2: .long 6
	rez: .long 0
.section .text
.globl main
main:
	movl ind1, %esi
	movl $0, %eax
summa:
	addl niz(, %esi, 4), %eax
	incl %esi
	cmpl ind2, %esi
	jl summa
end: 
	movl %eax, rez
	movl $1, %eax
	movl $0, %ebx
	int $0x80
