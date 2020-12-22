; This subroutine writes characters on the LCD
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

ORG 0000H
ljmp start




org 100h
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


;mov 55H,#39H



mov 55H,#39H
mov 10H,#39h

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
	  
	  
	  mov r0,#50h
	  lcall readNibble
	  mov 50H,a
	  acall delay
	  push 0E0H 
	  mov a,50H
	  mov 52H,a
	  pop 0E0H
	  lcall readNibble
	  mov 50h,a
	  acall delay
	   push 0E0H 
	  mov a,50H
	  ;mov b,#16
	  ;mul AB
	  add a,52H
	  mov 50H,a
	  pop 0E0H
	  
	  
	  acall asciihigh
	  acall asciilow
	  
	  
	  
	  
	  
	  
	  mov r0,50H
	  mov 51H,@r0
	  
	  mov   dptr,#my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay











	  mov a,#0C3h		  ;Put cursor on second row,3 column
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
	         movc  a,@a+dptr
			 ;load the first character in accumulator
			
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


;----------------------delay1 routine_ for 5seconds delay-----------------------------------------------------

;----------------------read_Nibble-----------------------------------------------------
readNibble:
mov P1, #0Fh



		mov R3,#1;
   
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

mov r0,#90H

mov a,@r0
anl a,#0FH
mov 50H,a

RET







;-------------------bin2ascii---------------------------
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
rr a
rr a
rr a
rr a



	mov R5,a;
		mov a,#0Ah;
		
		mov psw,#00H
		
		SUBB a,R5;
		mov a,#00H;
		addc a,#00H; 
		
		cjne a,#00h,first1
		jz second1

first1: mov a,R4
				anl a,#00Fh
				rr a
				rr a
				rr a
				rr a
				
				add a,#37H;
				
				mov 54H,a;
				
				sjmp here3
				
				
		second1:  mov a,R4
				anl a,#0fh
				rr a
				rr a
				rr a
				rr a
				
				add a,#30H
				
				mov 54H,a;


here3: ret






;

;------------- ROM text strings---------------------------------------------------------------
org 400h
my_string1:
         DB   20H,21H,22H,23H,24H,25H,21H,27H,28H,53H,54H,00H
my_string2:
		 DB   22H,21H,27H,24H,29H,27H,24H,28H,51H,00H
end
