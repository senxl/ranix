org     0100H   ;

start:
	mov	ax , cs   ;
	mov	ds , ax   ;
	mov	es , ax   ;

	call	DispStr	;

	jmp	$	;

DispStr:
	mov	ax , LoaderMessage	;
	mov	bp , ax	;
	mov	cx , LenOfLoaderMessage	;
	mov	ax ,01301H	;
	mov	bx ,000ch     ;
	mov	dl ,00       ;
	int     10H      ;
	ret              ;

LoaderMessage	db "This is loader!"
LenOfLoaderMessage	equ $-LoaderMessage 

times (512-($-$$)) db 0   ;