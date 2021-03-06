;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Lab: lab 4
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================
.orig x3000

LD R0, ZERO
LD R1, ADDRESS
LD R2, COUNT

INCREMENT
	STR R0, R1, #0		; Get value in curr position
	ADD R1, R1, #1		; Increase position
	ADD R0, R0, #1		; Increase value
	ADD R2, R2, #-1		; Decrease count
	BRp INCREMENT
LD R1, ADDRESS
LDR R2, R1, x6

HALT

;-----------
; DATA
;-----------
ZERO	.FILL	#0
COUNT	.FILL	#10
ADDRESS	.FILL	x4000

.ORIG x4000
ARRAY	.BLKW 	#10
