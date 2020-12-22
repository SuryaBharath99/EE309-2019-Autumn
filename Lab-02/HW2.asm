

	LED EQU P1

	ORG 00	
	LJMP MAIN


;----------------------------------------------------------------
	ORG 50H








delay : mov R3,4FH;
   
		back3 :
			  mov R2,#196
			  BACK1 :
				    MOV R1,#0FFH
				    BACK :
				   	     DJNZ R1,BACK
				    DJNZ R2, BACK1
			
			  mov R4,#12;	
			  back4 :
					mov R6,#196
					BACK5 :
						  MOV R7,#0FFH
				          BACK6 :
				   	           DJNZ R7,BACK6
						  DJNZ R6, BACK5
				    DJNZ R4, back4
			  DJNZ R3, back3
ret


;----------------------------------------------------------------------

MAIN:
		
		
		mov LED,#00H
		mov A,#01H
		mov R5,#01H
		BACK2 :
				mov LED,a
				LCALL delay
				xrl a,R5
				sjmp BACK2
end				