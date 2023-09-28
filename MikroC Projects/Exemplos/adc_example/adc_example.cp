#line 1 "C:/temp/microcontroladorPOS/c/mikroC/adc_example/adc_example.c"








void main ()
{
 int valor_adc;
 char b[6];
 char i;


 TRISA = 0x01;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADRESH = 0x00;
 ADRESL = 0x00;

 adcon0 = 0b10000001;
 adcon1 = 0b11001110;

 for ( i=0; i<=5; i++)
 {
 b[i]=0x00;
 }


 lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);
 lcd_custom_cmd(0x0C);

 lcd_custom_cmd(0x01);
 delay_ms(2);
 while(1)
 {
 valor_adc = adc_read(0);

 IntToStr(valor_adc, b);

 lcd_custom_out(2,2, b );

 }
}
