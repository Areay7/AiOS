[org 0x7c00]

mov ax,3
int 0x10

mov ax,0
mov ds,ax
mov es,ax
mov ss,ax
mov sp,0x7c00

mov ax,0xb800
mov ds,ax
mov byte [0], 'H'

jmp $

times 510 - ($ - $$) db 0

db 0x55, 0xaa