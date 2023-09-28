//teste da serial  sem interrupção

#define    true      1
#define    false     0

#define setbit(var, bitno)    ((var) |= 1UL << (bitno))
#define clrbit(var, bitno)    ((var) &= ~(1UL << (bitno)))
#define getbit(var, bitno)    ((var>>bitno) & 1UL)



void main(void)
{
	   char recebe;
     TRISA = 0x00;
     TRISB = 0x00;
     TRISC = 0x80;
     TRISD = 0x00;
     TRISE = 0x00;
	   ADCON1= 0x07;		 //entradas digitais
          
     usart_init(9600);   //escolhendo o baudrate

     while(true)
     {
      if(usart_data_ready())
      {
        recebe = usart_read();
        usart_write(recebe);
      }
     }
}