# ime: Botond Ezved indeks: SV58-2026
.section .data
	ulaz_str: .ascii "Unesite string: \0"
	ulazlen = . - ulaz_str
	
	maxlen = 30
	
	poruka: .fill maxlen, 1, 42
	porukalen: .long 0
.section .text
.global main
main:
	movl $4, %eax			# write unos
	movl $1, %ebx
	movl $ulaz_str, %ecx
	movl $ulazlen, %edx
	int $0x80
	
	movl $3, %eax			# read poruka
	movl $0, %ebx
	movl $poruka, %ecx
	movl $maxlen, %edx
	int $0x80
	
	movl $poruka, %eax
	movl $0, %esi
	
porukalength:
	cmpb $10, (%eax, %esi, 1)
	je next
	
	incl %esi
	jmp porukalength

next:
	movl %esi, porukalen		# ovde proveramo da li je paran ili neparan
	movl $0, %edi
	movl $0, %ecx			# brojac sa kad menjamo znak u string

	testl $1, %esi
	jz paran
	jnz neparan

neparan:
	cmpl %edi, %esi
	je end
	
	testl $1, %edi			# ako je neparan onda svaki paran pozicija ce treba biti *, parni su 0,2,4,6....
	jnz neparanpoz
	
	movb $42, (%eax, %edi, 1)
	incl %ecx
	incl %edi
	jmp neparan
	
neparanpoz:
	incl %edi
	jmp neparan
	
paran:					# ako je paran, onda svaki neparni pozicija ce treba biti *, i 0 je parni pozicija, neparni su 1,3,5,7...
	cmpl %edi, %esi
	je end
	
	testl $1, %edi
	jz paranpoz
	
	movb $42, (%eax, %edi, 1)
	incl %ecx
	incl %edi
	jmp paran
paranpoz:
	incl %edi
	jmp paran
	
end:
	#movl $4, %eax
	#movl $1, %ebx
	#movl $poruka, %ecx
	#movl porukalen, %edx
	#int $0x80
	
	movl $1, %eax
	#movl $0, %ebx -> jol kell elolvasni a feladato es azt mondja ki hogy b-ben kell vissza a kuldeni a cserek szamat
	movl %ecx, %ebx
	int $0x80
