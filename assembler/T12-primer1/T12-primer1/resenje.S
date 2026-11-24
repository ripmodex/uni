.section .data
	input_msg: .ascii "Unesite string: \0"
    input_len = . - input_msg
    output_msg: .ascii "Izlaz: \0"
    output_len = . - output_msg
    max_len = 30
    input: .fill max_len, 1, 42
    output: .fill max_len, 1, 42
.section .text
.global main
main:
    movl $4, %eax
    movl $1, %ebx
    movl $input_msg, %ecx
    movl $input_len, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    movl $input, %ecx
    movl $max_len, %edx
    int $0x80

    movl $0, %esi      
    movl $output, %eax
while: 
    cmpb $10, (%ecx)
    je end
    cmpb $'i', (%ecx)
    je prepare_reverse
    movb (%ecx), %dl
    movb %dl, (%eax, %esi, 1)
    incl %ecx
    incl %esi
    jmp while
prepare_reverse:
    movl %esi, %ebx
    decl %esi   
    movl $0, %edi
reverse:
    /* jge jer ako 'i' nema sta ta okrene onda ce %esi biti -1.
       Ovaj edge-case se ne trazi da se pokrije u zadatku. */
    cmpl %esi, %edi
    jge finish_reverse 
    movb (%eax, %esi, 1), %dl
    movb (%eax, %edi, 1), %dh
    movb %dh, (%eax, %esi, 1)
    movb %dl, (%eax, %edi, 1)
    decl %esi
    incl %edi
    jmp reverse
finish_reverse:
    movl %ebx, %esi
    incl %ecx
    jmp while
end:
    movb $10, (%eax, %esi, 1)   
    incl %esi

    movl $4, %eax
    movl $1, %ebx
    movl $output_msg, %ecx
    movl $output_len, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx
    movl %esi, %edx
    int $0x80

    movl $1, %eax
    movl $0, %ebx
    int $0x80
