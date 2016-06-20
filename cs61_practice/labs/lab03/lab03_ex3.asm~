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
DO_WHILE_LOOP_STORE
	GETC
	OUT
	STR R0, R5, #0
	ADD R5, R5, #1
	;LD R0, NL
	;OUT
	ADD R4, R4, #-1
	BRp DO_WHILE_LOOP_STORE
END_DO_WHILE_LOOP_STORE

LD R0, NL
OUT

LEA R0, PROMPT2
PUTS

LD R6, DATA_PTR
LD R3, COUNTER

DO_WHILE_LOOP_OUT
	LDR R0, R6, #0
	OUT
	ADD R6, R6, #1
	;LD R0, NL
	;OUT
	ADD R3, R3, #-1
	BRp DO_WHILE_LOOP_OUT
END_WHILE_LOOP_OUT
	

HALT
;===============
; Data
;===============
PROMPT .STRINGZ "Enter 10 characters: \n"
PROMPT2 .STRINGZ "Your 10 characters are: \n"
NL .FILL x000A
DATA_PTR .FILL x4000
COUNTER .FILL #10

.org x4000
.BLKW #10

.end
