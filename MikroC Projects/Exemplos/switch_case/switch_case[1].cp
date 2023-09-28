#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/switch_case/switch_case.c"









void main() {
 char tipo_porta;
 TRISA = 0b00011111;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1 = 0x07;
 PORTB = 0x00;
 PORTC = 0x00;
 PORTD = &tipo_porta;
 PORTE = 0x00;


 while ( 1 )
 {

 tipo_porta = (PORTA>>2) & 0x07;
 switch (tipo_porta)
 {
 case  0x01 :
 PORTB.f0 = PORTA.f0 | PORTA.f1;
 break;

 case  0x02 :
 PORTB.f0 = PORTA.f0 & PORTA.f1;
 break;

 case  0x06 :
 PORTB.f0 = ~(PORTA.f0 | PORTA.f1);
 break;

 case  0x05 :
 PORTB.f0 = ~(PORTA.f0 & PORTA.f1);
 break;

 case  0x03 :
 PORTB.f0 = PORTA.f0 ^ PORTA.f1;
 break;

 default:
 ;
 }
 }
}
