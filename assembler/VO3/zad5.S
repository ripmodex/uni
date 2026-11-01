.section .data
	NELEM = 6
	niz: .long 1, 2, 3, 4, 4, 1
	min: .fill NELEM, 4, 0		#hogy szebb legyen es ha valami 0-dik indeksen van azt ugy lehet megoldani hogy -1 el toltjuk fel
	max: .fill NELEM, 4, 0		#es igy szepen fognak latszani melyik indeksen mi van, de nekem igy szebb, es meg csak sacuvajnal kell ertek csere es kesz
.section .text
.globl main
main:
	movl $0, %esi
	movl $1000, %eax	#eax je min
	movl $0, %ebx		#ebx je max
granvred:
	cmpl niz(, %esi, 4), %eax
	jg novimin
	cmpl niz(, %esi, 4), %ebx
	jl novimax
	incl %esi
	cmpl $NELEM, %esi
	jl granvred
	je resetmin
novimin:
	movl niz(, %esi, 4), %eax
	jmp granvred
novimax:
	movl niz(, %esi, 4), %ebx
	jmp granvred
resetmin:
	movl $0, %esi
	jmp minind
minind:
	cmpl $NELEM, %esi
	je resetmax
	cmpl niz(, %esi, 4), %eax
	jne minindsled
	je minsacuvaj
minsacuvaj:
	movl %eax, min(, %esi, 4)
	jmp minindsled
minindsled:
	incl %esi
	jmp minind
resetmax:
	movl $0, %esi
	jmp maxind
maxind:
	cmpl $NELEM, %esi
	je end
	cmpl niz(, %esi, 4), %ebx
	jne maxindsled
	je maxsacuvaj
maxsacuvaj:
	movl %ebx, max(, %esi, 4)
	jmp maxindsled
maxindsled:
	incl %esi
	jmp maxind
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
