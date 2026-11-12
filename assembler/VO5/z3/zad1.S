.section .text
.globl saberi_niz
saberi_niz:
	pushl %ebp
	movl %esp, %ebp		# erre figyelj oda, stack pointert teszed bele a base pointerbe
	pushl %esi
	pushl %ebx
	pushl %edi
	
	movl 8(%ebp), %eax	# a niz
	movl 12(%ebp), %ecx	# b niz
	movl 16(%ebp), %edx	# c niz
	movl 20(%ebp), %edi	# niz duzina
	#decl %edi
	movl $0, %esi					# olyan mintha ez lenne -> 0(%eax, %esi, 8) -> also resz
							# ez meg a felso resz lesz -> 4(%eax, %esi, 8) -> felso resz
	
petlja:
	cmpl %esi, %edi
	jle izlaz
	
	movl (%ecx, %esi, 8), %ebx			# az volt a hibad, hogy tul gondoltad aztan meg nem gondolkodtal
	addl (%eax, %esi, 8), %ebx			# a megoldas vegul az volt hogy az egyik bele mentsuk a temp ebx-be aztan meg hozzadjuk a masikat a temphez, es aztan ez az egeszet bele a vegsobe
	movl %ebx, (%edx, %esi, 8)			
	
	movl 4(%ecx, %esi, 8), %ebx			# itt is ugyanaz a gondolatmenet erdemes megjegyezni, mert ez quad niz es fontos ha tudja hasznalni az ember	
	adcl 4(%eax, %esi, 8), %ebx			# csak gondolkodj es ne engedj hulyesegeknek, mert jo volt az alap gondolatod, hogy jo mint overflownal van hiba
	jo greska
	movl %ebx, 4(%edx, %esi, 8)
	
	incl %esi
	jmp petlja
greska:
	movl $1, %eax
	jmp end	
izlaz:
	movl $0, %eax		# igazabol nem mindig muszaj szerintem vissza kuldeni itt egy erteket, csak itt fontos a hiba valtozot jo beallitani
end:				# ebben az esetben nem kell mert eppen oda teszuk be mindig az eredmenyt amit majd visszakuldunk szepen
	popl %edi
	popl %ebx
	popl %esi
	movl %ebp, %esp 	# itt meg visszaallitod a stack pointer erteket az eredetire
	popl %ebp
	ret
