org	100h

Promedio núumero de carné

section .text

                        call texto  	;iniciamos modo texto
                        mov	ax, 58615d  ;número de carné
                        mov	di, 0d
                        mov	cx, 5d
                        mov	bx, 10d

residuo:	            mov	dx, 0000h
                        div	bx
                        mov	[di+200h], dx
                        inc	di
                        loop residuo

                        mov	ax, 0000h
                        mov	di, 0d
                        mov	cx, 5d

promedio:	            mov	bl, 00h
                        mov	bl, [200h+di]
                        add	al, bl
                        inc	di
                        loop promedio

                        mov	dx, 0000h
                        mov	bx, 5d
                        div	bx

                        mov	di, 0d
                        mov	cx, 13d

                        cmp	al, 4d
                        jz lupi1

                        cmp	al, 5d
                        jz lupi2

lupi1:	                call kb
                        mov	bl, [comnt1+di]
                        mov	[di+200h], bl
                        inc	di
                        loop lupi1

lupi2:	                mov	bl, [comnt2+di]
                        mov	[di+200h], bl
                        inc	di
                        loop lupi2

mostrar:                call w_strng
                        call kb; se detiene la ejecución
                        int 20h

texto:                  mov ah, 00h
                        mov	al, 03h
                        int 10h
                        ret

kb:                     mov	ah, 00h 
	                    int 16h	
	                    ret

w_strng:                mov	ah, 13h
                        mov al, 01h 
                        mov bh, 00h 
                        mov	bl, 00001111b ;atributo de caracter
                        mov	cx, si 
                        mov	dl, 10h
                        mov	dh, 7h
                        push cs
                        pop	es 
                        mov	bp, 300h 
                        int 10h
                        ret

section .data
comnt1 	db 	"Me recupero"
comnt2 	db 	"En el segundo"   

