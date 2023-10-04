			org $4
			
Vector_001 	dc.l Main
			
			org $500

Main 		move.l #-1,d0 ; Initialise D0.

Abs 		bmi next1 ; si d0 < 0	
			bra quit	

next1						
			
			illegal
