#define    true      1
#define    false     0

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
     INTCON.T0IE = 1;         //habilitando a interrupção o timer 0.
     INTCON.GIE = 1;         //habilitando a interrupção global.

     PORTC.F0 = 1;
     //PORTB = &conta;

     while(true)
     {
         //fica parado
      }



}
