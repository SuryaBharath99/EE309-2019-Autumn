/*
EE337 lab7: ADC IC tlv1543 interfacinng with pt-51
L.W.: (1) Complete spi() function from spi.h so that this projecct will work properly 
			(2) Check whether it is working or not
			(3) Edit adc() function to make it genralized.
*/

#include <at89c5131.h>
#include "lcd.h"																		//Driver for interfacing lcd 
#include "tlv1543.h"																//Driver for interfacing ADC ic tlv1543


char adc_ip_data_ascii[6]={0,0,0,0,0,'\0'};					//string array for saving ascii of input sample
char display_msg1[]="Channel-";							//Display msg on 1st line of lcd
char display_msg2[]=" mV:";													//Display msg on 2nd line of lcd

unsigned int i = 0x0000;
	unsigned int j = 0x0000;
void main(void)
{
	int j=0;
	unsigned int adc_data=0,dac_data=0;
	

	
		//lcd_cmd(0x80);
				//Move cursor to first line
		
	//lcd_write_string(display_msg1);			
	//Display "ADC channel-00:" on first line of lcd
  spi_init();
	adc_init();
  lcd_init();
	
	while(1)
	{ i = 0;
		while(i<100){
		i = i+1;
		
		lcd_cmd(0x80);//Move cursor to first line
		
	  lcd_write_string(display_msg1);
		
		lcd_write_char(0x43);
		
	 	adc_data=adc(12);
		
		adc_data= (unsigned int)(3.225806452*adc_data) ;// converting to milli volt (3.3*1000*i/p / 1023)
	
		int_to_string(adc_dat a,adc_ip_data_ascii);			//Convering integer to string of ascii
		
		lcd_cmd(0xC0);																	//Move cursor to 2nd line
		lcd_write_string(adc_ip_data_ascii);						//Print analog sampled input on lcd
		lcd_write_string(display_msg2);									//Display "XXXXX mV" on 2nd line of lcd
	  
		
		msdelay(40);}
		
			spi_init();
			adc_init();
			lcd_init();
		  j= 0;
		
		while(j<100){
		  
			j = j+1;
			
			lcd_cmd(0x80);//Move cursor to first line
		
	    lcd_write_string(display_msg1);
	
	    lcd_write_char(0x30);
			
			
		adc_data=adc(0);
		
		adc_data= (unsigned int)(3.225806452*adc_data) ;// converting to milli volt (3.3*1000*i/p / 1023)
	
		int_to_string(adc_data,adc_ip_data_ascii);			//Convering integer to string of ascii
		
		lcd_cmd(0xC0);																	//Move cursor to 2nd line
		lcd_write_string(adc_ip_data_ascii);						//Print analog sampled input on lcd
		lcd_write_string(display_msg2);		
		 msdelay(40);}
		
	}
}

