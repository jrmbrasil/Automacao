#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/interrupt_timer0/jnterrupt_timer0.c"



char conta;

void interrupt()
{
 intcon.GIE = 0;


 if (intcon.TMR0IF)
 {
 PORTC.F0 = ~PORTC.F0;
 intcon.TMR0IF = 0;
 }

 intcon.GIE = 1;
}

void main(void)
{
 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x80;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1= 0x07;
 OPTION_REG=0x83;
 INTCON.T0IE = 1;
 INTCON.GIE = 1;

 PORTC.F0 = 1;


 while( 1 )
 {

 }



}
