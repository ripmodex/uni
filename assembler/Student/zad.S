# autor: Botond Ezved Indeks SV58-2026
# unsigned long long postavi_jedinice(unsigned long long *vrednost)
.section .text
.global postavi_jedinice
postavi_jedinice:
	pushl %ebp
	movl %esp, %ebp
	pushl %edi
	pushl %ebx
	#pushl %edx 			# nem szabad igy hasznalni mert felulirja igy majd a kimenetet
	pushl %esi
	
	movl 8(%ebp), %ecx		# pointer za vrednost
	movl (%ecx), %eax		# nizi deo od vrednost
	movl 4(%ecx), %edx		# visi deo od vrednost
					# %edx:%eax
	movl $32, %esi			# itt is 32x fog lefutni a ciklus
	movl $0x80000000, %edi		# meg nem a 15. bit kell hogy 1 legyen hanem a 31 es azert nem 63, annyit nem bir el a regiszter
	movl $0, %ebx			# brojac za nula
provera:
	cmpl $0, %esi
	je rezultat
	
	testl %edi, %edx
	jnz nizi			# mert ha itt 1 akkor ki hagya az also reszt, es ha ott 0 van nem szamolja
	jz visinula
	
nizi:
	testl %edi, %eax
	jnz nijenula
	jz nizinula
	
visinula:
	incl %ebx
	jmp nizi 
	
nizinula:
	incl %ebx
	decl %esi
	shrl $1, %edi			# lefele dolgozunk ezert ott jobbra kell tolni te majom allatt
	jmp provera

nijenula:
	decl %esi
	shrl $1, %edi
	jmp provera
	
rezultat:				# popravimo rezultat
	movl $0, %edi			# kikell nullazni, mert ha nem akkor a regi maszk kerul be amikor nulla van
	cmpl $0, %ebx
	je end
	
	decl %ebx			# znamo ebx nije nulla onda mozda startujemo oda 1, i onda trebamo 1 manje iteracije
	
	movl $1, %edi
	movl $1, %eax
	
petlja:
	cmpl $0, %ebx
	je end
	
	shll $1, %eax
	orl %eax, %edi
	decl %ebx
	jmp petlja
	
end:
	movl %edi, %eax
	movl %edi, %edx
	
	popl %esi
	#popl %edx - ugyanazert mint fent, nem szabad igy lokaliskent hasznalni mert azta felul irodik es ezert volt a vegen az hogy csak az also volt csupa egyes a felso meg csupa 0
	popl %ebx
	popl %edi
	movl %ebp, %esp
	popl %ebp
	ret
