;=================================================
; Name: Valerie Chiou
; Email: vchio001@ucr.edu
; 
; Assignment name: assn 6
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
JSR MAIN_MENU


HALT

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MENU
; Inputs: None
; Postcondition: The subroutine has printed out a menu with numerical options, allowed the
;                          user to select an option, and returned the selected option.
; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7
; no other return value is possible
;-----------------------------------------------------------------------------------------------------------------
MAIN_MENU
.ORIG x3200

ST R0, BACKUP_R0_32
ST R1, BACKUP_R1_32
ST R2, BACKUP_R2_32
ST R3, BACKUP_R3_32
ST R4, BACKUP_R4_32
ST R5, BACKUP_R5_32
ST R6, BACKUP_R6_32
ST R7, BACKUP_R7_32

TOP

LD R0, Menu_string_addr
LDR R6, R0, #0
LEA R6, Menu_string_addr
PUTS

GETC
OUT
ADD R1, R0, #0
LEA R0, ENTER
PUTS

ADD R1 ,R1 ,#-15
ADD R1 ,R1 ,#-15
ADD R1 ,R1 ,#-15
ADD R1 ,R1 ,#-3
ADD R2 ,R1 ,#0
ADD R2 ,R2 ,#-1

BRz OPTION1
ADD R2 ,R2 ,#-1
BRz OPTION2
ADD R2 ,R2 ,#-1
BRz OPTION3
ADD R2 ,R2 ,#-1
BRz OPTION4
ADD R2 ,R2 ,#-1
BRz OPTION5
ADD R2 ,R2 ,#-1
BRz OPTION6
ADD R2 ,R2 ,#-1
BRz OPTION7
BR ERROR

OPTION1
	JSR ALL_MACHINES_BUSY
	BR TOP
OPTION2
	JSR ALL_MACHINES_FREE
	BR TOP
OPTION3
	LD R6 ,SUB_NUM_BUS_MACHINES
	JSRR R6
	BR TOP
OPTION4
	LD R6 , SUB_FREE_MACHINES
	JSRR R6
	BR TOP
OPTION5
	LD R6 , SUB_MACHINE_STATUS
	JSRR R6
	BR TOP
OPTION6
	LD R6 , SUB_FIRST_FREE
	JSRR R6
	BR TOP
OPTION7
	LEA R0 , Quit_message_1
	PUTS
	BR FINISH
ERROR
	LEA R0 , Error_message_1
	PUTS
	BR TOP


FINISH

LD R0, BACKUP_R0_32
LD R1, BACKUP_R1_32
LD R2, BACKUP_R2_32
LD R3, BACKUP_R3_32
LD R4, BACKUP_R4_32
LD R5, BACKUP_R5_32
LD R6, BACKUP_R6_32
LD R7, BACKUP_R7_32
RET
BACKUP_R0_32	.BLKW #1
BACKUP_R1_32	.BLKW #1
BACKUP_R2_32	.BLKW #1
BACKUP_R3_32	.BLKW #1
BACKUP_R4_32	.BLKW #1
BACKUP_R5_32	.BLKW #1
BACKUP_R6_32	.BLKW #1
BACKUP_R7_32	.BLKW #1
;--------------------------------
;Data for subroutine MENU
;--------------------------------
Error_message_1 .STRINGZ "INVALID INPUT\n"
Menu_string_addr .FILL x6000
ENTER .STRINGZ "\n"
Quit_message_1 .STRINGZ "Goodbye!\n"

SUB_NUM_BUS_MACHINES .FILL x3800
SUB_FREE_MACHINES .FILL x4000
SUB_MACHINE_STATUS .FILL x4200
SUB_FIRST_FREE .FILL x4400

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_BUSY
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are busy
; Return value (R2): 1 if all machines are busy,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
ALL_MACHINES_BUSY
.ORIG x3400

