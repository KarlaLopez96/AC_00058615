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

	mov	    si, 25d ; X -> Columna, linea vertical 1
	mov 	di, 25d ; Y -> Fila
    mov     bx, 180d
	call 	linea_v

    mov	    si, 50d ; X -> Columna, linea vertical 2
	mov 	di, 25d ; Y -> Fila
    mov     bx, 85d
	call 	linea_v

    mov	    si, 50d ; X -> Columna, linea vertical 3
	mov 	di, 120d ; Y -> Fila
    mov     bx, 180d
	call 	linea_v

    mov	    si, 50d ; X -> Columna, linea diagonal 1
	mov 	di, 120d ; Y -> Fila
    mov     bx, 180d
	call 	linea_d

    mov	    si, 110d ; X -> Columna, linea diagonal 2
	mov 	di, 25d ; Y -> Fila
    mov     bx, 85d
	call 	linea_2d

    mov 	si, 110d ; X -> Columna, linea horizontal 3
	mov 	di, 25d ; Y -> Fila
    mov     bx, 135d
	call 	linea_h

    mov 	si, 110d ; X -> Columna, linea horizontal 4
	mov 	di, 180d ; Y -> Fila
    mov     bx, 135d
	call 	linea_h

    mov	    si, 58d ; X -> Columna, linea diagonal 3
	mov 	di, 102d ; Y -> Fila
    mov     bx, 180d
	call 	linea_d

    mov	    si, 135d ; X -> Columna, linea diagonal 4
	mov 	di, 25d ; Y -> Fila
    mov     bx, 102d
	call 	linea_2d

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
        mov 	dx, 0d ; Fila
        add     dx, di
        call 	pixel
        inc 	si
        inc     di
        cmp 	di, bx ; Final
        jne 	lupi_d
        ret

linea_2d:
lupi_2d: mov 	cx, 0d ; Columna 
        add	    cx, si 
        mov 	dx, 0d ; Fila
        add     dx, di
        call 	pixel
        sub 	si, 1h
        inc     di
        cmp 	di, bx ; Final
        jne 	lupi_2d
        ret


kb: 	mov	ah, 00h
        int 	16h
        ret

section .data