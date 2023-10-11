			org 	$4
			
vector_001 	dc.l 	Main

			org 	$500

Main		movea.l #String1,a0
			jsr 	IsCharError
			
			movea.l #String2,a0
			jsr 	IsCharError
			
			illegal
			
			
;=======================
;      RemoveSpace
;=======================

RemoveSpace	movem.l d1/a0/a1,-(a7)
			
			move.l a0,a1
			
\loop		move.b (a0)+,d1		
			beq		\quit				;Si d1 == 0 alors FIN [move a un tst integre]
			
			cmp.b	#' ',d1				
			beq		\loop				;Si a0 != ' '
			
			move.b	d1,(a1)+			;Incrr les 2 + copie
			bra 	\loop					
			
\quit		move.b	#0,(a1)
			
			movem.l (a7)+,d1/a0/a1
			
			rts

;=======================
;      IsCharError
;=======================

IsCharError	movem.l	d1/a0,-(a7)
			
\loop		move.b	(a0)+,d1
			beq		\true
			
			cmp.b	#'0',d1
			blo		\false
			
			cmp.b	#'9',d1
			bhi		\false
			
			bra \loop



\true		ori.b 	#%00000100,ccr	;Z a 1
			bra		\quit

\false		andi.b 	#%11111011,ccr	;Z a 0
			bra 	\quit

\quit		movem.l	(a7)+,d1/a0
			rts


;=======================
;      StrLen && IsCharError
;=======================


StrLen 		move.l 	a0,-(a7)
			
			clr.l 	d0

\loop 		tst.b 	(a0)+
			beq 	\quit

			addq.l 	#1,d0
			
			bra 	\loop

\quit 		movea.l (a7)+,a0
			rts
			
;-----------------------------

IsMaxError	movem.l	d0/d1/a0/a1,-(a7)

			jsr 	StrLen				;D0 -> Len de la str
			
			cmp.l	#5,d0				
			bhi		\false				;Si D0 > 5 -> FAUX
			
			cmp.l 	#5,d0
			blo		\true				;Si D0 < 5 -> VRAI
			
			movea.l	#template,a1		; A1 -> 32767

\loop		move.b (a1)+,d1				
			beq		\true				;Si fin de A1 -> VRAI
			
			cmp.b	(a0)+,d1
			bhi		\false				;Si A0 > D1 -> FAUX
			
			bra		\loop
			
\true		ori.b 	#%00000100,ccr		;Z a 1
			bra		\quit

\false		andi.b 	#%11111011,ccr		;Z a 0
			bra 	\quit

\quit		movem.l	(a7)+,d0/d1/a0/a1
			rts

	
	
	
			
String1	dc.b "555121",0
String2 dc.b "qweqwe",0
template dc.b "32767",0

			
