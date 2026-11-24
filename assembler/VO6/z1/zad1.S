.section .text
.global maska
maska:
	pushl %ebp
	movl %esp, %ebp
	pushl %esi
	pushl %ebx
	pushl %edi
	
	movl 8(%ebp), %ecx	# n (koji mesta treba da biti, 32bit)
	movl 12(%ebp), %ebx	# v (ako je znak 0 ili 1, ostali su suprotni)
	
	cmpl $31, %ecx		# meg ez nem 32, azert mert a 32.bit az 31 indexe van, itt is ugy mukodik
	ja greska
	cmpl $0, %ecx
	jb greska
	cmpl $1, %ebx
	ja greska
	cmpl $0, %ebx
	jb greska
	
	movl $1, %eax
	shll %cl, %eax
	
	cmpl $1, %ebx
	je kraj
	notl %eax
	jmp kraj		# meg elfelejted ezt ide irni, mert az volt a baj, hogy akkor alapbol at ment a greskara, nem a krajra, figyelj oda
greska:
	movl $0, %eax
	jmp kraj
kraj:
	popl %edi		# el felejteted, hogy potprogramban vagy es ezt kell a vegere irnod !!
	popl %ebx		# jol csinaltad csak, elfelejted ezt a vegere irni
	popl %esi
	movl %ebp, %esp
	popl %ebp
	ret
