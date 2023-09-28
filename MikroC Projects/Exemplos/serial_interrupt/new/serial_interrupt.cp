#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/serial_interrupt/new/serial_interrupt.c"





char recebe;

void interrupt()
{
 if (PIR1.RCIF)
 {

 recebe = uart1_read();
 uart1_write(recebe);

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
 PIE1.RCIE = 1;
 INTCON.PEIE = 1;
 INTCON.GIE = 1;

 uart1_init(9600);

 while( 1 )
 {
 }



}
