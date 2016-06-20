;=================================================
; Name: Valerie Chiou
; Username: vchio001
;
; Lab: 3
; Lab Section: 21
; TA: Bryan Marsh
;
;=================================================
;
.orig x3000

;===============
; Instructions
;===============
LD R5, DATA_PTR		
LD R4, COUNTER		

;OUTPUT PROMPT
LEA R0, PROMPT
PUTS

;LOOP
DO_WHILE_LOOP
	GETC
	OUT
	STR R0, R5, #0
	ADD R5, R5, #1
	LD R0, NL
	OUT
	ADD R4, R4, #-1
	BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP

HALT
;===============
; Data
;===============
PROMPT .STRINGZ "Enter 10 characters: \n"
NL .FILL x000A
DATA_PTR .FILL x4000
COUNTER .FILL #10

.org x4000
.BLKW #10

.end
