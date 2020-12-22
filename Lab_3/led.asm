
		LED EQU P1
			
	ORG 00H	
 	LJMP MAIN
	
;-----------------------------------------------------
 
 org 50H
	 
delay : mov a,R0
		mov R3,a;
		mov a,#0Fh;
		ANL a,R3;
		mov B,#01H;
		DIV AB;
		mov R3,a;
		
		back3 :
			  mov R2,#98
			  BACK1 :
				    MOV R1,#0FFH
				    BACK :
				   	     DJNZ R1,BACK
				    DJNZ R2, BACK1
			
			  mov R4,#8;	
			  back4 :
					mov R6,#98
					BACK5 :
						  MOV R7,#0FFH
				          BACK6 :
				   	           DJNZ R7,BACK6
						  DJNZ R6, BACK5
				    DJNZ R4, back4
			  DJNZ R3, back3
ret
	 
MAIN:
		mov R0,LED;
		mov a,#0Fh;
		ANL a,R0;
		mov R0,a;
		
		
		
		
		loopS:  mov LED,#0H;
				LCALL delay;
				mov LED,#020H;
				LCALL delay;
				mov LED,#040H;
				LCALL delay;
				mov LED,#060H;
				LCALL delay;
				mov LED,#080H;
				LCALL delay;
				mov LED,#0A0H;
				LCALL delay;
				mov LED,#0C0H;
				LCALL delay;
				mov LED,#0E0H;
				LCALL delay;
				
				sjmp  loopS;
				
		
		;mov A,#01H
		;mov R5,#01H
		;BACK2 :
				
		;		LCALL delay
		;		xrl a,R5
		;		sjmp BACK2
end	
	