ST R0, BACKUP_R0_34
ST R1, BACKUP_R1_34
ST R2, BACKUP_R2_34
ST R3, BACKUP_R3_34
ST R4, BACKUP_R4_34
ST R5, BACKUP_R5_34
ST R6, BACKUP_R6_34
ST R7, BACKUP_R7_34

LDI R1 , BUSYNESS_ADDR_ALL_MACHINES_BUSY
ADD R1 ,R1 ,#0

BRz ALL_ARE_BUSY
ALL_ARE_NOT_BUSY
	LD R2 ,NOT_ALL_MACHINES_ARE_BUSY
	LEA R0,ALLNOTBUSY
	PUTS
	BR FINISH_CHECK
ALL_ARE_BUSY
	LD R2 ,ALL_MACHINES_ARE_BUSY
	LEA R0,ALLBUSY
	PUTS

FINISH_CHECK

LD R0, BACKUP_R0_34
LD R1, BACKUP_R1_34
LD R2, BACKUP_R2_34
LD R3, BACKUP_R3_34
LD R4, BACKUP_R4_34
LD R5, BACKUP_R5_34
LD R6, BACKUP_R6_34
LD R7, BACKUP_R7_34
RET
BACKUP_R0_34	.BLKW #1
BACKUP_R1_34	.BLKW #1
BACKUP_R2_34	.BLKW #1
BACKUP_R3_34	.BLKW #1
BACKUP_R4_34 	.BLKW #1
BACKUP_R5_34	.BLKW #1
BACKUP_R6_34	.BLKW #1
BACKUP_R7_34	.BLKW #1

;--------------------------------
;Data for subroutine ALL_MACHINES_BUSY
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_BUSY .FILL x9000
ALL_MACHINES_ARE_BUSY .FILL #1
NOT_ALL_MACHINES_ARE_BUSY .FILL #0
ALLNOTBUSY .Stringz "Not all machines are busy\n"
ALLBUSY .Stringz "All machines are busy\n"

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_FREE
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are free
; Return value (R2): 1 if all machines are free,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_FREE
;--------------------------------
ALL_MACHINES_FREE
.ORIG x3600 

ST R0, BACKUP36_R0
ST R1, BACKUP36_R1
ST R2, BACKUP36_R2
ST R3, BACKUP36_R3
ST R4, BACKUP36_R4
ST R5, BACKUP36_R5
ST R6, BACKUP36_R6
ST R7, BACKUP36_R7

LDI R1, BUSYNESS_ADDR_ALL_MACHINES_FREE
LD R3, MATH_CHECK

NOT R4 ,R3
ADD R4 ,R4 ,#1
ADD R1 ,R4 ,R1

BRz ALL_ARE_FREE
NOT_ALL_ARE_FREE
	LD R2, NOT_ALL_MACH_R_FREE
	LEA R0, NOTFREE
	PUTS
	BR FINISH_ALLFREE_CHECK
ALL_ARE_FREE
	LD R2, ALL_MACH_R_FREE
	LEA R0, FREE
	PUTS

FINISH_ALLFREE_CHECK

LD R0, BACKUP36_R0
LD R1, BACKUP36_R1
LD R3, BACKUP36_R3
LD R4, BACKUP36_R4
LD R5, BACKUP36_R5
LD R6, BACKUP36_R6
LD R7, BACKUP36_R7
RET
BACKUP36_R0	.BLKW #1
BACKUP36_R1	.BLKW #1
BACKUP36_R2	.BLKW #1
BACKUP36_R3	.BLKW #1
BACKUP36_R4	.BLKW #1
BACKUP36_R5	.BLKW #1
BACKUP36_R6	.BLKW #1
BACKUP36_R7	.BLKW #1

;--------------------------------
;Data for subroutine ALL_MACHINES_FREE
;--------------------------------
ALL_MACH_R_FREE .FILL #1
NOT_ALL_MACH_R_FREE .FILL #0
MATH_CHECK .FILL xFFFF
BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill x9000
FREE .STRINGZ "All machines are free\n"
NOTFREE .STRINGZ "Not all machines are free\n"

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_BUSY_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of busy machines.
; Return Value (R2): The number of machines that are busy
;-----------------------------------------------------------------------------------------------------------------
NUM_BUSY_MACHINES
.ORIG x3800 

