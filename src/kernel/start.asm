[bits 32]

global_start:
_start:
    mov byte [0xb8000], 'k' ; 表示进入内核
    jmp $   ; 阻塞