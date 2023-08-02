[bits 32]

extern exit

test: 
    ret

global main
main:
    ; push 5
    ; push eax

    ; pop ebx
    ; pop ecx

    call test

    push 0  ; 参数传递
    call exit