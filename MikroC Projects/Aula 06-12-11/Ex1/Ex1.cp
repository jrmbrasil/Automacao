#line 1 "C:/Users/Jose Roberto/Documents/MikroC Projects/Aula 06-12-11/Ex1/Ex1.c"

sbit teste at portb.B0;
void main()
{
 adcon1=6;
 trisa=0b00111111;
 trisb=0b00000000;
 while(1)
 {
 portb=porta;
 }
}
