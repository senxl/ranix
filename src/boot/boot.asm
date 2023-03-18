[org 0x7c00]

; 设置屏幕模式为文本模式，清除屏幕
mov ax, 3
int 0x10

; 初始化段寄存器
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov ax,0xb800          ;设置附加段基址到显示缓冲区
mov es,ax

;以下显示字符串 
mov si,msg
call print

fin:
    hlt ; 让CPU停止，等待指令
    jmp fin ; 无限循环

print:
    mov ah, 0x0e
.next:
    mov al, [si]
    cmp al, 0
    je .done
    int 0x10
    inc si
    jmp .next
.done:
    ret

msg: 
    db "Loading Ranix...", 0ah, 0dh, 0

mbr:
    times 510-($-$$) db 0
    db 0x55,0xaa