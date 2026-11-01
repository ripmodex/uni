.section .data
	a: .quad 0x133456789
	b: .quad 0x123456789
.section .text
.globl main
main:
	movl b, %ebx
	movl b+4, %ecx
	cmpl a+4, %ecx
	je equal
	jg greater
	jl lower
equal:
	cmpl a, %ebx
	je eq
	ja greater
	jb lower
eq:
	movl $0, %eax
	jmp end
greater:
	movl $1,  %eax
	jmp end
lower:
	movl $-1, %eax
	jmp end
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
