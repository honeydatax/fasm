format mz
entry main:start
segment main
start:

		mov ax,text
		mov ds,ax
		mov dx,string1
call extra:write_text
call extra:exit
call extra:halt	
segment text
string1 db "hello world.....",13,10,"$"
string2 db "$",0

segment extra
write_text:
	mov ah,9
	int 0x21
	retf
exit:
	mov ax,0x4c00
	int 0x21
halt:
jmp halt
