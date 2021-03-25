org 0x100
start:
		
	mov ax,ds
	mov es,ax
	mov bx,dx
	mov ax,cs
	mov ds,ax
	mov al,0
	mov ah,0x4b
	mov dx,string1
int 0x21
exit:
	mov ax,0x4c00
	int 0x21
halt:
jmp halt
string1 db "EXEC",0
string2 db "$",0

