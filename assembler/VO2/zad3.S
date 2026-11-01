.section .data
	a:   .quad 5
    	b:   .quad 3
	greska: .byte 0
.section .text
.globl main
main:
	movb $0, greska
	movl $0, %eax
	movl $0, %edx
	#cmpl $0, a
	#je end
	#cmpl $0, a+4
	#je end
	#cmpl $0, b
	#je end
	#cmpl $0, b+4
	#je end
mnozenje:
	addl a, %eax
	adcl a+4, %edx
	jc greska_ima
	subl $1, b
	sbbl $0, b+4
	cmpl $0, b
	jne mnozenje
	cmpl $0, b+4
	jne mnozenje
	jmp end
greska_ima:
	incb greska
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

