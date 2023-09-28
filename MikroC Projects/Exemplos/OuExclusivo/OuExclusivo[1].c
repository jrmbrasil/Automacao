  #define  true   1
  #define  false  0

void main ()
{
  TRISA = 0b00000011;
  TRISB = 0x00;
  TRISC = 0x00;
  TRISD = 0x00;
  TRISE = 0x00;
  ADCON1 = 0x07;
  
  while(true)
  {
     if ((PORTA.F0&&!PORTA.F1)||(!PORTA.F0&&PORTA.F1)) PORTB.F0=1;
     else PORTB.F0=0;
  
  
  }


}