;=================================================
; Name: Valerie Chiou
; Username: vchio00
; 
; Lab: lab 4
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================
.orig x3000

;---------------
; INSTRUCTIONS
;---------------

LD R0, ZERO
LD R1, ADDRESS
LD R2, COUNT
LD R3, HEX_x30

INCREMENT
	STR R0, R1, #0		; STORE 0 INTO FIRST ADDRESS OF R0
	ADD R1, R1, #1		; Increment position at R0
	ADD R0, R0, #1		; Increase value
	ADD R2, R2, #-1		; Decrease count
	BRp INCREMENT
LD R1, ADDRESS
LD R2, COUNT

DISPLAY
	LDR R0, R1, #0		; stores curr val in R0
	ADD R0, R0, R3		; converts val to char
	OUT
	ADD R1, R1, #1		; increment location
	ADD R2, R2, #-1		; decrement count
	BRp DISPLAY

HALT

;---------
; DATA
;---------
ZERO	.FILL	#0
COUNT	.FILL	#10
ADDRESS	.FILL	x4000
HEX_x30	.FILL	x30

.orig x4000
ARRAY	.BLKW	#10
