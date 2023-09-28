
void main()
{
     TRISA=0xFF;
     TRISB=0;
     ADCON1=0x06;        //Todos os bits do PORTA serão entradas digitais
     while(1) PORTB=PORTA;
}
