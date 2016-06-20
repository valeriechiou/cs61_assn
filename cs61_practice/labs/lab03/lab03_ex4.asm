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
LEA R0, PROMPT
PUTS

LD R5, DATA_PTR

LOOP_IN
	LD R3, NEW
	GETC
	OUT
	ADD R1, R0, #0	
	NOT R3, R3		
	ADD R3, R3, #1		
	ADD R0, R0, R3		
	BRz END_LOOP_IN	
	STR R1, R5, #0
	ADD R5, R5, #1
	BRnp LOOP_IN
END_LOOP_IN

LEA R0, OUTPUT
PUTS

LD R6, DATA_PTR
LDR R0, R6, #0

LOOP_OUT
	OUT
	LDR R0, R6, #1
	ADD R6, R6, #1
	BRp LOOP_OUT
END_LOOP_OUT
	
HALT

;===============
; Data
;===============
PROMPT .STRINGZ "Enter 'n' characters (Hit enter key to stop): "
OUTPUT .STRINGZ "Your entered characters are: "
DATA_PTR .FILL x4000
NEW .FILL x000A
.end
