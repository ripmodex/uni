.section .data
	poruka1: .ascii "Unesite ime i prezime: \0"
	poruka1_len = . - poruka1
	poruka2: .ascii "Vi ste: \0"
	poruka2_len = . - poruka2
	imeprez: .fill 50,1,42 #bafer
	imeprez_len: .long 0
.section .text
.globl main
main:
	movl $4, %eax		#read sistemski poziv, unesite ime poruka
	movl $1, %ebx
	movl $poruka1, %ecx
	movl $poruka1_len, %edx
	int $0x80
	
	movl $3, %eax		#write sistemski poziv, sad unesimo ime
	movl $0, %ebx
	movl $imeprez, %ecx
	movl $50, %edx
	int $0x80
	
	movl $4, %eax		#read, sad citam drugi poruka
	movl $1, %ebx
	movl $poruka2, %ecx
	movl $poruka2_len, %edx
	int $0x80
	
	movl $imeprez, %eax	#ovaj ce biti stringova adresa
	movl $0, %ebx		#ovaj ce biti duzina stringova	
len:
	cmpb $42, (%eax)	#ovde cekamo prvi adres ako ima *, ako ne onda duzin i adresa +1
	je imelen
	incl %eax
	incl %ebx
	jmp len
imelen:
	movl %ebx, imeprez_len 	#ovde sacuvam duzina
	decl imeprez_len
	movb $0, (%eax)
	
	movl $imeprez, %eax
	movl $0, %ecx 		#indeks
toupper:
	cmpl %ecx, imeprez_len
	je piseime
	cmpb $32, (%eax)
	je razmak
	cmpb $'a', (%eax)	#trebamo da proveravamo ako je manje od a
	jb veliko
	cmpb $'z', (%eax)	#trebamo da proveravamo ako je veceo od z -> trebamo ovaj dva ako a<slovo<z
	ja veliko
	movb (%eax), %bl	#ovde dobijemo slovo, na ovim index
	subb $'a' - 'A', %bl	#ovde menjamo lower to upper($'a' - 'A' = 32 je ovaj vrednost)
	movb %bl, (%eax)
	incl %eax
	incl %ecx
	jmp toupper
veliko:
	incl %eax
	incl %ecx
	jmp toupper
razmak:
	incl %eax 		#ako nadimo razmak onda treba da naskocimo !!!!
	incl %ecx		#isto za duzina gde smo
	jmp toupper
piseime:
	movl $4, %eax		#write, ispisemo ime
	movl $1, %ebx
	movl $imeprez, %ecx
	movl imeprez_len, %edx
	int $0x80
	
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

