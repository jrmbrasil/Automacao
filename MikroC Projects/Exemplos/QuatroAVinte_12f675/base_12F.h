#ifndef	_BASE_12F_H
#define _BASE_12F_H

#define	 true	1
#define	 false  0

#define	 TRUE	1
#define	 FALSE  0


////set timer

void timer_0_setup(unsigned char);
void rtcc_0_setup(unsigned char);
void set_timer_1(unsigned long);
void timer_1_setup(unsigned char);	

void timer_0_setup(unsigned char c){
	OPTION_REG = 0x80;
	OPTION_REG |= c;
}
    
void rtcc_0_setup(unsigned char c){
	OPTION_REG = 0x80;
	OPTION_REG |= c;
}



////timer   
////Configuração do timer0, timer1(em andamento) e timer2.


	//configuração timer 0
	#define		RTCC_INTERNAL		0x00
	#define		RTCC_EXT_L_TO_H		0x20
	#define		RTCC_EXT_H_TO_L		0x30
	#define		RTCC_DIV_2			0x00
	#define		RTCC_DIV_4			0x01
	#define		RTCC_DIV_8			0x02
	#define		RTCC_DIV_16			0x03
	#define		RTCC_DIV_32			0x04
	#define		RTCC_DIV_64			0x05
	#define		RTCC_DIV_128		0x06
	#define		RTCC_DIV_256		0x07
	#define		RTCC_OFF			//apenas para pic18f
	#define		RTCC_8_BIT			//apenas para pic18f
	
	
	
	//#define		timer_0_setup(c)    do{OPTION_REG = 0x80; OPTION_REG |= c;}while(0) -> passado para o main como função
	//#define		rtcc_setup(c)	    do{OPTION_REG = 0x80; OPTION_REG |= c;}while(0) -> passado para o main como função
	

	
	#define		set_timer_0(c)		do{ TMR0 = c;}while(0)
	
	
	//configuração do timer 1
	#define		T1_DIV_1	0x00    // 1:1
	#define		T1_DIV_2	0x01	// 1:2	
	#define		T1_DIV_4	0x02	// 1:4
	#define		T1_DIV_8	0x03	// 1:8
	

	void set_timer_1(unsigned long c)	{  
								TMR1L = (unsigned char) (c);
								TMR1H = (unsigned char) (c>>8);
								}
							
								
	void	timer_1_setup(unsigned char pr)	
			{
				T1CON = 0x00;		
				T1CON = (pr << 4);		
			}
								
	
	void	timer_1_on()  {	T1CON.TMR1ON = 1;}

    void	timer_1_off()  {T1CON.TMR1ON = 0;}
	
	
	

					
	#define				NO_ANALOGS						0x00

	#define		adc_analogs(analogs) do{ ANSEL=0x00;  ANSEL|=analogs; CMCON = 0x07;}while(0)
	
					
					
#endif
