;=================================================
; Name: Chiou, Valerie
; Username: vchio001
; 
; Lab: lab 04
; Lab section: 22
; TA: Bryan Marsh
; 
;=================================================
.orig x3000

;----------
;instructions
;-----------
LD R1, ADDRSS
LD R2, CNT_10
LD R3, ONE

INCREMENT
STR R3, R1, #0  ;puts R3(ONE) into x4000. 2^0
ADD R1, R1, #1	;increase array
ADD R3, R3, R3	;add to self to get next
ADD R2, R2, #-1 
BRp INCREMENT

;LD R6, SUBROUTINE
;JSRR R6 	;loading subroutine
		;(OR) JSR, SUBROUTINE: No data-label, but need to put label in subroutine section

HALT

;----
;data
;----
ONE 	.FILL	x1
ZERO	.FILL	#0
SPACE   .FILL   x20
CNT_10	.FILL	#10
CNT16   .FILL   #16
CNT4    .FILL   #4
SUBROUTINE	.FILL	x3200	;fill w/address you put subroutine at
ADDRSS	.FILL	x4000
.orig x4000

ARRAY	.BLKW	#10


