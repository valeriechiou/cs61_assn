;=================================================
; Name: Valerie Chiou
; Username: vchio001
;
; Lab: 3
; Lab Section: 2
; TA: Bryan Marsh
;
;=================================================
;
.orig x3000
;===============
; Instructions
;===============
LD R5, DATA_PTR

LD R1, DEC_65
STR R1, R5, #0

LD R2, HEX_41
STR R2, R5, #1

LDR R3, R5, #0
LDR R4, R5, #1

ADD R3, R3, #1
ADD R4, R4, #1

STR R3, R5, #0
STR R4, R5, #1

HALT

;===============
; Data
;===============
DEC_65 .FILL #65
HEX_41 .FILL x41
DATA_PTR .FILL x4000

.orig x4000
.BLKW #2

.end
