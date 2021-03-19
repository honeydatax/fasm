org 0x100
;calculator of next 64 segment
	mov ax,cs
	mov bx,0x1000
	clc
	add ax,bx
	push ax
;----------------------------------	
;open file
	mov al,0
	mov ah,0x3d
	mov dx,file1
	int 0x21
;----------------------------------
;read file	
	mov bx,ax
	pop ax
	push bx
	mov ds,ax
	mov dx,0
	mov cx,48000
	mov ah,0x3f
	int 0x21
;----------------------------------
;close file
	pop bx
	mov ah,0x3e
	int 0x21
;----------------------------------
;cs load
mov ax,ds
mov bx,0x8
ds
mov cx,[bx]
add ax,cx
mov bx,0x16
ds
mov cx,[bx]
add ax,cx
mov si,ax
;----------------------------------
;ip load
mov bx,0x14
ds
mov cx,[bx]
mov di,cx
;----------------------------------
;ss load
mov ax,ds
mov sp,0xFFFF
mov bx,0x0e
ds
mov cx,[bx]
add ax,cx
mov ss,ax
;----------------------------------
;sp load
mov bx,0x10
ds
mov cx,[bx]
mov sp,cx
;----------------------------------
push si
push di
mov ax,cs
mov ds,ax
mov es,ax
mov si,0
mov di,0
mov bx,0
mov dx,0
mov cx,32000
mov ax,0
retf
call printe
	mov ah,0
int 0x21
halt:
jmp halt
printe:
	mov ax,ds
	mov es,ax
	mov ax,cs
	mov ds,ax
	mov bl,7
	mov cx,256
	mov dl,1
	mov dh,1
	mov al,1
	mov bp,0
	mov ah,0x13
int 0x10
	mov bp,sp
ret
file1 db "LOAD.EXE",0
