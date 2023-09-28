#line 1 "C:/temp/teste/teste.c"






void avancasv1();
void retornasv1();


void main()
{



 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x80;
 TRISD = 0x00;
 TRISE = 0x00;


 ADCON1 = 0x07;


 PORTA = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;
 PORTE = 0x00;
#line 36 "C:/temp/teste/teste.c"
 PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1;

 while( 1 )
 {
 long i = 0;
 long j = 0;
 while(i < 50000)
 {
 PORTB.F0= 1;
 Delay_us(40);
 PORTB.F0= 0;
 Delay_us(27);
 i++;
 }
 while(j < 50000)
 {
 PORTB.F1= 1;
 Delay_us(40);
 PORTB.F1= 0;
 Delay_us(27);
 j++;
 }
 }
}


void avancasv1()
{
 long i = 0;
 while(i < 50000)
 {
 PORTB.F0= 1;
 Delay_us(40);
 PORTB.F0= 0;
 Delay_us(27);
 i++;
 }
}

void retornasv1()
{
 long j = 0;
 while(j < 50000)
 {
 PORTB.F1= 1;
 Delay_us(40);
 PORTB.F1= 0;
 Delay_us(27);
 j++;
 }
}
