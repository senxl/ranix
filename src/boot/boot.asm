mov ax, 0xb800
mov ds, ax
mov byte [0x0], 'M'
mov byte [0x2], 'B'
mov byte [0x4], 'R'
jmp $
times 510-($-$$) db 0
db 0x55,0xaa