ST R0, BACKUP38_R0
ST R1, BACKUP38_R1
ST R2, BACKUP38_R2
ST R3, BACKUP38_R3
ST R4, BACKUP38_R4
ST R5, BACKUP38_R5
ST R6, BACKUP38_R6
ST R7, BACKUP38_R7

LDI R1, BUSYNESS_ADDR_NUM_BUSY_MACHINES
LD R3 ,COUNT_16
LD R4 ,NUMBUSY_COUNTER

CHECK_NUM_BUSY_MACHINES
ADD R1 ,R1 ,#0
BRzp MARK_AS_BUSY

NOT_MARK_AS_BUSY
	BR END_COUNT
MARK_AS_BUSY
	ADD R4 ,R4 ,#1

END_COUNT

ADD R1 ,R1 ,R1
ADD R3 ,R3 ,#-1
BRp CHECK_NUM_BUSY_MACHINES
ADD R2 ,R4 ,#0


LEA R0, BUSYMACHINE1
PUTS

ADD R5 ,R4 ,#-10
BRzp TENS_BUSY
BR SINGLES_BUSY

TENS_BUSY
	ADD R4 ,R4 ,#-10
	LD R0,MORE_THAN10_FLAG
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#3
	OUT;TRAP x21

SINGLES_BUSY
	ADD R0 ,R4 ,#0
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#3
	OUT;TRAP x21

LEA R0, BUSYMACHINE2
PUTS

LD R0, BACKUP38_R0
LD R1, BACKUP38_R1
LD R3, BACKUP38_R3
LD R4, BACKUP38_R4
LD R5, BACKUP38_R5
LD R6, BACKUP38_R6
LD R7, BACKUP38_R7
RET
BACKUP38_R0	.BLKW #1
BACKUP38_R1	.BLKW #1
BACKUP38_R2	.BLKW #1
BACKUP38_R3	.BLKW #1
BACKUP38_R4	.BLKW #1
BACKUP38_R5	.BLKW #1
BACKUP38_R6	.BLKW #1
BACKUP38_R7	.BLKW #1

;--------------------------------
;Data for subroutine NUM_BUSY_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_BUSY_MACHINES .Fill x9000
NUMBUSY_COUNTER .FILL #0
MORE_THAN10_FLAG .FILL #1
COUNT_16 .FILL #16
BUSYMACHINE1 .STRINGZ "There are "
BUSYMACHINE2 .STRINGZ " busy machines\n"

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_FREE_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of free machines
; Return Value (R2): The number of machines that are free 
;-----------------------------------------------------------------------------------------------------------------
NUM_FREE_MACHINES
.ORIG x4000

ST R0, BACKUP40_R0
ST R1, BACKUP40_R1
ST R2, BACKUP40_R2
ST R3, BACKUP40_R3
ST R4, BACKUP40_R4
ST R5, BACKUP40_R5
ST R6, BACKUP40_R6
ST R7, BACKUP40_R7


LDI R1, BUSYNESS_ADDR_NUM_FREE_MACHINES
LD R3 , COUNT16_x4000
LD R4 , ZERO ;NUMBER FREE COUNT

BEGIN_CHECK_NUMBER_FREE_MACH
ADD R1 ,R1 ,#0
BRn IS_FREE

NOT_FREE
	BR END_CHECK_NUMBERFREE
IS_FREE
	ADD R4  ,R4 ,#1

END_CHECK_NUMBERFREE

ADD R1 ,R1 ,R1
ADD R3 ,R3 ,#-1
BRp BEGIN_CHECK_NUMBER_FREE_MACH
ADD R2 ,R4 ,#0


LEA R0, FREEMACHINE1
PUTS

