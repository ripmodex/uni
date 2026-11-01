.section .data
	n: .long 10
	rez: .long 1
.section .text
.globl main
main:
	cmpl $1, n	#hogy 1re is mukodjon
	jbe end		#n<=1 below or equal
	movl n, %eax
	movl %eax, rez
	decl n
	movl n, %eax
	movl $0, %ecx
faktorial:
	addl rez, %ecx
	decl %eax
	jnz faktorial	#ugrik ha nem nulla
	#cmpl $0, %eax
	#ja faktorial
	#jb end
	#je minus
	movl %ecx, rez
	movl $0, %ecx
	cmpl $1, n
	je end
	decl n
	movl n, %eax
	jmp faktorial
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
