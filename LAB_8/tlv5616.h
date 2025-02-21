//This is header file for 12 bit spi dac tlv5616 ic 

//include spi.h for using fns from it. Preprocessor directives are used for guarding against multiple inclusion of header files, read compliler user guide for more information

#ifndef spi_h																			//if identifier spi_h is not defined then goto next line
	#include "spi.h"																//Include spi driver file, Driver for uC 8051 spi module
#endif																						//end if directive

//Declaration of functions which are contained in this header file

void dac_init(void);															//Initilize dac slave ic tlv5616
void dac(unsigned int);														//take 16 bit word and send it to spi slave, here tlv5616

//Signals to dac ic tlv5616

sbit cs_bar_dac = P1^2 ;													//Chip select of dac ic
sbit fs=P1^3;																			//frame sync signal for tlv5616

//Function defination

void dac_init(void)
{
		cs_bar_dac=1;																	//spi dac ic tlv5616 is disabled
		fs= 1;																				// frame sync is initialise to one
}

void dac(unsigned int temp_dac_data)
{
	SPCON = 0X77;
							//Configure here uC SFRs which are specific to tlv5616
		//unsigned int a = 0;
			
	
		//-----------------------------------------
	
						cs_bar_dac = 0;														//Enable slave DAC IC
						fs = 0;														//Activate frame sync signal
	
			temp_dac_data = spi_trx_16_bit(temp_dac_data);														//Call funcation to transmit and receive 16 bits from spi module 
	
										fs =1				;						//Deactivate frame sync
									cs_bar_dac = 1	;										//Disable slave DAC IC
	
	return;		
}
