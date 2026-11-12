.section .data
	poruka: .ascii "Unesite string: \0"
	poruka_len = .-poruka
	nijep:  .ascii "String nije palindrom.\n\0"
	nijep_len = .-nijep
	jestep: .ascii "String je palindrom.\n\0"
	jestep_len = .-jestep
	unos:   .fill 50,1,42
	unos_len: .long 0
.section .text
.globl main
main:
	movl $4, %eax		#write poruka
	movl $1, %ebx
	movl $poruka, %ecx
	movl $poruka_len, %edx
	int $0x80
	
	movl $3, %eax		#read in unos
	movl $0, %ebx
	movl $unos, %ecx
	movl $50, %edx
	int $0x80
	
	movl $unos, %eax
	movl $0, %ebx
len:
#	cmpb $42, (%eax)
#	je imelen
	cmpb $10, (%eax)	#brisemo novi red \n
	je brisinovired
	incl %eax
	incl %ebx
	jmp len
brisinovired:
	movb $0, (%eax)		#trebam da stavimo kraj string pre \n
imelen:
	movl %ebx, unos_len
#	movb $0, (%eax)		#pazi ako zelis da radis sa 1 slovo odan b treba !!!
#piseunos:
#	movl $4, %eax
#	movl $1, %ebx
#	movl $unos, %ecx
#	movl unos_len, %edx
#	int $0x80
	
	movl $unos, %eax	#pozitivna smer ->
	movl $unos, %ebx	#negativna smer <-
	movl $0, %esi		#indeks
	addl unos_len, %ebx
	decl %ebx 		#sad mismo na asa\0 na \0 char
palindrom:
	cmpl %ebx, %eax		#ovde cekamo samo adresi
	jge jestepalindrom
	
	movb (%eax), %cl	#ovde cekamo ako dve slova je jednako
	cmpb %cl, (%ebx)
	jne nijepalindrom
	
	incl %eax
	decl %ebx
	jmp palindrom
	
#ovi su pogresan se radi, samo proverava prvi i poslednji karakter !!!
#
#
#	cmpl unos_len, %esi	#na most ez elege tul komplikaltam sok regiszter el fecsereltem, es az enyem ketszer nezi a dolgokat, ami nem rosz de gatya
#	je gotovo		#szoval igazabol annyit kell nezni hogy mikor er ossze a ketto a es b, es amikor je vagy jge azert mert ha paros ezt is nezni kell azert kell a g
#	movb (%eax), %cl	#meg nem kellet volna esit is hasznalni, meg a d-t is feleslegesen hasznaltad mert ha azt mondod gatya akkor rogton irhatod is
#	cmpb %cl, (%ebx)
#	je dobro
#	jne nije
#dobro:
#	movl $1, %edx
#	incl %esi
#	incl %eax
#	decl %ebx
#	jmp palindrom
#nije:
#	movl $0, %edx
#	je gotovo
#gotovo:
#	cmpl $0, %edx
#	je nijepalindrom
#	cmpl $1, %edx
#	je jestepalindrom

nijepalindrom:
	movl $4, %eax
	movl $1, %ebx
	movl $nijep, %ecx
	movl $nijep_len, %edx
	int $0x80
	
	movl $1, %eax
	movl $1, %ebx
	int $0x80
jestepalindrom:
	movl $4, %eax
	movl $1, %ebx
	movl $jestep, %ecx
	movl $jestep_len, %edx
	int $0x80
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
#end:
#	movl $1, %eax
#	movl $0, %ebx
#	int $0x80

