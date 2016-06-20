;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Assignment: lab 6
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================

;=================================================
; main
;=================================================
.orig x3000
LEA R0, PROMPT
PUTS

GETC
OUT
ADD R5, R0, #0
LD R0, ENTERCHAR
OUT

LD R0, POINTER_BIT_COUNTER
JSRR R0

LEA R0,ANSWER
PUTS

LD R2,ASCII_TOCHAR
ADD R0,R6,R2
OUT


HALT

;data
PROMPT .STRINGZ "Input a single character\n"
ANSWER .STRINGZ "The number of 1 bits is: "
ENTERCHAR .FILL '\n'
ASCII_TOCHAR .FILL x30
POINTER_BIT_COUNTER .FILL x3200

.orig x3200
SUB_BIT_COUNTER
    
    ;store
    ST R0,R0_BACKUP_3200
    ST R2,R2_BACKUP_3200
    ST R3,R3_BACKUP_3200
    ST R4,R4_BACKUP_3200
    ST R5,R5_BACKUP_3200
    ST R7,R7_BACKUP_3200



    LD R0,R0_BACKUP_3200
    LD R2,R2_BACKUP_3200
    LD R3,R3_BACKUP_3200
    LD R4,R4_BACKUP_3200
    LD R5,R5_BACKUP_3200
    LD R7,R7_BACKUP_3200

    RET

;DATA
DEC_16 .FILL #16
FRONT_BIT .FILL x8000
R0_BACKUP_3200 .BLKW #1
R1_BACKUP_3200 .BLKW #1
R2_BACKUP_3200 .BLKW #1
R3_BACKUP_3200 .BLKW #1
R4_BACKUP_3200 .BLKW #1
R5_BACKUP_3200 .BLKW #1
R6_BACKUP_3200 .BLKW #1
R7_BACKUP_3200 .BLKW #1
.end

