#include "at89c5131.h"
#include "serial.c"



void main(void)
{
   uart_init();					//Call function to initialize UART
		P0 = 0x0f;
  while(1)   
	 {
    
  transmit_char('A');		 //Call function to transmit 'A'
		
		 delay_ms(100);//Call 100 ms delay function
   }		 
}
