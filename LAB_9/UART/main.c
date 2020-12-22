#include <at89c5131.h>
#include "lcd.h"
#include "serial.c"

sbit LED=P1^7;
unsigned char intr_count = 0,rx_buf = 0;
//bit tx_complete = 0;
//bit rx_complete = 0;
unsigned char m,num;
unsigned char n ;	
bit k,b7,b6,b5,b4;
//sbit w7 = P1^7;
sbit w6 = P1^6;
sbit w5 = P1^5;
sbit w4 = P1^4;


void timer_ISR(void) interrupt 1
{
		intr_count++;
	  
		TF0 = 0 ;
	while(intr_count == 30){
		LED = ~LED;
		num = num+1;
		intr_count = 0;}
	
	
}	

void gpio_test(void)
{/*
	P1 = 0x0F;
  delay_ms(5000);	
	b7 = P1^3;
	b6 = P1^2;
	b5 = P1^1;
	b4 = P1^0;
	
	P1 = 0x0F;
	delay_ms(1000);
	 LED = b7;
	w6 = b6;
	w5 = b5;
	w4 = b4;
*/
	P1 = 0x0F;
	TR0 =0;
	P1 = 0x0F;
  delay_ms(5000);	
	m = P1%16;
	
	P1 = m<<4;
	
	
	
	
	
	
	// Write your testing code here.
}	

void led_test(void)
{
	TR0 =0;
	P1 = 0xFF;
// Write your testing code here.	
}

void lcd_test(void)
{TR0 =0;
	lcd_write_string("LCD IS TESTED");
// Write your testing code here.
}	

void timer_test(void)
{
	
	
	P1 = 0x00;
	P1= 0x0F;
	
	TMOD = 0x21;
	TH0 = 0x00;
	TL0 = 0x01;
	
	TR0 = 1;
	ET0 = 1;
while(num<10){}
	
	
	
	
// Write your testing code here.
}

void main(void)
{
	unsigned char ch=0;
	P1 = 0x0F;
	lcd_init();
	uart_init();
	transmit_string("************************\r\n");
	transmit_string("******8051 Tests********\r\n");
	transmit_string("************************\r\n");
	transmit_string("Press 1 for GPIO test\r\n");
	transmit_string("Press 2 for LED test\r\n");
	transmit_string("Press 3 for LCD test\r\n");
	
	while(1)
	{
			ch = receive_char();
			switch(ch)
			{
				case '1':gpio_test();
								 transmit_string("GPIO tested\r\n");
						
								 break;
				case '2':led_test();
								 transmit_string("LED tested\r\n");
								 break;
				case '3':lcd_init();
									lcd_test();
								 transmit_string("LCD tested\r\n");
								 break;
				case '4':timer_test();
								 transmit_string("Timer tested\r\n");
								 break;
								
				default:transmit_string("Incorrect test.Pass correct number\r\n");
								 break;
				
			}		
	}
}
