#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/portaE_11092010/portaE.c"




void main()
{
 TRISA = 0b00001111;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1 = 0x07;

 PORTB = 0;


 while ( 1 )
 {
 if(PORTA.F0 && PORTA.F1) PORTB.F1 = 1;
 else PORTB.F1 = 0;
 }



}
