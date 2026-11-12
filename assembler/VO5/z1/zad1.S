.section .text
.globl fibonaci
fibonaci:
	pushl %ebp
	movl %esp, %ebp
	pushl %esi
	pushl %ebx
	pushl %edi
	
	movl $2, %esi		#counter		
	movl $1, %ebx		#ovde ce biti rez vrednosta
	movl $1, %edi
	
petlja:
	cmpl %esi, 8(%ebp)	
	je end
	movl %ebx, %eax		#az xchgl miatt elcsuszott egy kicsit az egesz, ezert itt van az egesz fibonacci amit fejbol csinaltam meg, nem is olyan rosz
	addl %edi, %ebx		#igazabol annyi az egesz hogy elotte elmentjuk az ebx-et mert elfog tunni az erteke, es aztan az elozo edi-be meg bele teszuk az eax-ban levo temp ertket
	jc greska 		#itt megnezzuk hogy van-e hiba, ha tulleptuk a hatart mivel ezek unsigned-ak, ezert azt nezzuk ha van carry flag
	movl %eax, %edi
	incl %esi
	jmp petlja
greska:
	movl $1, %eax
	jmp izlaz
end:
	movl 12(%ebp), %esi	#nem birjuk eax-ben tarulni a vissza kuldott erteket mert ott lesza visszakuldott hiba van e vagy nem
	movl %ebx, (%esi)
	movl $0, %eax
izlaz:
	popl %edi
	popl %ebx
	popl %esi
	movl %ebp, %esp
	popl %ebp
	ret