ADD R5 ,R4 ,#-10
BRzp TENSPLACE_FREE
BR SINGLESPLACE_FREE

TENSPLACE_FREE
	ADD R4 ,R4 ,#-10
	LD R0 ,MT_TEN_FLAG
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#3
	OUT;TRAP x21

SINGLESPLACE_FREE
	ADD R0 ,R4 ,#0
	ADD R0 , R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#15
	ADD R0 ,R0 ,#3
	OUT;TRAP x21



LEA R0, FREEMACHINE2
PUTS

LD R0, BACKUP40_R0
LD R1, BACKUP40_R1
LD R3, BACKUP40_R3
LD R4, BACKUP40_R4
LD R5, BACKUP40_R5
LD R6, BACKUP40_R6
LD R7, BACKUP40_R7
RET
BACKUP40_R0	.BLKW #1
BACKUP40_R1	.BLKW #1
BACKUP40_R2	.BLKW #1
BACKUP40_R3	.BLKW #1
BACKUP40_R4	.BLKW #1
BACKUP40_R5	.BLKW #1
BACKUP40_R6	.BLKW #1
BACKUP40_R7	.BLKW #1

;--------------------------------
;Data for subroutine NUM_FREE_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill x9000
COUNT16_x4000 .FILL #16
ZERO .FILL #0
MT_TEN_FLAG .FILL #1
FREEMACHINE1 .STRINGZ "There are "
FREEMACHINE2 .STRINGZ " free machines\n"

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MACHINE_STATUS
; Input (R1): Which machine to check
; Postcondition: The subroutine has returned a value indicating whether the machine indicated
;                          by (R1) is busy or not.
; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free
;-----------------------------------------------------------------------------------------------------------------
MACHINE_STATUS
.ORIG x4200
 
ST R0, BACKUP42_R0
ST R1, BACKUP42_R1
ST R2, BACKUP42_R2
ST R3, BACKUP42_R3
ST R4, BACKUP42_R4
ST R5, BACKUP42_R5
ST R6, BACKUP42_R6
ST R7, BACKUP42_R7

BEGIN

LDI R3,BUSYNESS_ADDR_MACHINE_STATUS
LD R5, COUNT9
LEA R0, STATUS_MESSAGE
PUTS

GETC
OUT

ADD R0 ,R0 ,#-15
ADD R0 ,R0 ,#-15
ADD R0 ,R0 ,#-15
ADD R0 ,R0 ,#-3
ADD R1 ,R0 ,#0
BRn ERROR_42
ADD R6 ,R1, #-9
BRp ERROR_42

GETC
OUT

ADD R0 ,R0 ,#-10
BRz ENTER_ENTERED
ADD R0 ,R0 ,#-5
ADD R0 ,R0 ,#-15
ADD R0 ,R0 ,#-15
ADD R0 ,R0 ,#-3
BRn ERROR_42
ADD R6 ,R0 ,#-5
BRp ERROR_42
ADD R4 ,R1 ,#0

MULTILOOP
ADD R1 ,R1 ,R4
ADD R5 ,R5 ,#-1
BRp MULTILOOP
ADD R1 ,R1 ,R0

ADD R6 ,R1 ,#-15
BRp ERROR_42

LEA R0, NL_ENTER
PUTS


ENTER_ENTERED

ADD R4 ,R1 ,#0
BRz IZ_ZERO
GOTO_MACHINE

ADD R3 ,R3 ,R3
ADD R4 ,R4 ,#-1
BRp GOTO_MACHINE

IZ_ZERO
CHECK_BUSY
ADD R3 ,R3 ,#0
BRzp IZ_BUSY

