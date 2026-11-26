# autor: Botond Ezved Indeks SV58-2026
# unsigned int setOnes(unsigned int numOnes, unsigned int start)
.section .text
.global setOnes
setOnes:
	pushl %ebp
	movl %esp, %ebp
	pushl %edi
	pushl %edx
	pushl %ebx
	pushl %esi
	
	movl 8(%ebp), %ecx		# numOnes, koliko jedinica zelimo da staviom
	movl 12(%ebp), %ebx		# start kod koji index zelimo da staviom od levo ili desno
	
	cmpl $0, %ecx
	jbe end
	cmpl $0, %ebx
	jb end
	cmpl $32, %ecx
	jae end
	
	movl $0, %esi			# az volt a hiba hogy 31-rol inditotad, es nem is tudom miert igy csinaltad, amikor logikus hogy 32 darab munka lessz
	movl $0, %eax 
# tul koplikaltad eloszor amikor irtad, de majd ha ott vagy akkor erdemesebb elmenteni azt a verziot ami bar mukodik es aztan probalgatni optimalizalgatni
# ez sem komplikalt a fo otletet te talaltad ki magad csak aztan mar egy kicsit osszeestel fejben, es nem tudtal tisztan gondolkodni, ezt probald ott elkerulni
# es atnezni tobbszor a logikat es akkor meg lesz hogy ha egy helyen nem fer be akkor nem dobod ki a picsaba, hanem megzed hogy amot befer-e, pl itt a desno-s ugras errol szol
stepeni:
	cmpl $32, %esi
	je end
	
	movl $32, %edx
	subl %ebx, %edx			# visi granica 31-10 = 21
	cmpl %edx, %esi
	jae desni
	
	subl %ecx, %edx			# donji granica 21-5 = 16
	cmpl %edx, %esi
	jae dobro
	
desni:
	movl %ebx, %edx			# visi granica koje je 10 + 5 (numOnes) = 15
	addl %ecx, %edx
	cmpl %edx, %esi 
	jge nijedobro
	
	cmpl %ebx, %esi			# donji granica koji je start = 10
	jge dobro
	
nijedobro:
	incl %esi
	jmp stepeni
dobro:
	movl %esi, %ecx
	movl $1, %edi
	#decl %ecx
	shll %cl, %edi
	orl %edi, %eax			# menjamo 0 do 1
	movl 8(%ebp), %ecx
	incl %esi
	jmp stepeni
	
	
#stepeninizideo:
	#movl $0, %esi
	#jmp nizipetlja
	
#nizipetlja:
	#cmpl $16, %esi
	#je end
	
	
	
	#movl %esi, %ecx
	#movl $1, %edi
	#shll %cl, %edi
	#orl %edi, %eax
	#movl 8(%ebp), %ecx
	#incl %esi
	#jmp nizipetlja
	
#nijenizi:
#	incl %esi
#	jmp nizipetlja
	
end:
	popl %esi
	popl %ebx
	popl %edx
	popl %edi
	movl %ebp, %esp
	popl %ebp
	ret
