;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Lab: lab 2
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================
.orig x3000
LD R0, HEX61
LD R1, HEX1A

WHILE_LOOP
	OUT
	ADD R0, R0, #1
	ADD R1, R1, #-1
	BRp WHILE_LOOP
END_LOOP

HALT
HEX61	.FILL	x61
HEX1A	.FILL	x1A
.end