IZ_FREE
	LD R2 ,IS_FREE_1
	LEA R0, MACHINEE
	PUTS
	
	ADD R4 ,R1 ,#0
	ADD R5 ,R4 ,#-10
	BRzp TENSPLACE_FIRST_FREE
	BR SINGS_FIRST_FREE

	TENSPLACE_FIRST_FREE
		ADD R4 ,R4 ,#-10
		LD R0 ,IF_10FIRST
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#3
		OUT

	SINGS_FIRST_FREE
		ADD R0 ,R4 ,#0
		ADD R0 ,R0 ,#15
		ADD R0 ,R0, #15
		ADD R0 ,R0, #15
		ADD R0 ,R0, #3
		OUT
		LEA R0, ISFREE_STRING
		PUTS
		BR END_SUB
IZ_BUSY
	LD R2, IS_BUSY_0
	LEA R0, MACHINEE
	PUTS
	
	ADD R4 ,R1 ,#0
	ADD R5 ,R4 ,#-10
	BRzp TEN10_FIRST_BUSY
	BR SINGLESING_FIRST_BUSY

	TEN10_FIRST_BUSY
		ADD R4 ,R4 ,#-10
		LD R0 ,IF_10FIRST
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#3
		OUT;TRAP x21

	SINGLESING_FIRST_BUSY
		ADD R0 ,R4 ,#0
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#15
		ADD R0 ,R0 ,#3
		TRAP x21

	LEA R0, ISBUSY_STRING
	PUTS
	BR END_SUB

ERROR_42
	LEA R0,ERROR_STRING_MSG
	PUTS
	BR BEGIN
	
END_SUB

LD R0, BACKUP42_R0
LD R3, BACKUP42_R3
LD R4, BACKUP42_R4
LD R5, BACKUP42_R5
LD R6, BACKUP42_R6
LD R7, BACKUP42_R7
RET
BACKUP42_R0	.BLKW #1
BACKUP42_R1	.BLKW #1
BACKUP42_R2	.BLKW #1
BACKUP42_R3	.BLKW #1
BACKUP42_R4	.BLKW #1
BACKUP42_R5	.BLKW #1
BACKUP42_R6	.BLKW #1
BACKUP42_R7	.BLKW #1

;--------------------------------
;Data for subroutine MACHINE_STATUS
;--------------------------------
BUSYNESS_ADDR_MACHINE_STATUS .Fill x9000
STATUS_MESSAGE .STRINGZ "Enter which machine you want the status of (0-15), followed by ENTER: "
NL_ENTER .STRINGZ "\n"
IS_BUSY_0 .FILL #0
IS_FREE_1 .FILL #1
COUNT9 .FILL #9
IF_10FIRST .FILL #1
ERROR_STRING_MSG .STRINGZ "\nERROR INVALID INPUT\n"
MACHINEE .STRINGZ "Machine "
ISBUSY_STRING .STRINGZ " is busy\n"
ISFREE_STRING .STRINGZ " is free\n"

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: FIRST_FREE
; Inputs: None
; Postcondition: 
; The subroutine has returned a value indicating the lowest numbered free machine
; Return Value (R2): the number of the free machine
;-----------------------------------------------------------------------------------------------------------------
FIRST_FREE
.ORIG x4400 
ST R0, GR0
ST R1, GR1
ST R2, GR2
ST R3, GR3
ST R4, GR4
ST R5, GR5
ST R6, GR6
ST R7, GR7

LDI R1,FIRST_PTR 

LD R3, ZER0
AND R4,R1,#1
ADD R4,R4,#-1
BRz FREE_LOC

LD R3, ONE
AND R4,R1,#2
ADD R4,R4,#-2
BRz FREE_LOC

LD R3, TWO
AND R4,R1,#4
ADD R4,R4,#-4
BRz FREE_LOC

LD R3, THREE
AND R4,R1,#8
ADD R4,R4,#-8
BRz FREE_LOC

LD R3, FOUR
LD R5, P4
AND R4,R1, R5
ADD R4,R4,#-16
BRz FREE_LOC

