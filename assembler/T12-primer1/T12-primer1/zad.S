#autor: Botond Ezved SV58-2026
.section .data
    input_msg: .ascii "Unesite string: \0"
    inputlen = . - input_msg
    output_msg: .ascii "Izlaz: \0"
    outputlen = . - output_msg
    
    max_len = 30
    
    poruka: .fill max_len, 1, 42
    porukalen: .long 0
    
    temppor: .fill max_len, 1, 42
    tempporlen: .long 0
    
    tempedi: .long 0
.section .text
.global main
main:
	movl $4, %eax			# write
	movl $1, %ebx
	movl $input_msg, %ecx
	movl $inputlen, %edx
	int $0x80
	
	movl $3, %eax			# read
	movl $0, %ebx
	movl $poruka, %ecx
	movl $max_len, %edx
	int $0x80
	
	movl $0, %esi
	movl $poruka, %eax
	
porukalength:
	cmpb $10, (%eax)
	je movlen
	incl %esi
	incl %eax
	jmp porukalength
movlen:
	movl %esi, porukalen
	
	movl $poruka, %eax
	movl $temppor, %ebx
	movl $0, %esi
	movl $0, %edi
	
checkfori:
	cmpb $10, (%eax, %esi, 1)
	je porukaend
	cmpb $105, (%eax, %esi, 1)
	je slovoi
	
	movb (%eax, %esi, 1), %cl
	movb %cl, (%ebx, %edi, 1)
	
	incl %esi
	incl %edi
	jmp checkfori
	
slovoi:
	movl %edi, tempedi
	decl %edi			# azert kell ez mert a arhitektura -ban a 3. van az i es nekunk ki kell hagyni azt
	movl $0, %edx
	
obrnuti:
	cmpl %edx, %edi
	jbe doneobrnuti
	
	movb (%ebx, %edi, 1), %al	# zadnji element
	movb (%ebx, %edx, 1), %cl	# prvi element
	
	movb %al, (%ebx, %edx, 1)	# stavimo zadnji u prvi
	movb %cl, (%ebx, %edi, 1)	# stavimo prvi u zadnji
	
	decl %edi
	incl %edx
	jmp obrnuti
	
doneobrnuti:
	incl %esi			# figyelj oda nem movl hanem addl majom
	movl tempedi, %edi
	movl $poruka, %eax
	jmp checkfori
	
porukaend:
	movl %edi, tempporlen
	
	movl $4, %eax
	movl $1, %ebx
	movl $output_msg, %ecx
	movl $outputlen, %edx
	int $0x80
	
	#movl $4, %eax
	#movl $1, %ebx
	#movl $poruka, %ecx
	#movl porukalen, %edx
	#int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	movl $temppor, %ecx
	movl tempporlen, %edx
	int $0x80
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
