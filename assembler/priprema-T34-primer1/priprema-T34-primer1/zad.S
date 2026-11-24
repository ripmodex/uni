# autor: Botond Ezved SV58-2026
# int prebrojNajviseUzastopnih(unsigned long long* vrednost)

.section .text
.global prebrojNajviseUzastopnih
prebrojNajviseUzastopnih:
	pushl %ebp
	movl %esp, %ebp
	pushl %edi
	pushl %ebx
	pushl %edx
	pushl %esi			# az %esi-t is pusholni kell, ahogy kiderul, csak elfelejtetem
	
	movl 8(%ebp), %edi		# pointer za 64bitni broj -> ecx:ebx
	movl (%edi), %ebx		# nizi deo - broj !!!! a zarojelek kellenek oda mert anelkul csak a mutatojat mentjuk bele nem pedig az erteket !!!
	movl 4(%edi), %ecx		# visi deo - broj
	movl $0, %eax			# najveci uzastopni 0 broja
	movl $0, %esi			# uzastopni 0 brojac
	movl $0, %edx
	
#provera:				# a csupa nulla esetre nem jo, mert azt nezzi hogy nulla - e, es inkabb azt kell nezni a - 64ig elertunk-e
	#cmpl $0, %ecx			# ezt a maszkkal lenne erdemes csinalni, de igy se rossz
	#jnz uzastopninula
	#cmpl $0, %ebx
	#jz end
	#jnz uzastopninula
	
uzastopninula:
	cmpl $64, %edx
	je end
	testl $1, %ebx
	jz jenula
	jnz nenula

jenula:
	incl %esi
	shrl $1, %ecx
	rcrl $1, %ebx
	incl %edx
	jmp uzastopninula

nenula:
	cmpl %esi, %eax
	jl vece
	movl $0, %esi
	shrl $1, %ecx
	rcrl $1, %ebx
	incl %edx
	jmp uzastopninula
vece:
	movl %esi, %eax
	movl $0, %esi
	shrl $1, %ecx
	rcrl $1, %ebx
	incl %edx
	jmp uzastopninula
	
posvece:				# ako je vece od prethodne, onda menjamo
	movl %esi, %eax
	jmp return
end:					# poslednja provera ako je ima 0 i visi deo
	cmpl %esi, %eax
	jl posvece
	# ezt az egeszet lehetet volna magaban ott is csinalni ahol nezzuk hogy nulla-e de emigy nekem logikusabb, meg a masikat annyira nem tudom belepiteni igy egybol
return:
	popl %esi			# az %esi-t is igy kell hasznalni csak elfelejtetem
	popl %edx
	popl %ebx
	popl %edi
	movl %ebp, %esp
	popl %ebp
	ret
