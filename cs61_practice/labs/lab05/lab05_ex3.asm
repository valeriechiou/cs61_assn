;=================================================
; Name: <Chiou, Valerie>
; Username: vchio001
;
; Lab: <lab 2>
; Lab section: 22
; TA: Bryan Marsh
; 
;=================================================
.ORIG x3000

LEA R0, PROMPT
PUTS


;LD R6, SUBROUTINE
;JSRR R6

HALT

PROMPT  .STRINGZ "Enter in a number btwn 00 and 20\n"
SUBROUTINE  .FILL   x3200

