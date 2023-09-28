#line 1 "C:/temp/microcontroladorPOS/c/mikroC/PortasLogicas/PortasLogicas.c"
#line 26 "C:/temp/microcontroladorPOS/c/mikroC/PortasLogicas/PortasLogicas.c"
void main ()
{
 char valor;
 char fr[12];
 float b ;
 char buf[20];
 int hour=10, minute=20, second=40;
 char flags;
 char porta_logica;
 TRISA = 0b00011111;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1 = 0x07;
 FloatToStr(b, fr);
  ((valor) |= 1UL << (3)) ;
  ((valor) &= ~(1UL << (4))) ;
 b = 12.34;

 porta.f0 ^ porta.f1;
 porta.f0 & porta.f1;
 porta.f0 | porta.f1;


 Get_Fosc_kHz();


  ((flags) |= 1UL << (7)) ;
 if( ((flags>>6) & 1UL) );



 while( 1 )
 {

 porta_logica = PORTA >> 2;
 switch (porta_logica)
 {

 case 1 : if (PORTA.F0 && PORTA.F1) PORTB.F0 = 1;
 else PORTB.F0 = 0;
 break;


 case 2 : if (PORTA.F0 || PORTA.F1) PORTB.F0 = 1;
 else PORTB.F0 = 0;
 break;


 case 3 : if ((PORTA.F0&&!PORTA.F1)||(!PORTA.F0&&PORTA.F1)) PORTB.F0 = 1;
 else PORTB.F0 = 0;
 break;


 case 4 : if (PORTA.F0 && PORTA.F1) PORTB.F0 = 0;
 else PORTB.F0 = 1;
 break;

 default :
 PORTB = 0xFF;

 }


 }


}
