# Autor: Botond Ezved Indeks: SV58-2026
# int countSafeTracks(unsigned int *tracks, unsigned int n, unsigned int k, unsigned int minBlocks);
.section .text
.global countSafeTracks
countSafeTracks:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	pushl %edi
	pushl %ebx
	pushl %edx
	pushl %esi
	
	movl 8(%ebp), %edi		# tracks - pokazivac za priv element niza
	movl 12(%ebp), %ebx		# n - duzina niza
	movl 16(%ebp), %ecx		# k - min duzina uzastopnih 1
	movl 20(%ebp), %edx		# minBlock - min block koji moze mario predje
	movl $0, %esi			# koji element niza smo
	movl %esi, -4(%ebp)		# lokalna promenljive sa dovoljno staza brojac
		
petlja:
	movl 12(%ebp), %ebx		# daljemo vrednost nazad za duzina niza
	cmpl %esi, %ebx
	je end
	
	movl 8(%ebp), %edi		# samo dajemo vrednost nazad
	movl (%edi, %esi, 4), %eax	# i tog elemenata niza
	movl $0, %edi			# kog stepen smo na broj u binarno
	movl $1, %ebx			# maska za testl
	movl $0, %ecx			# koji uzastopni jedinica imamo
	movl $0, %edx			# suma koliko jedinica imamo u jedan staza
poelem:
	cmpl $32, %edi			# ovde proveramo ako smo na kraj broja
	je krajbroj
	
	testl %ebx, %eax		# ovde proveramo ako je prvi broj ima nula i jedinica na ebx stepen
	jz nula
	jnz jedinica
nula:
	cmpl 16(%ebp), %ecx		# ovde proveravamo ako je nula prethodne uzastopni jedinica da li je vece od k
	jae dovoljno
	
	movl $0, %ecx			# ako ne dodajemo 0
	incl %edi
	shll $1, %ebx
	jmp poelem

dovoljno:
	addl %ecx, %edx			# ako je dovoljno dodajemo k do suma (edx)
	
	movl $0, %ecx			# i onda dodajemo 0
	incl %edi
	shll $1, %ebx
	jmp poelem
	
jedinica:
	incl %ecx			# ako je 1 onda dodajemo 1 do brojac
	incl %edi
	shll $1, %ebx
	jmp poelem
	
krajdovoljno:
	addl %ecx, %edx			# ovde samo dodajemo
	jmp kraj			# arra kell meg oda figyelned hogy ha csinalsz egy ilyen felteteles ugrast akkor csinald meg neki a vissza utat az eredeti kodba !!!
	
krajbroj:
	cmpl 16(%ebp), %ecx		# ezt azert kell megtenni mert ha vegen csupa egyesek vannak akkor azokat nem adja hozza
	jae krajdovoljno		# ako je zadnji bio jedan i brojac sa 1 vece od k, onda trebamo da dodajemo do sumu

#krajdovoljno:
#	addl %ecx, %edx	

# arra kell itt figylned hogy ne tedd a felteteles ugrast rogton maga ala, mert ha nem is igaz akkor a kovetkezo sor az lenne amihez kell a feltetel, erre majd figyelj oda !!!
kraj:
	incl %esi
	cmpl 20(%ebp), %edx		# onda proveramo ako je suma vece od minBlock, i ako je dobro onda povecavamo lokalna promenljive
	jae dobrostaza
	jmp petlja

dobrostaza:
	incl -4(%ebp)			# ovda dodajemo 1 ako je dobra staza i Mario moze da predi
	jmp petlja
	
end:
	movl -4(%ebp), %eax		# ovde vratimo lokalna promenljive do povratna vrednost eax
	
	popl %esi
	popl %edx
	popl %ebx
	popl %edi
	movl %ebp, %esp
	popl %ebp
	ret

