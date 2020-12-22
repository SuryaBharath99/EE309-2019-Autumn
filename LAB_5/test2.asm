org 00H
ljmp main



asciihigh:


mov a, 50H
mov R6,a
anl a,#0F0H
rr a
rr a
rr a
rr a



	mov R7,a;
		mov a,#0Ah;
		
		mov psw,#00H
		
		SUBB a,R7;
		mov a,#00H;
		addc a,#00H; 
		
		cjne a,#00h,first
		jz second

first: mov a,R6
				anl a,#0f0h
				rr a
				rr a
				rr a
				rr a
				
				add a,#37H;
				
				mov 53H,a;
				
				sjmp here2
				
				
		second:  mov a,R6
				anl a,#0f0h
				rr a
				rr a
				rr a
				rr a
				
				add a,#30H
				
				mov 53H,a;


here2: ret




asciilow:

mov a, 50H
mov R4,a
anl a,#0FH
;rr a
;rr a
;rr a
;rr a



	mov R5,a;
		mov a,#09h;
		
		mov psw,#00H
		
		SUBB a,R5;
		mov a,#00H;
		addc a,#00H; 
		
		cjne a,#00h,first1
		jz second1

first1: mov a,R4
				anl a,#00Fh
				;rr a
				;rr a
				;rr a
				;rr a
				
				add a,#37H;
				
				mov 54H,a;
				
				sjmp here3
				
				
		second1:  mov a,R4
				anl a,#0fh
				;rr a
				;rr a
			;	rr a
			;	rr a
				
				add a,#30H
				
				mov 54H,a;


here3: ret



main:

	mov 50H,#0AH;
	acall asciihigh
	acall asciilow	
	
	here99: sjmp here99	

end