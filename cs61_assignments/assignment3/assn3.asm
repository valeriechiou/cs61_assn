;=================================================
; Name: Valerie Chiou
; Email: vchio001@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 22
; TA: Jhaveri
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Convert_addr		; R6 <-- Address pointer for Convert
LDR R1, R6, #0			; R1 <-- VARIABLE Convert 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R2, COUNT_16
LD R3, COUNT_4

FOR_LOOP
	ADD R1, R1, #0 			; LEFT SHIFT
	BRzp POSITIVE
	BRn  NEGATIVE
		POSITIVE
			LD R0, HEX_ZERO
			OUT
			ADD R1, R1, R1
			BR POST_OUTPUT
	
		NEGATIVE
			LD R0, HEX_ONE
			OUT
			ADD R1, R1, R1
			BR POST_OUTPUT

	POST_OUTPUT
		ADD R3, R3, #-1
		BRp COUNT_DEC
		BRz OUTPUT_SPACE
			OUTPUT_SPACE
				LD R0, SPACE
				OUT
				LD R3, COUNT_4
				BR COUNT_DEC
		COUNT_DEC
			ADD R2, R2, #-1
			BRp FOR_LOOP
LEA R0, NEWLINE
PUTS

HALT
;---------------	
;Data
;---------------
Convert_addr .FILL xA000	; The address of where to find the data
COUNT_16	.FILL	#16
COUNT_4		.FILL	#4
HEX_ZERO	.FILL 	x30
HEX_ONE		.FILL	x31
SPACE		.FILL	x20
NEWLINE		.STRINGZ "\n"

.ORIG xA000			; Remote data
Convert .FILL xABCD		; <----!!!NUMBER TO BE CONVERTED TO BINARY!!!
;---------------	
;END of PROGRAM
;---------------	
.END
