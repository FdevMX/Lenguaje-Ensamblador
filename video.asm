;Alfredo Lopez Mendez
;5to M

;6.- Elaborar un programa que contenga un arreglo de 10 números, y realizar la
;suma de todos los números iguales a 5.

;Ejemplo:
	;numero[1,2,3,4,2,5,3,1,5,2]
	
;Salida:
	;Mensaje1: La suma de los números iguales a 5 es: 10

.model small
.stack 64
.data
	numero db 10,2,3,4,2,5,3,10,5,10
	msg1 db 10,13, "La suma de los numeros iguales a 10 es: $"
	
	contador db 0
	suma db 0

.code
    inicio proc
        mov ax, @data
        mov ds, ax
		
		mov cl, 10
		mov di, 0

		ciclo:
			mov al, numero[di]
			cmp al, 10
			jne siguiente
			
			inc contador
			add suma, al
			
		siguiente:
			inc di
			dec cl
			jnz ciclo
			
		mov ah, 09h
		mov dx, offset msg1
		int 21h
		
		mov al, suma
		aam
		add ax, 3030h
		mov bx, ax
		
		mov ah, 02h
		mov dl, bh
		int 21h
		
		mov ah, 02h
		mov dl, bl
		int 21h
		
		mov ax, 04c00h
		int 21h
    inicio endp
end inicio
