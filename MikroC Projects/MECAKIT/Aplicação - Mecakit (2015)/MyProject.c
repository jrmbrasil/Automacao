//Elaborado por Profº Engº José Roberto - v1_2015
//-----------------------------------------------

char uart_rd;

void main()
{
  ADCON1=0x0E; //AN0 habilitado
  TRISA=0x01; //RA0: entrada (AN0)
  TRISA=1;
  TRISB=0xFF;
  TRISE=0;
  TRISD=0;
  PORTD=0;
  NOT_RBPU_bit=0;
  
  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  while(1)                      // Endless loop
  {  
    if (UART1_Data_Ready())      // If data is received,
    {
      uart_rd = UART1_Read();     // read the received data,
      switch(uart_rd)
      {
        case '1': if(!RD0_bit)
                  RD0_bit=1;
		  else
		  RD0_bit=0;
                  break;
        case '2': if(!RD1_bit)
                  RD1_bit=1;
		  else
		  RD1_bit=0;
                  break;
        case '3': if(!RD2_bit)
                  RD2_bit=1;
		  else
		  RD2_bit=0;
                  break;
        case '4': if(!RD3_bit)
                  RD3_bit=1;
		  else
		  RD3_bit=0;
                  break;
        case '5': if(!RD4_bit)
                  RD4_bit=1;
		  else
		  RD4_bit=0;
                  break;
        case '6': if(!RD5_bit)
                  RD5_bit=1;
		  else
		  RD5_bit=0;
                  break;
        case '7': if(!RD6_bit)
                  RD6_bit=1;
		  else
		  RD6_bit=0;
                  break;
        case '8': if(!RD7_bit)
                  RD7_bit=1;
		  else
		  RD7_bit=0;
                  break;
        default: PORTD=0;
      }

    }
    if(!RB0_bit)
    {
      UART1_Write('1');
      while(!RB0_bit);
      UART1_Write('1');
    }
    if(!RB1_bit)
    {
      UART1_Write('2');
      while(!RB1_bit);
      UART1_Write('2');
    }
    if(!RB2_bit)
    {
      UART1_Write('3');
      while(!RB2_bit);
      UART1_Write('3');
    }
    if(!RB3_bit)
    {
      UART1_Write('4');
      while(!RB3_bit);
      UART1_Write('4');
    }
    if(!RB4_bit)
    {
      UART1_Write('5');
      while(!RB4_bit);
      UART1_Write('5');
    }
    if(!RB5_bit)
    {
      UART1_Write('6');
      while(!RB5_bit);
      UART1_Write('6');
    }
      
  }
}