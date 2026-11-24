# Unese se string 
# Prebrojati koliko puta se javljaju dva uzastopna mala slova
# Nikad nece biti vise od dva uzastopna slova
# "Ab125cd" ---> 1
	

#autor: Imenko Prezimić INDEX ra1234-2015

.section .data

	ulaz_str: .ascii "Unesite string: \0"
	ulaz_str_len = . - ulaz_str
	
	unos_max = 50
	unos: .fill unos_max, 1, 42
	unos_len: .long 0
	
.section .text
.globl main
main:

	movl $4, %eax
	movl $1, %ebx	
	movl $ulaz_str, %ecx
	movl $ulaz_str_len, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx	
	movl $unos, %ecx
	movl $unos_max, %edx
	int $0x80
	movl %eax, unos_len
	
	movl $unos, %esi	# esi - registar za ucitani string
	movl $0, %ebx		# ebx - brojac uzastopnih malih slova
	
petlja:
	cmpb $10, (%esi)
	je kraj
	cmpb $'a', (%esi)
	jb sledeci_karakter
	cmpb $'z', (%esi)
	jbe jedno_malo_slovo
	jmp sledeci_karakter
	
sledeci_karakter:
	incl %esi
	jmp petlja
	
jedno_malo_slovo:
	cmpb $'a', 1(%esi)
	jb sledeci_karakter
	cmpb $'z', 1(%esi)
	jbe dva_mala_slova
	jmp sledeci_karakter
	
dva_mala_slova:
	incl %ebx
	
	addl $2, %esi
	jmp petlja
	
kraj:
	movl $1, %eax
	int $0x80

