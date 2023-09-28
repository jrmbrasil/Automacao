//teste da serial com  interrupção

#define    true      1
#define    false     0

char recebe;

void interrupt()
{
     if (PIR1.RCIF)
      {
        //recebe = RCREG;
        recebe = usart_read();
        usart_write(recebe);
        //portd = 0xAA;
      }
}

void main(void)
{
     TRISA = 0x00;
     TRISB = 0x00;
     TRISC = 0x80;
     TRISD = 0x00;
     TRISE = 0x00;
	   ADCON1= 0x07;
     PIE1.RCIE = 1;      //habilitando a interrupção por recepção
     INTCON.PEIE = 1;	 //habilitando a interrupção para outros periféricos
     INTCON.GIE = 1;	 //habilitando a interrupção global.
     
     usart_init(9600);   //escolhendo o baudrate

     while(true)
     {
      }



}