org 0x100

	mov ax,0x7000
	mov ds,ax
	mov bx,0x100
	mov cx,endfile
	clc
	sub cx,bx
copys:
		cs
		mov al,[bx]
		ds
		mov [bx],al
		inc bx
		dec cx
		cmp cx,0
jnz copys
	mov dx,jmpto
	mov ax,0x7000
	push ax
	push dx
	retf
jmpto:
	mov ax,0x7000
	mov ds,ax
	mov es,ax
	mov ah,0x35
	mov al,8
int 0x21
	push bx
	pop dx
	push es
	pop ds
	mov ah,0x25
	mov al,0xf8
int 0x21
	mov ax,0x7000
	mov ds,ax
	mov es,ax
	mov dx,int8s
	mov ah,0x25
	mov al,8
int 0x21
	mov ax,0x4c00
int 0x21
halts:
jmp halts
int8s:
	push ax
	push bx
	push cx
	push dx
	push bp
	push es
	push ds
	push si
	push di
	mov ax,0xb800
	mov ds,ax
	mov bx,0
	ds
	mov al,[bx]
	inc al
	ds
	mov [bx],al
int 0xf8 
	pop di
	pop si
	pop ds
	pop es
	pop bp
	pop dx
	pop cx
	pop bx
	pop ax
iret
intsa dw 0 
intsb db 0
endfiles dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
endfile dw 0
