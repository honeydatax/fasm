org 0x100
mov ax,3
int 0x10
mov al,0
mov ah,0x3d
mov dx,fname
int 0x21
mov bx,ax
mov dx,outputs
mov cx,13
mov ah,0x3f
int 0x21
mov cx,13
mov bh,0
mov bl,7
mov dh,1
mov dl,1
mov bp,0x8000
mov ax,0x9000
push es
mov es,ax
mov ah,0x13
mov al,1
int 0x10
pop es
mov ax,0x4c00
int 0x21
fname db 'MY',0
outputs db '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$',13,10,0
