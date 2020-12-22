; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
ljmp start

org 200h
start:


mov r0,#20H
mov @r0,#4CH
inc r0
mov @r0,#4FH
inc r0
mov @r0,#43H
inc r0
mov @r0,#41H
inc r0
mov @r0,#54H
inc r0
mov @r0,#49H
inc r0
inc r0
mov @r0,#4EH
inc r0
mov @r0,#3DH
inc r0
mov @r0,#45H
inc r0
mov @r0,#53H


mov 55H,#39H
mov r0,#94H
	  mov @r0,#53H
	  inc r0
	   mov @r0,#55H
	   inc r0
	    mov @r0,#52H
		inc r0
		 mov @r0,#59H
		 inc r0
		  mov @r0,#41H
		  mov r0,#0D0H
		  mov @r0,#20H
		   inc r0
		  mov @r0,#20H
		  inc r0
		  mov @r0,#20H
		   inc r0
		  mov @r0,#20H
;mov 53h,#35H
;mov 54H,#35H
;mov 51H,#37H
		  
mov r0,#85H		  
mov @r0,#31H
inc r0
mov @r0,#37H
inc r0
mov @r0,#44H
inc r0
mov @r0,#30H
inc r0
mov @r0,#37H
mov r0,#80H
mov @r0,#30H
inc r0
mov @r0,#30H
inc r0
mov @r0,#35H
inc r0
mov @r0,#35H




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











	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string2
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
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit
			 ;go to exit if zero

			 mov r0,a;
			 mov a,@r0;	
			 acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;----------------------delay routine-----------------------------------------------------
delay:	 
         
loop2:	 mov 61H,#255
	 loop1:	 djnz 61H, loop1
	 
	
	 
	 ret

;------------- ROM text strings---------------------------------------------------------------
org 300h
my_string1:
         DB   20H,21H,22H,23H,24H,25H,21H,27H,28H,53H,54H,00H
my_string2:
		 DB   22H,21H,27H,24H,29H,27H,24H,28H,51H,00H
end
