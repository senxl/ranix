mov ax, 0xb800
mov ds, ax
mov byte [0x0], 'm'
mov byte [0x2], 'b'
mov byte [0x4], 'r'
jmp $
times 510-($-$$) db 0
db 0x55,0xaa