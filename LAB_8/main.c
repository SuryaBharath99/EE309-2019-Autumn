/*
EE337 lab7: DAC IC tlv5616 interfacinng with pt-51
L.W.: (1) Complete spi() function from spi.h and dac() function from tlv5616.h so that this projecct will work properly 
			(2) Check whether it is working or not
			(3) Edit adc() function to make it genralized.
*/

#include <at89c5131.h>
#include "lcd.h"																	//Driver for interfacing lcd 
#include "tlv1543.h"																//Driver for interfacing ADC ic tlv1543
#include "tlv5616.h"																//Driver for interfacinf DAC ic tlv56516
#include "filters.h"																//Includes processing functions for filters


void main(void)
{
	unsigned int adc_data=0,dac_data=0;
	unsigned int i = 0;

	spi_init();																				//AT89C5131A SPI initialization
	adc_init();																				//ADC IC (Here tlv1543) initialization
	dac_init();																				//DAC IC (Here tlv5616) initialization
  
	//lcd_init();																			//LCD initialization
	
	//Q1: Interface DAC and fill following while loop to generate Ramp waveform mantioned in a handout.
			
	//	while(1)
	//		{
				
				
			//	dac(adc());
				//dac(0x07ff);																//Send 16 bit word to DAC IC, Here output voltage 1.65 V 			
			
				
				//RAMP_WAVEFORM
				//i = 0;
				
			//	while(i < 4096){
				//	i = i+1;
					//dac(i);
					//msdelay(1);
					//msdelay(4);
					//msdelay(4);
					//msdelay(2);
					//}
				
			//	while(i>0){
			//	i = i-1;
				//dac(i);
		//	msdelay(1);
					//msdelay(4);
				//	msdelay(4);
				//	msdelay(2);
				//}	
				
			//}
		
	//Comment above while loop for Q2--------------------------------
	
	//Q2 : ADC and DAC  Q3: Moving average filter. (Uncomment following while loop for activating moving average filter program )
	
	while(1)
	{
	 	adc_data=adc(0);																	//Recieve sampled data from ADC IC
		
		dac_data= adc_data<<2;													//Approximating 10 bit ADC value to 12 bit value for dac
		
	dac_data = moving_avg(dac_data);								//Moving avg filter
		dac(dac_data);																	//Send 16 bit word to DAC IC
		//dac(0x0fff);
	}

}

