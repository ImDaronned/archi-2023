;8b -> $B4 + $4C = $00 / C = 1 / V = 0 / Z = 1 / N = 0
;16 -> $B4 + $4C = $0100 / C = 0 / V = 0 / Z = 0 / N = 0
;16 -> $4AC9 + $D841 = $230A / C = 1 / V = 0 / Z = 0 / N = 0
;32 -> $FFFFFFFF + $00000015 = $00000014 / C = 1 / V = 0 / Z = 0 / N = 0


			org $4
Vector_001 	dc.l Main
			
			org $500
			
Main 		move.b NUMBER1,d0
			add.b NUMBER2,d0
			move.b d0,SUM12
			
			move.w NUMBER1_1,d0
			add.w NUMBER2_1,d0
			move.w d0,SUM12_1


			org $550
			
NUMBER1 	dc.b $B4
NUMBER2  	dc.b $4C

SUM12		dc.b 1

NUMBER1_1	dc.w $B4
NUMBER2_1  	dc.w $4C

SUM12_1		dc.w 1
