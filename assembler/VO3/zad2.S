.section .data
	NELEM = 8
	niz: .long 2,3,4,56,34,23,5,61
	min: .long 1000
	max: .long 0
.section .text
.globl main
main:
	movl $niz, %esi		#indirektno adresiranje, u esi sacuvamo nizova adres kao 0x100, i saberom tipa svaki korak(1/2/4)
	movl min, %eax		#eax je min
	movl max, %ebx		#ebx je max
comp:
	cmpl (%esi), %eax
	jg novimin
	cmpl (%esi), %ebx
	jl novimax
	addl $4, %esi
	cmpl $niz+NELEM*4, %esi
	jl comp
	je end
novimin:
	movl (%esi), %eax
	jmp comp 
novimax:
	movl (%esi), %ebx
	jmp comp
end:
	movl %eax, min
	movl %ebx, max
	movl $1, %eax
	movl $0, %ebx
	int $0x80
