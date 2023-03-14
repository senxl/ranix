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

;以下显示字符串 
mov si,msg
call print

mov edi, 0x1000 ; 读取的目标内存
mov ebx, 2      ; 读取扇区起始地址
mov ecx, 4      ; 读取的扇区数
; xchg bx, bx; 断点
call read_disk
; xchg bx, bx; 断点
cmp word [0x1000], 0x55aa
jnz error

jmp 0:0x1002

fin:
    hlt ; 让CPU停止，等待指令
    jmp fin ; 无限循环

read_disk:
    ; 写入读取扇区数量
    mov dx, 0x1f2
    mov eax, ecx
    out dx, al
    ; 写入LBA地址
    mov dx, 0x1f3
    mov eax, ebx
    out dx, al

    mov dx, 0x1f4
    shr eax, 8
    out dx, al

    mov dx, 0x1f5
    shr eax, 8
    out dx, al

    mov dx, 0x1f6
    shr eax, 8
    and al, 0b0000_1111
    or al, 0b1110_0000
    out dx, al
    ; 写入读命令
    mov dx, 0x1f7
    mov al, 0x20
    out dx, al
    
    .read
        push cx
        ; 读取检测
        call .waits
        ; 读取数据到内存
        call .reads
        pop cx
        loop .read
ret
    
    .waits:
        mov dx, 0x1f7
        .check:
            in al, dx
            nop
            and al, 0b1000_1000
            cmp al, 0b0000_1000
            jnz .check
        ret
    
    .reads:
        ; xchg bx, bx; 断点
        mov dx, 0x1f0
        mov cx, 256; 一个扇区 256 字
        .readw:
            in ax, dx
            nop
            mov [edi], ax
            add edi, 2
            loop .readw
        ret


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

error:
    mov si, .msg
    call print
    hlt; 让 CPU 停止
    jmp $
    .msg db "Booting Error!!!", 10, 13, 0

msg: 
    db "Loading Ranix...", 0ah, 0dh, 0

mbr:
    times 510-($-$$) db 0
    db 0x55,0xaa