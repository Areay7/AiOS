[bits 32]

section .text   ; 代码段

global inb  ; 将 inb 导出
inb:
    push ebp    ;
    mov ebp,esp ; 保存栈帧
    
    xor eax,eax ; 将 eax 清空    
    mov edx,[ebp + 8]   ; port
    in al,dx    ; 将端口号 dx 的 8 bit 输入到 al

    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟

    leave   ; 恢复栈帧
    ret


global outb  
outb:
    push ebp    ;
    mov ebp,esp ; 保存栈帧
    
    xor edx,[ebp + 8]   ; port
    mov eax,[ebp + 12]  ; value
    out dx,al    ; 将端口号 al 的 8 bit 输入到 dx

    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟

    leave   ; 恢复栈帧
    ret

global inw  ; 将 inb 导出
inw:
    push ebp    ;
    mov ebp,esp ; 保存栈帧
    
    xor eax,eax ; 将 eax 清空    
    mov edx,[ebp + 8]   ; port
    in ax,dx    ; 将端口号 dx 的 8 bit 输入到 ax

    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟

    leave   ; 恢复栈帧
    ret


global outw  
outw:
    push ebp    ;
    mov ebp,esp ; 保存栈帧
    
    xor edx,[ebp + 8]   ; port
    mov eax,[ebp + 12]  ; value
    out dx,ax    ; 将端口号 ax 的 8 bit 输入到 dx

    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟
    jmp $+2 ; 一点延迟

    leave   ; 恢复栈帧
    ret