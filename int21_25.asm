org 0x100
start:
		
	mov al,0x21
	mov ah,0x35
int 0x21
	mov ax,es
	mov ds,ax
	mov dx,bx
	mov ax,cs
	mov es,ax
	mov al,0xf1
	mov ah,0x25
int 0x21
	mov ax,cs
	mov ds,ax
	mov es,ax	
	mov dx,string1
	mov ah,9
int 0xf1
exit:
	mov ax,0x4c00
	int 0xf1
halt:
jmp halt
string1 db "hello world.....",13,10,"$"
string2 db "$",0

