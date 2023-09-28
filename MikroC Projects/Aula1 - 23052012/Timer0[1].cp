#line 1 "C:/Users/Jose Roberto/Documents/MikroC Projects/Aula1 - 23052012/Timer0.c"
unsigned cnt;

void interrupt()
{
 if (TMR0IF_bit == 1)
 {
 cnt++;
 TMR0IF_bit = 0;
 TMR0 = 0;
 }
}

void main()
{ INTCON.TMR0IF=0;
 OPTION_REG = 0x07;
 ADCON1 = 6;
 TRISB = 0;
 PORTB = 0x0F;
 TMR0 = 0;
 INTCON = 0xA0;
 cnt = 0;
 PORTB.B0=1;
 while(1)
 {
 if (cnt == 76)
 {
 PORTB = ~PORTB;
 cnt = 0;
 }
 }

}
