.section .data
	a: .quad 9
	b: .quad 2
	rez: .quad 0
	ost: .quad 0
.section .text
.globl main
main:
	movl a, %eax
	movl a+4, %edx
deli:
	cmpl %edx, b+4
	jb oduzmi			#ha nagyobb az edx ami a+4, akkor mehet tovabb az osztas
	ja end				#ha kisebb akkor gatya
	cmpl %eax, b
	ja end
oduzmi:
	subl b, %eax
	sbbl b+4, %edx
	addl $1, rez
	adcl $0, rez+4		#jo volt a megerzes, nem kellet volna egyet hozza irni, mert majd a carry hozza adja
	jmp deli
end:
	movl %eax, ost		#a maradekot is tarolni kell
	movl %edx, ost+4	#szintugy
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
