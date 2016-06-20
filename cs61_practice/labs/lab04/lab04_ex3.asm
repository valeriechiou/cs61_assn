;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Lab: lab 4
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================
.ORIG x3000

LD R0, ZERO
LD R1, ADDRESS
LD R2, COUNT
LD R3, ONE

INCREMENT
	STR R3, R1, #0
	ADD R1, R1, #1
	ADD R3, R3, R3
	ADD R2, R2, #-1
	BRp INCREMENT

LD R1, ADDRESS
LDR R2, R1, x6

HALT

;---------
; DATA
;---------
ONE	.FILL	x1
ZERO	.FILL	#0
COUNT	.FILL	#10
ADDRESS	.FILL	x4000

.ORIG x4000
ARRAY	.BLKW	#10 
