

#include <at89c5131.h>
#include "lcd.h"																	//Driver for interfacing lcd 
#include "tlv1543.h"																//Driver for interfacing ADC ic tlv1543
#include "tlv5616.h"																//Driver for interfacinf DAC ic tlv56516
#include "filters.h"																//Includes processing functions for filters



unsigned char num,n1,n2,n3;


void timer_ISR(void) interrupt 1
{
		
	  
		TF0 = 0 ;
	num = 1;
	
	
}	

void main(void)
{
	unsigned int adc_data=0,dac_data=0;
	unsigned int i = 0;

 signed char	dac_dat[]	= {0x0,0x18,0x30,0x46,0x5a,0x6a,0x75,0x7d,0x7f,0x7d,0x75,0x6a,0x5a,0x46,0x30,0x18,0x0,0xe7,0xcf,0xb9,0xa5,0x95,0x8a,0x82,0x80,0x82,0x8a,0x95,0xa5,0xb9,0xcf,0xe7};
 signed char k = 0x7F;
 signed char m;	
	 
	spi_init();																				//AT89C5131A SPI initialization
	adc_init();																				//ADC IC (Here tlv1543) initialization
	dac_init();																				//DAC IC (Here tlv5616) initialization
  
	//lcd_init();																			//LCD initialization
	
	//Ques1
			/*
		while(1)
			{
				
				
			//	dac(adc());
				//dac(0x07ff);																//Send 16 bit word to DAC IC, Here output voltage 1.65 V 			
			
				
				//RAMP_WAVEFORM
				i = 0;
				
				while(i < 4096){
					i = i+1;
					dac(i);
					msdelay(1);
				
					}
				
				while(i>0){
				i = i-1;
				dac(i);
			msdelay(1);
		
				}	
				
			}
		*/
	








//Q2 PARTB

/*

while(1){

	
			i = 0;


				
							
				while(i < 15){
					num = 0;
					i = i+1;
					m = dac_dat[i] + k;
					m = m;
					
					dac(m);
					

	
	TMOD = 0x21;
	TH0 = 0xFF;
	TL0 = 0xF0;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}    }
				
				
				
				while(i >0){
					num = 0;
					i = i-1;
					m = k - dac_dat[i] ;
					m = m;
				
					dac(m);
					TMOD = 0x21;
	TH0 = 0xFF;
	TL0 = 0xF0;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}  
				
				}
			}
		

*/		
		

/*


//Q2 PARTC 


while(1){

	
			i = 0;


				
							
				while(i < 15){
					num = 0;
					i = i+1;
					m = dac_dat[i] + k;
					m = m;
					
					dac(m);
					

	
	TMOD = 0x21;
	TH0 = 0xF5;
	TL0 = 0x00;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}    }
				
				
				
				while(i >0){
					num = 0;
					i = i-1;
					m = k - dac_dat[i] ;
					m = m;
					
					dac(m);
					TMOD = 0x21;
	TH0 = 0xF5;
	TL0 = 0x00;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}  
					
				}
			}

*/

//Ques  3 
while(1){
n1 = dac_dat[9] + k;
	
n2 = dac_dat[17] + k;
	
n3 = dac_dat[25] + k;

	i = 0;


				
							
				while(i < 15){
					num = 0;
					i = i+1;
					m = dac_dat[i] + k;
					m = m;
					if(i%3 == 0){
						m = m*n1;
						}
					
					if(i%3 == 1){
						m = m*n2;
						}
					
						if(i%3 == 2){
						m = m*n3;
						
						}
					
					dac(m);
					

	
	TMOD = 0x21;
	TH0 = 0xFF;
	TL0 = 0xF0;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}    }
				
				
				
				while(i >0){
					num = 0;
					i = i-1;
					m = k - dac_dat[i] ;
					m = m;
				if(i%3 == 0){
						m = m*n1;
						}
					
					if(i%3 == 1){
						m = m*n2;
						}
					
						if(i%3 == 2){
						m = m*n3;
					
						}
					dac(m);
					TMOD = 0x21;
	TH0 = 0xFF;
	TL0 = 0xF0;
	
	TR0 = 1;
	ET0 = 1;
				while(num<1){}  
				
				}
			}
		






}
