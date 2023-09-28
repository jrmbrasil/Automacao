#line 1 "C:/temp/microcontroladorPOS/c/mikroC/serial/serial.c"
#line 12 "C:/temp/microcontroladorPOS/c/mikroC/serial/serial.c"
void main(void)
{
 char recebe;
 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x80;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1= 0x07;

 usart_init(9600);

 while( 1 )
 {
 if(usart_data_ready())
 {
 recebe = usart_read();
 usart_write(recebe);
 }
 }
}
