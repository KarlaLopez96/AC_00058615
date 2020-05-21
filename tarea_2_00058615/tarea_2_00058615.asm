org	100h

;Ejercicio #1  Promedio núumero de carné

section .text
                        mov	ax, 58615d  ;número de carné
                        mov	di, 0d
                        mov	cx, 5d
                        mov	bx, 10d

residuo:	        mov	dx, 0000h
                        div	bx
                        mov	[di+200h], dx
                        inc	di
                        loop 	residuo

                        mov	ax, 0000h
                        mov	di, 0d
                        mov	cx, 5d

promedio:	        mov	bl, 00h
                        mov	bl, [200h+di]
                        add	al, bl
                        inc	di
                        loop	promedio

                        mov	dx, 0000h
                        mov	bx, 5d
                        div	bx

                        mov	di, 0d
                        mov	cx, 13d

                        cmp	al, 4d
                        jz	lupi1

                        cmp	al, 5d
                        jz	lupi2

lupi1:	                mov	bl, [comnt4+di]
                        mov	[di+200h], bl
                        inc	di
                        loop	lupi1

lupi2:	                mov	bl, [comnt5+di]
                        mov	[di+200h], bl
                        inc	di
                        loop	lupi2

;Ejercicio #2 Covid-19

                        mov	ax, 0000h
                        mov	bx, 0000h
                        mov	cx, 11d
                        mov	dx, 0000h
                        mov	di, 0d

                        mov	ax, 2d
                        mov 	bx, 2d

lupi3:	                mul	bx
                        mov	[di+210h], ax
                        cmp	di, 6d
                        jb	incre1
                        cmp	di, 6d
                        jae	incre2

incre1:	                inc	di
                        loop	lupi3

incre2: 	        inc	di
                        inc	di
                        loop	lupi3

;Ejercicio #3 Fibonacci

                        mov	ax, 0000h
                        mov	bx, 0000h
                        mov	cx, 0000h
                        mov	dx, 0000h
                        mov	di, 0d

                        mov 	bx, 0d
                        mov	[220h], bx
                        mov	ax, 1d
                        mov	[221h], ax
                        mov 	cx, 14d
                        mov	dx, 255d

calc:	                mov	ax, [220h+di]
                        mov	bx, [221h+di]
                        add	ax, bx
                        cmp	ax, dx
                        jb	save1
                        cmp	ax, dx
                        jae	save2

save1:	                mov	[di+222h], ax
                        inc	di
                        loop	calc

save2:	                mov	[di+222h], ax
                        inc	di
                        loop	calc

                        int	20h


section .data
;Data ejercicio 1
comnt4 	db 	"Me recupero"
comnt5 	db 	"En el segundo"                      

