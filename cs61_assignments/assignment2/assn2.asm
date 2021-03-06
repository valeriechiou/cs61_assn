;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Assignment name: assn 2
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

;----------------------------------------------
;outputs prompt
;----------------------------------------------	
	LEA R0, intro			; 
	PUTS				; Invokes BIOS routine to output string

	LEA R0, aINPUT			; Input first num:
	PUTS				; 1. DISPLAY
	GETC				; 2. CIN
	OUT				; 3. ECHO

	ST R0, FIRST			
	LD R1, HEX_NEGx30
	ADD R1, R1, R0			; convert '#' to #

	LEA R0, NEWLINE
	PUTS

	LEA R0, bINPUT			; Input second num: 
	PUTS				; 1. DISPLAY
	GETC				; 2. CIN
	OUT				; 3. ECHO

	ST R0, SECOND
	LD R2, HEX_NEGx30
	ADD R2, R2, R0			; convert '#' to #

	LEA R0, NEWLINE
	PUTS
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
	;get 2's complement.... # --> -#
	NOT R2, R2			; invert bits 
	ADD R2, R2, #1			; add 0001

	ADD R3, R2, R1
		BRzp POSITIVE
	NOT R3, R3			; invert bits
	ADD R3, R3, #1			; add 0001

	LD R4, HEX_POSx30
	ADD R5, R3, R4			; R5 contains difference
	ST R5, ANS
;---------
;OUTPUT 
;---------
	LD R0, FIRST		
	OUT			; a
	LD R0, SPACE
	OUT	
	LD R0, NEGSIGN
	OUT			; a -
	LD R0, SPACE
	OUT
	LD R0, SECOND
	OUT			; a - b
	LD R0, SPACE
	OUT
	LD R0, EQUALSIGN	; a - b =
	OUT			
	LD R0, SPACE
	OUT
	LD R0, NEGSIGN		; a - b = -
	OUT			
	LD R0, ANS		; a - b = -c
	OUT			

	LEA R0, NEWLINE
	PUTS
	HALT
	
	
	POSITIVE
	LD R4, HEX_POSx30
	ADD R0, R4, R3		; convert # to '#'
	ST R0, ANS
	
	LD R0, FIRST		; a
	OUT		
	LD R0, SPACE
	OUT	
	LD R0, NEGSIGN		; a - 
	OUT		
	LD R0, SPACE
	OUT
	LD R0, SECOND		; a - b
	OUT		
	LD R0, SPACE
	OUT
	LD R0, EQUALSIGN	; a - b =
	OUT		
	LD R0, SPACE
	OUT	
	LD R0, ANS		; a - b = c
	OUT	
	
	LEA R0, NEWLINE
	PUTS
HALT				; Stop execution of program

;------	
;Data
;------
; String to explain what to input 
intro .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 
NEWLINE .STRINGZ "\n"	; String that holds the newline character
aINPUT	.STRINGZ	"INPUT first number: "
bINPUT	.STRINGZ	"INPUT second number: "

FIRST		.FILL	#0
SECOND		.FILL	#0
ANS		.FILL	#0
HEX_NEGx30	.FILL	-x30
HEX_POSx30	.FILL 	x30
SPACE		.FILL 	x20
NEGSIGN		.FILL	x2D
EQUALSIGN	.FILL 	x3D

;---------------	
;END of PROGRAM
;---------------	
.END

