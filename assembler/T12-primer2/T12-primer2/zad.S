#autor: Botond Ezved SV58-2026

.section .data
	ulaz_str: .ascii "Unesite string: \0"
	ulazlen = . - ulaz_str
	
	maxlen = 50
	
	poruka: .fill maxlen, 1, 42
	porukalen: .long 0
.section .text
.global main
main:
	movl $4, %eax			# write
	movl $1, %ebx
	movl $ulaz_str, %ecx
	movl $ulazlen, %edx
	int $0x80
	
	movl $3, %eax			# read
	movl $0, %ebx
	movl $poruka, %ecx
	movl $maxlen, %edx
	int $0x80

	movl $poruka, %eax
	movl $0, %esi
		
porukalength:
	cmpb $10, (%eax, %esi, 1)
	je dajemlength
	
	incl %esi
	jmp porukalength

dajemlength:
	movl %esi, porukalen
	
	movl $0, %esi
	movl $0, %edi			# koliko puta ima dve malo slovo
	movl $0, %ebx			# ebx = 1 ako je prethodni karakter bio maloslovo
	
dvemaloslovo:
	cmpl %esi, porukalen
	je end
	
	cmpb $97, (%eax, %esi, 1)	# da li je manje od a
	jl nijemalo
	cmpb $122, (%eax, %esi, 1)	# da li je vece od z
	jg nijemalo
	
	cmpl $1, %ebx			# da li je prethodno char malo slovo
	je maloslovo
	
	movl $1, %ebx
	incl %esi
	jmp dvemaloslovo

maloslovo:
	movl $1, %ebx
	incl %edi			# ako naslismo dve malo slovo onda plus 1
	incl %esi
	jmp dvemaloslovo
	
nijemalo:
	movl $0, %ebx
	incl %esi
	jmp dvemaloslovo
	
	#movl $4, %eax
	#movl $1, %ebx
	#movl $poruka, %ecx
	#movl porukalen, %edx
	#int $0x80
end:
	movl $1, %eax
	movl %edi, %ebx		# majd ide kell tenni az kimeneti kodot hogy mennyi ilyen betu van
	int $0x80
