; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
ljmp start

org 200h
start:

mov r0,20H
mov @r0,#41H
inc r0
mov @r0,#42H
inc r0
mov @r0,#50H
inc r0
mov @r0,#53H
inc r0
mov @r0,#57H
inc r0
mov @r0,#3DH
inc r0
mov @r0,#52H
inc r0
mov @r0,#30H
inc r0
mov @r0,#31H
inc r0
mov @r0,#32H
inc r0
mov @r0,#3DH
inc r0
mov @r0,#52H
inc r0
mov @r0,#33H
inc r0
mov @r0,#34H
inc r0
mov @r0,#35H
inc r0
mov @r0,#3DH
inc r0
mov @r0,#52H
inc r0
mov @r0,#36H
inc r0
mov @r0,#37H
inc r0
mov @r0,#53H
inc r0
mov @r0,#50H
inc r0
mov @r0,#3DH





mov r0,#81H
mov @r0,#39H
mov r0,#0D0H
mov @r0,#37H
mov r0,#0F0H
mov @r0,#36H
;mov b,#39H

mov r0,#32H
mov r1,#31H
mov r2,#32H
mov r3,#33H
mov r4,#34H
mov r5,#35H
mov r6,#37H
mov r7,#38H



	  mov a, #41h;
	 mov b,#42h;
	 mov psw,#43h;
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
	  mov a,#85h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov 50H,#53h; 
	  mov   dptr,#my_string1  ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  	






	




	  mov  60H,#42h	
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string2
	  acall lcd_sendstring

	  
	  
	  acall delay1 ; delay of 5seconds

	
		
	  acall lcd_init      ;initialise LCD
	
	  acall delay
	  acall delay
	  acall delay
	  mov a,#85h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov 50H,#53h; 
	  mov   dptr,#my_string3  ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  	
	  
	  
	  mov  60H,#42h	
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string4
	  acall lcd_sendstring







here: sjmp here				//stay here 

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
lcd_sendstring:
	;push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit
			 ;go to exit if zero
             dec a
			 
			 mov 50H,a
			 jz ropart
			 mov r0,50h
			 mov a,@r0
			 
			 
	sending:acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    ;pop 0e0h
         ret                     ;End of routine

ropart: 
		mov r0,#35H
		mov a,r0
		ljmp sending 
		ret
;----------------------delay routine-----------------------------------------------------
delay:	 
         
loop2:	 mov 61H,#255
	 loop1:	 djnz 61H, loop1
	 
	
	 ret
	 
;----------------------delay1 routine_ for 5seconds delay-----------------------------------------------------
delay1:
		push 3
		push 2
		push 1
		push 4
		push 6
		push 7
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
						  MOV R7,#0FFH
				          BACK6 :
				   	           DJNZ R7,BACK6
						  DJNZ R6, BACK5
				    DJNZ R4, back4
			  DJNZ R3, back3

		pop 7
		pop 6 
		pop 4 
		pop 1
		pop 2
		pop 3
ret	
	 

;------------- ROM text strings---------------------------------------------------------------
org 500h
my_string1:
         DB   0E1H,0F1H,0D1H,00H
my_string2:
		 DB   01H,02H,03H,00H	
my_string3:
		 DB   04H,05H,06H,00H
my_string4:
		 DB   07H,08H,82H,00H			 
			 
end
