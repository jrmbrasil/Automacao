#ifndef	_LCD_H
#define _LCD_H
	
//rotina para mikroC - lcd 1602
//com endereço linha 0 - 0x80 e linha 1 - 0xC0
#define		razao       Get_Fosc_kHz()/4000L

////Este include foi feito para trabalhar com lcd 16 colunas por 2 linhas (por exemplo PC-1602F).
////Antes de usar esta biblioteca vewrifique se o seu LCD é compativel :
////  --pinagem,  --endereço inicial das linhas  linha-0  (0x80)   e linha-1 (0xC0)

////Para utilizar as funções abaixo você deverá definir os PORTS que serão utilizados, exemplo:
		//#define		lcd_port	    PORTD_ADDR
		//#define		lcd_control		PORTE_ADDR
		
		

////Só após as definições dê o include lcd.h, verificando que o delay.h tenha sido já utilizado!
////
////Se o compilador for hi-tech serão usadas as definições abaixo:



	#define			PORTA_ADDR			0x05
	#define			PORTB_ADDR			0x06
	#define			PORTC_ADDR			0x07
	#define			PORTD_ADDR			0x08
	#define			PORTE_ADDR			0x09
	
	
	#define		lcd_port      PORTD_ADDR
	#define		lcd_control   PORTE_ADDR

	

	//#define		lcd_config(a, b)   do{lcd_port = a; lcd_control =b;		}while(0)


	#define		lcd_lin_0		0x80
	#define		lcd_lin_1		0xC0
	//unsigned char unidade, dezena, centena, milhar, dezena_milhar;
	//void float2asc (float, char );
	//char  ftoasc ( char * , float , char );
	void lcd_gen_setup();
	void lcd_gen_init();
	void lcd_gen_send_nibble(unsigned char );
	void lcd_gen_send_command(unsigned char);
	void lcd_gen_send_data(unsigned char);
	void lcd_gen_send_string(unsigned char *);
	void lcd_gen_pos_xy(unsigned char, unsigned char);
	//unsigned char itoa(int );
	//unsigned char itoa_aux(int );

	#if (lcd_port==0x06 && lcd_control==0x06)
		#define		lcd_d4	PORTB.F4
		#define		lcd_d5	PORTB.F5
		#define		lcd_d6	PORTB.F6
		#define		lcd_d7	PORTB.F7
		#define		RS		PORTB.F0
		#define		EN		PORTB.F1
	#endif
	
	
	#if (lcd_port==0x06 && lcd_control==0x09)
		#define		lcd_d4	PORTB.F4
		#define		lcd_d5	PORTB.F5
		#define		lcd_d6	PORTB.F6
		#define		lcd_d7	PORTB.F7
		#define		RS		PORTE.F0
		#define		EN		PORTE.F1
		//#define		RW		RE2   //usando apenas para leitura
								  //comente a linha acima
	#endif	

	#if (lcd_port==0x07 && lcd_control==0x09)
		#define		lcd_d4	PORTC.F4
		#define		lcd_d5	PORTC.F5
		#define		lcd_d6	PORTC.F6
		#define		lcd_d7	PORTC.F7
		#define		RS		PORTE.F0
		#define		EN		PORTE.F1
		//#define		RW		RE2   //usando apenas para leitura
								  //comente a linha acima
	#endif	

	#if (lcd_port==0x08 && lcd_control==0x09)
		#define		lcd_d4	PORTD.F4
		#define		lcd_d5	PORTD.F5
		#define		lcd_d6	PORTD.F6
		#define		lcd_d7	PORTD.F7
		#define		RS		PORTE.F0
		#define		EN		PORTE.F1
		//#define		RW		RE2   //usando apenas para leitura
								  //comente a linha acima
	#endif

	void  lcd_gen_setup()
	{	
		if(lcd_port==0x06 && lcd_control==0x06)	{
				TRISB = TRISB & 0x0C; 
				}
	
		if(lcd_port==0x06 && lcd_control==0x09)	{
				TRISB = TRISB & 0x0F; 
				TRISE = TRISE & 0x04;
				}
		if(lcd_port==0x07 && lcd_control==0x09)	{
				TRISC = TRISC & 0x0F; 
				TRISE = TRISE & 0x04;
				}
		if(lcd_port==0x08 && lcd_control==0x09)	{
				TRISD = TRISD & 0x0F; 
				TRISE = TRISE & 0x04;
				}
	}


	void lcd_gen_send_nibble(unsigned char dado)
	{
		unsigned char c;
		lcd_d4 =0;
		lcd_d5 =0;
		lcd_d6 =0;
		lcd_d7 =0;
			
		if ((dado & 0x01) >> 0) {lcd_d4 =1;}
		if ((dado & 0x02) >> 1) {lcd_d5 =1;}
		if ((dado & 0x04) >> 2) {lcd_d6 =1;}
		if ((dado & 0x08) >> 3) {lcd_d7 =1;}
		
		EN = 1;
		for(c=0; c<=razao;c++) {
			asm	{
					nop
					nop
					nop
				}
			
		}
		EN = 0;
	}

	void lcd_gen_send_command(unsigned char command)
	{
		RS = 0;
		lcd_gen_send_nibble(command>>4);
		lcd_gen_send_nibble(command & 0x0F);

	}

	void lcd_gen_send_data(unsigned char valor)
	{
		RS = 1;
		lcd_gen_send_nibble(valor>>4);
		lcd_gen_send_nibble(valor & 0x0F);

	}

	void lcd_gen_init( )
	{
		int c;

		delay_ms(40);
		RS = 0;
		lcd_gen_send_nibble(0x03);
		delay_ms(5);
		lcd_gen_send_nibble(0x03);
		//delay_ms (5);
		lcd_gen_send_nibble(0x03);
		//delay_ms (5);
		lcd_gen_send_nibble(0x02);
		for(c=0; c<45;c++); // aproximadamente 100us, para 4Mhz coloque 8
								//para 20Mhz coloque 45
		lcd_gen_send_command(0x28);
		for(c=0; c<45;c++);
		lcd_gen_send_command(0x01);
		delay_ms(2);
		lcd_gen_send_command(0x0C);
		for(c=0; c<45;c++);
		lcd_gen_send_command(0x06);
		for(c=0; c<45;c++);

		RS =1;   //aceita dados
	}

	void lcd_gen_send_string(unsigned char *a)
	{
		int p=0;
		unsigned char b;
		b = a[p];
		while(b!=0x00)
		{
			b=a[p];
			if(b!=0x00)
				{	
					p++;
				}
		}
			
		if (p>0)
			{
				p=0;
				b = a[p];
				while(b!=0x00)
					{
						b=a[p];
						if(b!=0x00)
						{
							lcd_gen_send_data(a[p]);
							p++;
						}
					}
			
			}
			
	}


	void	lcd_gen_pos_xy(unsigned char x, unsigned char y)  //x coluna;  y linha
	{
		unsigned char address;
		if(y!=0)
			address = lcd_lin_1;
		else
			address = lcd_lin_0;
		address += x;
		lcd_gen_send_command(0x80 | address);
	}
	
	/*
	

	unsigned char itoa(int valor1)
	{
		unidade=0;dezena=0; centena=0; milhar=0; dezena_milhar=0;
		
		if (valor1>0){
			while (valor1>0){
				valor1--;
				if(unidade < 9) unidade++;
				else
					if(unidade==9) {unidade = 0x00;\
						if(dezena<9) dezena++;
						else
							if(dezena==9) {dezena = 0;\
								if(centena<9) centena++;
								else
									if(centena==9) {centena=0;\
									 if(milhar<9) milhar++;
									 else
										 if(milhar==9) {milhar=0;\
										  if(dezena_milhar<9) dezena_milhar++;
										  else
											  if(dezena_milhar==9) dezena_milhar=0;
											  
										}
									}	
								}		
						}				
										
				}						
			}
		if(dezena_milhar!=0) lcd_send_data(dezena_milhar + 0x30);
		if((milhar!=0)||(dezena_milhar!=0)) lcd_send_data(milhar + 0x30);
		if((centena!=0)||(milhar!=0)||(dezena_milhar!=0)) lcd_send_data(centena + 0x30);
		if((dezena!=0)||(centena!=0)||(milhar!=0)||(dezena_milhar!=0)) lcd_send_data(dezena + 0x30);
		lcd_send_data(unidade + 0x30);
		
		
		return(0);
	}  

	
	unsigned char itoa_aux(int valor1)
	{
		unidade=0;dezena=0; centena=0; milhar=0; dezena_milhar=0;
		
		if (valor1>0){
			while (valor1>0){
				valor1--;
				if(unidade < 9) unidade++;
				else
					if(unidade==9) {unidade = 0x00;\
						if(dezena<9) dezena++;
						else
							if(dezena==9) {dezena = 0;\
								if(centena<9) centena++;
								else
									if(centena==9) {centena=0;\
									 if(milhar<9) milhar++;
									 else
										 if(milhar==9) {milhar=0;\
										  if(dezena_milhar<9) dezena_milhar++;
										  else
											  if(dezena_milhar==9) dezena_milhar=0;
											  
										}
									}	
								}		
						}				
										
				}						
			}
		
		return(0);
	}
	
		
	void float2asc (float  value, char precision)
	{
		
		unsigned char unidade_number=0, dezena_number=0, centena_number=0, milhar_number=0, dezena_milhar_number=0;
		unsigned char unidade_frac=0, dezena_frac=0, centena_frac=0, milhar_frac=0, dezena_milhar_frac=0;
		
		float value1;
		unsigned int number, frac, mul;
		number =0; frac =0; mul = 0;
		number = (unsigned int)(value);
		if(precision==0) mul = 0;
		if(precision==1) mul = 10;
		if(precision==2) mul = 100;
		if(precision==3) mul = 1000;
		if(precision==4) mul = 10000;
		value1=(value - number)*mul;
		frac = (int) (value1);
		itoa_aux(number);
		if(dezena_milhar!=0) dezena_milhar_number = dezena_milhar + 0x30;
		if((milhar!=0)||(dezena_milhar!=0)) milhar_number = milhar + 0x30;
		if((centena!=0)||(milhar!=0)||(dezena_milhar!=0)) centena_number = centena + 0x30;
		if((dezena!=0)||(centena!=0)||(milhar!=0)||(dezena_milhar!=0)) dezena_number = dezena + 0x30;
		unidade_number = unidade + 0x30;
		
		if(dezena_milhar_number>0) lcd_send_data(dezena_milhar_number);
		if(milhar_number>0) lcd_send_data(milhar_number);
		if(centena_number>0) lcd_send_data(centena_number);
		if(dezena_number>0) lcd_send_data(dezena_number);
		lcd_send_data(unidade_number);
		lcd_send_data('.');
		 
			
		itoa_aux(frac);
		if(dezena_milhar!=0) dezena_milhar_frac = dezena_milhar + 0x30;
		if((milhar!=0)||(dezena_milhar!=0)) milhar_frac = milhar + 0x30;
		if((centena!=0)||(milhar!=0)||(dezena_milhar!=0)) centena_frac = centena + 0x30;
		if((dezena!=0)||(centena!=0)||(milhar!=0)||(dezena_milhar!=0)) dezena_frac = dezena  + 0x30;
		unidade_frac = unidade + 0x30;
		
		
		if(dezena_milhar_frac>0) lcd_send_data(dezena_milhar_frac);
		if(milhar_frac>0) lcd_send_data(milhar_frac);
		if(centena_frac>0) lcd_send_data(centena_frac);
		if(dezena_frac>0) lcd_send_data(dezena_frac);
		lcd_send_data(unidade_frac);
			
	}

	void	lcd_send_float(float value2, char precision2)
	{
					
		float2asc(value2, precision2);
	
	}

*/	
/*
float	 round_value (float val)
{
	long longval = (long) (val);
	if (fabs(val - longval)>=0.5) return ceil (val);
	else return floor(val);
	long longval;
	longval = (long)(val + 0.5);
}

*/

 /*
char  ftoasc ( char * valor_string, float value, char precision)
{
	float value1;
	char v=0, n=0, f=0;
	unsigned int number = 0, frac = 0, mul = 0;
	char number_string[5],  frac_string[5];
	//char  ponto_string[2] = ".";
	number = (unsigned int) (value);
	if (precision == 0)  mul = 0;
	if (precision == 1)  mul = 10;
	if (precision == 2)  mul = 100;
	if (precision == 3)  mul = 1000;
	if (precision == 4)  mul = 10000;
	value1=round_value((value - number)*mul);
	frac = (unsigned int) (value1);
	//itoa (number_string,  number, 10);  //modelo hitech mudar p/ mikroC
	//itoa (frac_string, frac,  10);		//modelo hitech mudar para mikroC
	//strcpy(valor_string, number_string);
	//strcat(valor_string,ponto_string);
	//strcat(valor_string, frac_string);
	while (number_string[n]!=0)
		{
			valor_string[v] = number_string[n];
			v++;
			n++;
		}
	valor_string[v] = '.';
	v++;
	while (frac_string[f]!=0)
		{
			valor_string[v] = frac_string[f];
			v++;
			f++;
		}
	
	
	return valor_string;
}	
*/
#endif
