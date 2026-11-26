# int countSafeTracks(unsigned int *tracks, unsigned int n, unsigned int k, unsigned int minBlocks);
.section .text
.global countSafeTracks
countSafeTracks:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
    movl 8(%ebp), %edx # bazni registar za staze
    movl $0, %esi # idx
    movl $0, %eax
end_or_reset:
    cmpl 12(%ebp), %esi
    je end
    movl $0, %ecx # counter uzastopnih jedinica (duzine bloka)
    movl $1, %ebx # maska 
    movl $0, %edi # counter sigurnih blokova na stazi
loop_track:
    testl %ebx, (%edx, %esi, 4)
    jz zero
    incl %ecx
    shll $1, %ebx
    jc track_finished
    jmp loop_track
zero: # naisli na nulu gledamo da li je prehodni blok bio siguran ili ne
    cmpl %ecx, 16(%ebp)
    ja reset_ones_counter # nedovoljno uzastopnih
    addl %ecx, %edi
reset_ones_counter:
    movl $0, %ecx
    shll $1, %ebx
    jc track_finished
    jmp loop_track
track_finished:
    # ako smo zavrsili stazu sa jedinicama, imamo nesto u counteru
    cmpl %ecx, 16(%ebp)
    ja check_min_blocks
    addl %ecx, %edi
check_min_blocks:
    # ako moze da predje trenutnu stazu, uvecavamo counter
    cmpl 20(%ebp), %edi
    jb next_element
    incl %eax
next_element: 
    incl %esi
    jmp end_or_reset
end:
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret
