VALUE 		equ 96
			org $4

Vector_001 	dc.l Main
			
			org $500

Main 		move.b #VALUE,d1
			
			tst.b d1
			bne next1 ;saut a next1 si != 0
			move.l #200,d0
			bra quit
			
next1 		bmi next3 ;saut a next3 si negatif
			cmp.b #$61,d1
			blt next2 ;saut a next2 si d1 < 61
			move.l #400,d0
			bra quit
			
next2 		move.l #600,d0
			bra quit
			
next3 		move.l #800,d0

quit 		illegal

; Pour 18 : D0 = 258 (600 en Ox)  	-> 258
; Pour -5 : D0 = 320  				-> 320
; Pour 0 : D0 = C8   				-> C8
; Pour 96 : D0 = 190  				-> 258 car .b donc 2 derniers bits
