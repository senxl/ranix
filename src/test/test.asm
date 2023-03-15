
msg db 'Hello,World!',0ah,0
len equ $-msg

global main
main:
    ;push ebp
    ;mov ebp, esp

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80


    mov eax, 1
    xor ebx, ebx
    int 0x80
    ;leave
    ;ret



