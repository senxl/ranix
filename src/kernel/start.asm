[bits 32]

extern kernel_init

global _start
_start:
    ; mov byte [0xb8000], 'K'; 表示进入了内核
    ; xchg bx, bx
    call kernel_init
    ; xchg bx, bx
fin:
    hlt ; 让CPU停止，等待指令
    jmp fin ; 无限循环
