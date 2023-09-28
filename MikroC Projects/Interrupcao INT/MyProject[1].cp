#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Interrupcao/MyProject.c"
unsigned contador=0;

void interrupt()
{
 if (INTCON.INTF==1)
 {
 contador++;
 PORTC=contador;
 INTCON.INTF=0;
 }
}


void main()
{
 TRISB=0b00000001;
 PORTB=0;
 TRISC=0;
 PORTC=0;
 INTCON.INTE=1;
 OPTION_REG.INTEDG=1;
 INTCON.INTF=0;
 INTCON.GIE=1;

 while(1)
 {}
}
