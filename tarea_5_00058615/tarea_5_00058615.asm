org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 

	xor 	si, si
	xor 	di, di

	mov 	si, 25d ; X -> Columna, Linea horizontal 1
	mov 	di, 25d ; Y -> Fila
    mov     bx, 50d
	call 	linea_h

	mov 	si, 25d ; X -> Columna, linea horizontal 2
	mov 	di, 180d ; Y -> Fila
    mov     bx, 50d
	call 	linea_h

	mov	si, 25d ; X -> Columna, linea vertical 1
	mov 	di, 25d ; Y -> Fila
    mov     bx, 180d
	call 	linea_v

    mov	si, 50d ; X -> Columna, linea vertical 2
	mov 	di, 25d ; Y -> Fila
    mov     bx, 85d
	call 	linea_v

    mov	si, 180d ; X -> Columna, linea vertical 2
	mov 	di, 25d ; Y -> Fila
    mov     bx, 50d
	call 	linea_v

    mov	si, 85d ; X -> Columna, linea vertical 2
	mov 	di, 25d ; Y -> Fila
    mov     bx, 50d
	call 	linea_d

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
        mov	al, 13h
        int 	10h
        ret

pixel:	mov	ah, 0Ch
        mov	al, 1010b
        int 	10h
        ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
        add 	cx, si
        mov	    dx, di ; Fila
        call 	pixel
        inc 	si
        cmp 	si, bx ; Final 
        jne 	lupi_h
        ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
        mov	dx, 0d ; Fila
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, bx ; Final
        jne 	lupi_v
        ret

linea_d:
lupi_d: mov 	cx, 0d ; Columna 
        add	    cx, si 
        mov 	cx, 0d ; Fila
        add     dx, di
        call 	pixel
        inc 	si
        inc     di
        cmp 	di, bx ; Final
        jne 	lupi_d
        ret

kb: 	mov	ah, 00h
        int 	16h
        ret

section .data