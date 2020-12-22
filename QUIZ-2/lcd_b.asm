; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
ljmp start

org 200h
start:
      mov P2,#00h
      mov P1,#00h
	  ;initial delay for lcd power up

	;here1:setb p1.0
      	  acall delay
	;clr p1.0
	  acall delay
	;sjmp here1


	  acall lcd_init      ;initialise LCD
	
	  acall delay
	  acall delay
	  acall delay
	  mov a,#80h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay




;mov a,#0C3h		  ;Put cursor on second row,3 column
	  ;acall lcd_command
	  ;acall delay
	  ;mov   dptr,#my_string2
	  ;acall lcd_sendstring	






	  
	  mov p1,#0FFH;
	  setb p1.4
	clr p1.5
	clr p1.6
	clr p1.7
	 mov r7,#00h 
	  
	  
here:	clr p3.2
		jb p1.0, clear;
		ljmp timer
		 mov r0,#5FH
		 ;mov r7,#00h
			
	  

 sjmp here				//stay here 
clear: ;acall lcd_init
		clr p1.4
		mov a,r7
		mov 50h,a
		
		acall asciihigh
		acall asciilow
		
mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string2
	  acall lcd_sendstring		

acall delay

acall delay
acall delay1
acall delay1
acall lcd_init
ljmp start


;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
;lcd_sendstring:
;	push 0e0h
;	lcd_sendstring_loop:
;	 	 clr   a                 ;clear Accumulator for any previous data
;	         movc  a,@a+dptr         ;load the first character in accumulator
;	         jz    exit              ;go to exit if zero
;	         acall lcd_senddata      ;send first char
;	         inc   dptr              ;increment data pointer
;	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
;exit:    pop 0e0h
 ;        ret                     ;End of routine

;--------------------------------------------------------------------
counts:
mov a,r6
mov r1,a
mov a,@r1
acall lcd_senddata
ljmp back_here

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop1:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr;load the first character in accumulator
			mov r6,a
			clr cy
			subb a,#51H
			jz counts
			mov a,r6
			clr cy
			subb a,#52H
			jz counts	
			
			 mov a,r6
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
			 back_here:         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop1    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;----------------------delay routine-----------------------------------------------------
delay:	 push 0
		 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret
;---------------------------------------TIMER------------------------------------------------
timer:

;clr p3.2

ljmp main_t


loop_t: cpl p3.2
		inc r7
		ljmp here
		ljmp main_t



main_t:
push 0
mov r0,#5FH
;mov r7,#00h
loop1_t:
mov 8AH,#00h
mov 8AH,#00h
mov 89H,#01H 

setb 08CH
jb 8Dh ,loop2_t


loop2_t:
djnz r0,loop1_t;
ljmp loop_t

pop 0

here96:sjmp here96





;-------------------------bintoascii-----------------------------------------------------------------

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
				
				mov 51H,a;
				
				sjmp here2
				
				
		second:  mov a,R6
				anl a,#0f0h
				rr a
				rr a
				rr a
				rr a
				
				add a,#30H
				
				mov 51H,a;


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
				
				mov 52H,a;
				
				sjmp here3
				
				
		second1:  mov a,R4
				anl a,#0fh
				;rr a
				;rr a
			;	rr a
			;	rr a
				
				add a,#30H
				
				mov 52H,a;


here3: ret
;-------------------long_delay-------------------------------------

delay1:
		push 1
		push 2
		push 3
		push 4
		push 5
		push 6
		
		mov R3,#5;
   
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
						  MOV R5,#0FFH
				          BACK6 :
				   	           DJNZ R5,BACK6
						  DJNZ R6, BACK5
				    DJNZ R4, back4
			  DJNZ R3, back3
	
		pop 6
		pop 5
		pop 4
		pop 3
		pop 2
		pop 1
		

ret	
	




;------------- ROM text strings---------------------------------------------------------------
org 800h
my_string1:
         DB   " REACTION TIME", 00H
my_string2:
		 DB   "COUNT IS ",51H,52H,00H
end
