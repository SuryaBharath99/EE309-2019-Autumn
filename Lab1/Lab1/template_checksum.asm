ORG 00H
;-- code memory location 00h
LJMP MAIN

ORG 50H
;-- code memory location 50h

INIT:
	;-- store the numbers to be added at appropriate locations
	mov r0, #40H;
	mov r4, #28H;
	mov r2, #1;
	
	;inc r2;
	
	loop: mov a,r2;
		  mov @r0,a;
		  inc r2;
		  inc r0;
			
		djnz r4, loop;
		
	RET
;-- end of subroutine INIT

ADD_40:
	mov a,#0;
	mov r1,#40H;
	mov r5, #28H;
	;-- add the numbers stored from memory location 40h to 67h
	;-- by using subroutine written in homework
	loop1: add a,@r1;
		  inc r1;
		  djnz r5,loop1;
	mov 80H,a;
	RET
;-- end of subroutine ADD_40
	
TWOS_COMP:
	;-- perform 2's compliment of the resultant sum
	;-- store the checksum byte at memory location 68h
	cpl a;
	add a,#01H;
	mov 68H,a;
	
	RET
;-- end of subroutine TWOS_COMP

ADD_41:
        ;-- add numbers from memory location 40h to 68h
	mov a,80H;
	add a,68H;
	RET
;-- end of subroutine ADD_41

ORG 0200H
;-- code memory location 200h
MAIN:
	ACALL INIT
	ACALL ADD_40
	ACALL TWOS_COMP
	ACALL ADD_41	;verify the result
	HERE:SJMP HERE
END



