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
char display1[]="CHANNEL 1";							//Display msg on 1st line of lcd
char display2[]="CHANNEL 2";							//Display msg on 1st line of lcd
char display3[3][10]={"CHANNEL 11", "CHANNEL 12", "CHANNEL 13"};		

char display_msg2[]=" mV";													//Display msg on 2nd line of lcd
unsigned int a=1, b=2;


void main(void)
{	
	unsigned int adc_data=0,dac_data=0, i=0,j=0, k=11;

	spi_init();
	adc_init();
  lcd_init();
	
		lcd_cmd(0x80);																	//Move cursor to first line
		//lcd_write_string(display_msg1);									//Display "ADC channel-00:" on first line of lcd
	
	
//			TMOD= 0x01;
//  		THO= 0x00;
//	  	TLO= 0x00;
	
	while(1)
	{	
		for( i=0; i<20; i++){
	
		lcd_cmd(0x80);																	//Move cursor to first line
		lcd_write_string(display1);
				
	 	adc_data=adc(a);
		
		adc_data= (unsigned int)(3.225806452*adc_data) ;// converting to milli volt (3.3*1000*i/p / 1023)
	
		int_to_string(adc_data,adc_ip_data_ascii);			//Convering integer to string of ascii
		
		lcd_cmd(0xC0);																	//Move cursor to 2nd line
		lcd_write_string(adc_ip_data_ascii);						//Print analog sampled input on lcd
		lcd_write_string(display_msg2);									//Display "XXXXX mV" on 2nd line of lcd
				
		}

		lcd_cmd(0x01);		
	
	for( i=0; i<20; i++){

		
		lcd_cmd(0x80);																	//Move cursor to first line
		lcd_write_string(display2);
	 	adc_data=adc(b);
		
		adc_data= (unsigned int)(3.225806452*adc_data) ;// converting to milli volt (3.3*1000*i/p / 1023)
	
		int_to_string(adc_data,adc_ip_data_ascii);			//Convering integer to string of ascii
		
		lcd_cmd(0xC0);																	//Move cursor to 2nd line
		lcd_write_string(adc_ip_data_ascii);						//Print analog sampled input on lcd
		lcd_write_string(display_msg2);									//Display "XXXXX mV" on 2nd line of lcd
	}
	
	lcd_cmd(0x01);
	
	
	for( k=11; k<14; k++){
		
		for( i=0; i<20; i++){
		char internal[10];
			for(j=0; j<10; j++)
			{
			internal[j]=display3[k-11][j];
			}
			
			lcd_cmd(0x80);
			lcd_write_string(internal);
	 	adc_data=adc(k);
		
		adc_data= (unsigned int)(3.225806452*adc_data) ;// converting to milli volt (3.3*1000*i/p / 1023)
	
		int_to_string(adc_data,adc_ip_data_ascii);			//Convering integer to string of ascii
		
		lcd_cmd(0xC0);																	//Move cursor to 2nd line
		lcd_write_string(adc_ip_data_ascii);						//Print analog sampled input on lcd
		lcd_write_string(display_msg2);									//Display "XXXXX mV" on 2nd line of lcd
			
	}
		lcd_cmd(0x01);
}

	}
}

