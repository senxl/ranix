section .bss
    stack resb 100

section .data
    msg db 'Hello,World!',0xa,0  ;定义要输出的字符串
    
section .text
    global main

main:
    ;push ebp
    ;mov ebp, esp

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 13
    int 0x80


    mov eax, 1
    xor ebx, ebx
    int 0x80
    ;leave
    ;ret



