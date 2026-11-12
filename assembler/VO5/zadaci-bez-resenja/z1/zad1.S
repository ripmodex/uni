.section .text
.global fibonaci
fibonaci:
	pushl %ebp
	movl %esp, %ebp
	pushl %esi
	pushl %ebx
	pushl %edi
	
	movl $2, %esi		# counter itt kettorol indul mert nincs xchgl, mert mar az elso ket lepes megvan
	movl $1, %ebx
	movl $1, %ecx
	
petlja:
	cmpl %esi, 8(%ebp)
	je izlaz
	movl %ebx, %edi
	addl %ecx, %ebx
	jc greska
	movl %edi, %ecx
	incl %esi
	jmp petlja
greska:
	movl $1, %eax
	jmp end
izlaz:
	movl $0, %eax
	movl 12(%ebp), %esi	# mondom mit kell csinalni itt es meg jegyezni:
	movl %ebx, (%esi)	# kimetnjuk rez-nek az adreset egy registerbe amit nem hasznalunk, es aztan amikor az megvan kesobb annak regiszterben levo adresere teszuk be az erteket ami meg egyezik a rezel
end:
	popl %edi
	popl %ebx
	popl %esi
	movl %ebp, %esp
	popl %ebp
	ret			# es a kibaszott ret -> mint return ne felejtsd mar le te csomag krumpli