LD R3, FIVE
LD R5, P5
LD R6, N5
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, SIX
LD R5, P6
LD R6, N6
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, SEVEN
LD R5, P7
LD R6, N7
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, EIGHT
LD R5, P8
LD R6, N8
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, NINE
LD R5, P9
LD R6, N9
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, TEN
LD R5, P10
LD R6, N10
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, ELEVEN
LD R5, P11
LD R6, N11
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, TWELVE
LD R5, P12
LD R6, N12
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, THIRTEEN
LD R5, P13
LD R6, N13
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, FOURTEEN
LD R5, P14
LD R6, N14
AND R4,R1, R5
ADD R4,R4,R6
BRz FREE_LOC

LD R3, FIFTEEN
LD R5, P15
LD R6, N15
AND R4,R1, R5
ADD R4,R4,R6
ADD R4,R4,#1
BRz FREE_LOC

LEA R0,NO_FREE_MAC
PUTS
BR END_G

FREE_LOC

ADD R2,R3,#0
LEA R0, FOUND_FREE_STRING
PUTS


ADD R5,R3,#-10
BRzp TEN_FIRST
BR SINGLE_FIRST

TEN_FIRST
ADD R3,R3,#-10
LD R0,IF_MORE_THAN_TEN_FIRST
ADD R0,R0,#15
ADD R0,R0,#15
ADD R0,R0,#15
ADD R0,R0,#3
TRAP x21

SINGLE_FIRST
ADD R0,R3,#0
ADD R0,R0,#15
ADD R0,R0,#15
ADD R0,R0,#15
ADD R0,R0,#3
TRAP x21
LEA R0,NLG
PUTS

END_G
LD R0, GR0

LD R3, GR3
LD R4, GR4
LD R5, GR5
LD R6, GR6
LD R7, GR7
RET
GR0	.BLKW #1
GR1	.BLKW #1
GR2	.BLKW #1
GR3	.BLKW #1
GR4	.BLKW #1
GR5	.BLKW #1
GR6	.BLKW #1
GR7	.BLKW #1
FIRST_PTR .FILL x9000
IF_MORE_THAN_TEN_FIRST .FILL #1
ZER0 .FILL #0
ONE .FILL #1
TWO .FILL #2
THREE .FILL #3
FOUR .FILL #4
FIVE .FILL #5
SIX .FILL #6
SEVEN .FILL #7
EIGHT .FILL #8
NINE .FILL #9
TEN .FILL #10
ELEVEN .FILL #11
TWELVE .FILL #12
THIRTEEN .FILL #13
FOURTEEN .FILL #14
FIFTEEN .FILL #15
P4 .FILL #32
P5 .FILL #32
P6 .FILL #64
P7 .FILL #128
P8 .FILL #256
P9 .FILL #512
P10 .FILL #1024
P11 .FILL #2048
P12 .FILL #4096
P13 .FILL #8192
P14 .FILL #16384
P15 .FILL #-32767

N5 .FILL #-32
N6 .FILL #-64
N7 .FILL #-128
N8 .FILL #-256
N9 .FILL #-512
N10 .FILL #-1024
N11 .FILL #-2048
N12 .FILL #-4096
N13 .FILL #-8192
N14 .FILL #-16384
N15 .FILL #32767
NO_FREE_MAC .STRINGZ "No machines are free\n"
FOUND_FREE_STRING .STRINGZ "The first available machine is number "
NLG .STRINGZ "\n"
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: Get input
; Inputs: None
; Postcondition: 
; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]
; Return Value (R1): The value of the contructed input
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to get input from the user, except the prompt is different.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------

;--------------------------------
;Data for subroutine Get input
;--------------------------------
;prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "
;Error_message_2 .STRINGZ "ERROR INVALID INPUT\n"
	
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in 
; Return Value : 
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to print the number to the user WITHOUT leading 0's and DOES NOT output the '+' 
;	for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------

;--------------------------------
;Data for subroutine print number
;--------------------------------



.ORIG x6000
MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"

.ORIG x0000			; Remote data
BUSYNESS .FILL xABCD		; <----!!!VALUE FOR BUSYNESS VECTOR!!!

;---------------	
;END of PROGRAM
;---------------	
.END
