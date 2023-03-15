; MBR主引导记录
org 7c00h ; 告诉编译器程序加载到内存后的起始地址
start:
    jmp short LABEL_START ; 跳转到LABEL_START标签处执行

; 分区表信息，共64字节
; 每个分区表项占16字节，共4个分区表项
; 分区表项格式如下：
; +0: 1字节，引导标志，80h表示活动分区，00h表示非活动分区
; +1: 3字节，起始磁头号、扇区号、柱面号（CHS）
; +4: 1字节，系统标识符，表示分区类型
; +5: 3字节，结束磁头号、扇区号、柱面号（CHS）
; +8: 4字节，起始逻辑扇区号（LBA）
; +12: 4字节，总逻辑扇区数（LBA）

PartitionTable:
    db 80h,0,2,0,6,254,63,1023 ; 第一个分区表项
    dd 63 ; 起始逻辑扇区号为63（从0开始计数）
    dd (1024*63) ; 总逻辑扇区数为1024*63=64512

    times (16-12) db 0 ; 填充剩余的空间为0

    times (16*3) db 0 ; 其他三个分区表项为空

LABEL_START:
    xchg bx, bx; 断点
    mov ax, cs ; 将代码段寄存器cs的值赋给ax寄存器
    mov ds, ax ; 将ax寄存器的值赋给数据段寄存器ds
    mov es, ax ; 将ax寄存器的值赋给附加段寄存器es

    call DispStr ; 调用DispStr子程序显示字符串
    xchg bx, bx; 断点
    jmp $ ; 死循环

DispStr:
    mov ax, BootMessage ; 将BootMessage字符串的地址赋给ax寄存器
    mov bp, ax ; 将ax寄存器的值赋给基址指针寄存器bp
    mov cx, LenOfBootMessage ; 将BootMessage字符串的长度赋给计数寄存器cx
    mov ax, 01301h ; 设置中断参数：ah=13h表示写字符串功能；al=01h表示光标跟随移动；bh=0表示显示页码；bl=07h表示字符属性（黑底白字）
    mov bx,000ch     ;
	mov dl ,00       ;
	int     10H      ;
	ret              ;

BootMessage: 
	db "Hello World!"
LenOfBootMessage equ $-BootMessage 

times (510-($-$$)) db 0   ;
dw      0xaa55