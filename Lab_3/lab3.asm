ORG 00H
;-- code memory location 00h
LJMP MAIN

;ORG 50H
	
main:  mov r0, 50H;
	   mov r1, 51H;
	   
	   dec r1;
	   mov @r1,#00H;
	   dec r1
		mov @r1, #00H;
		inc r1
		inc r1
		inc r1
		inc r1
		inc r1
		mov @r1,#00H
		inc r1
		mov @r1, #00H
		
		mov a ,r1;
		
		subb a,#06H;
		mov r1,a;
	  
		mov r2, 52H;
		mov r5,#05H;
loop:
   
	 
     mov a,@r0
	 inc r1
	 inc r1
	 mov b,@r1
	 
	 mul AB
	 
	 
	 using 0
	 push ar0	  
	 mov 90H,r2;
	 mov r0,90H;
	 		
	 mov @r0,B;
	 inc r0
	 mov @r0,A;
	 using 0
	 pop ar0
	 

	 
	 
;-----------------------------1	 
	 
	 
	 inc r0;
	 dec r1;
	 mov a,@r0
	 mov b,@r1
	 
	 
	 mul AB
	 
	 
	 
	 using 0
	 push ar0	  
	 mov 0A0H,r2;
	 mov r0,0A0H;
	 
	 inc r0;
	 
	 add A,@r0;
	 
	 mov @r0,a;
	 
	 dec r0;
	 
	 mov a,b;
	 
	 addc a,@r0;
	 mov @r0,a;
	 using 0
	 pop ar0
	 
;-------------------------2	 
	 inc r0;
	 dec r1;
	 mov a,@r0
	 mov b,@r1
	 
	 
	 mul AB
	 
	 
	 
	 using 0
	 push ar0	  
	 mov 0A0H,r2;
	 mov r0,0A0H;
	 
	 inc r0;
	 
	 add A,@r0;
	 
	 mov @r0,a;
	 
	 dec r0;
	 
	 mov a,b;
	 
	 addc a,@r0;
	 mov @r0,a;
	 using 0
	 pop ar0
	 
	 
	 inc r2;
	 inc r2
	 inc r1
	 dec r0
	 dec r0
	 
djnz r5,loop	 
	 
	 mov 90H,r2
	 mov r0,90H;
	 inc r0
	 mov a, @r0;
	 mov P1,a
		
	 
	 
	 here: sjmp here	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
    
   
	  
 		

		
		
		
		
	   ;mov r2, @r0;
	    ;inc r0
		;mov r3, @r0;
		;inc r0
		;mov r4, @r0;
		;mov r5, @r1;
		;inc r1
		;mov r6, @r1;
		;inc r1
		;;mov r7, @r1;
		;mov r1, 52H;
		
		
		
		;mov a,r3;
		;mov b,r4; 

end
		
