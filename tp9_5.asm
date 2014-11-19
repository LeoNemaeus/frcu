DOSSEG
.MODEL SMALL
.STACK 50H
.DATA
	lista dw 12, 45, 78, 125, 678, 745, 345, 56, 764, 567, 324, 923
	resp dw ?
	
	
.CODE
myproc proc
	mov ax, @data
	mov ds, ax
	
	mov cx, 000Ah
	mov si, 0h
	
	mov ax, lista[si]
	
	ciclo:
		cmp lista[si], ax
		jg mayor
		add si, 02h
	loop ciclo
	
	mov resp, ax
	
;	mov si, [resp]
;	mov [si], ax
;	add si, 02h
;	mov [si], 24h
;	mov dx, [resp]
	
;	mov ah, 09h
;	int 21h
	
	mov ah, 4ch
	int 21h
	
myproc endp

mayor:
	mov ax, lista[si]
	jmp ciclo

END
