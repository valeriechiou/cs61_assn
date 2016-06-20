;=================================================
; Name: Valerie Chiou
; Username: vchio001@ucr.edu
; 
; Assignment name: assn1
; Lab section: 22
; TA: Bryan Marsh
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

;---------------------------------------------------------------------------
;REG VALUES		R0	R1	R2	R3	R4	R5	R6	R7
;---------------------------------------------------------------------------
;Pre-loop		0	6	12	0	0	0	0	1168
;Iteration 1	0	5	12	12	0	0	0	1168
;Iteration 2	0	4	12	24	0	0	0	1168
;Iteration 3	0	3	12	36	0	0	0	1168
;Iteration 4	0	2	12	48	0	0	0	1168
;Iteration 5	0	1	12	60	0	0	0	1168
;Iteration 6	0	0	12	72	0	0	0	1168
;End of prgm	0	0	12	72	0	0	0	DEC_0
;--------------------------------------------------------------------------- 




.ORIG x3000			; Program begins here

LD R1, DEC_6
LD R2, DEC_12
LD R3, DEC_0

DO_WHILE
	ADD R3, R3, R2
	ADD R1, R1, #-1
	BRp DO_WHILE

HALT

DEC_0	.FILL	#0
DEC_6	.FILL	#6
DEC_12	.FILL	#12


.END


