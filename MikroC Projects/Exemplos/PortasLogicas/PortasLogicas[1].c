  //#include <stdlib.h>

  #define  true   1
  #define  false  0
  
  #define setbit(var, bitno)    ((var) |= 1UL << (bitno))
  #define clrbit(var, bitno)    ((var) &= ~(1UL << (bitno)))
  #define getbit(var, bitno)     ((var>>bitno) & 1UL)

  //#include "lcd.h"

  
  /*typedef struct {
  F0 : 0;
  F1 : 1;
  F2 : 2;
  F3 : 3;
  F4 : 4;
  F5 : 5;
  F6 : 6;
  F7 : 7;  } mybitfield;
  
  mybitfield flags;    */


void main ()
{
  char valor;
  char fr[12];
  float b ;//= 12.34;
  char buf[20];
  int  hour=10, minute=20, second=40;
  char flags;
  char porta_logica;
  TRISA = 0b00011111;
  TRISB = 0x00;
  TRISC = 0x00;
  TRISD = 0x00;
  TRISE = 0x00;
  ADCON1 = 0x07;
  FloatToStr(b, fr);
  setbit(valor,3);
  clrbit(valor,4);
  b = 12.34;
  //sprintf(buf, "%.2f", b);
  porta.f0 ^ porta.f1;
  porta.f0 & porta.f1;
  porta.f0 | porta.f1;
  
  
  Get_Fosc_kHz();
  
  //flags.F7= 1;
  setbit(flags,7);
  if(getbit(flags,6));
  


  while(true)
  {

      porta_logica = PORTA >> 2;
      switch (porta_logica)
      {
          //teste porta E
          case 1 :   if (PORTA.F0 && PORTA.F1) PORTB.F0 = 1;
                     else  PORTB.F0 = 0;
                     break;
                     
          //teste porta OU
          case 2 :   if (PORTA.F0 || PORTA.F1) PORTB.F0 = 1;
                     else  PORTB.F0 = 0;
                     break;
          
          //teste porta Ou Exclusivo
          case 3 :   if ((PORTA.F0&&!PORTA.F1)||(!PORTA.F0&&PORTA.F1)) PORTB.F0 = 1;
                     else  PORTB.F0 = 0;
                     break;
          
          //teste porta Não E
          case 4 :   if (PORTA.F0 && PORTA.F1) PORTB.F0 = 0;
                     else  PORTB.F0 = 1;
                     break;
                     
          default :
                     PORTB = 0xFF;
      
      }


  }


}