;=================================================
; Name: Chiou, Valerie
; Username: vchio001
; 
; Lab: lab 04
; Lab section: 22
; TA: Bryan Marsh
; 
;=================================================
.orig x3000

;----------
;instructions
;-----------
LD R1, ZERO
LD R2, CNT16
LD R3, HEX_30

GETC
OUT 	;for b

INPUT		GETC
		OUT
		ADD R0, R0, R3
		ADD R1, R1, R1 		;make sure it's zero
		ADD R1, R1, R0
		
		ADD R2, R2, #-1		;reduce counter
		BRp	INPUT
LD R0, LINE
OUT

;LD R6, SUBROUTINE
;JSRR R6


HALT

;----
;data
;----
ZERO	.FILL	#0
CNT16	.FILL	x10
HEX_30	.FILL	-x30
LINE	.FILL	xA
SUBROUTINE	.FILL	x3200

SPACE_OUTPUT
		LD R0, SPACE    ;output a space after 4 digits 
		OUT
		ADD R3, R3, #4
		BRp CHECK

LINE
		LD R0, CNT10
		OUT
		ADD R4, R4, #-1

;3: restore registers
	LD R7, BACKUP_R7_3200
;4: 
	RET
;====
;data
;====
BACKUP_R7_3200	.BLKW	#1
ADDRS	.FILL	x4000
CNT10	.FILL	#10
ZERO	.FILL	#0
ONE	.FILL	#1
SPACE	.FILL	x20

