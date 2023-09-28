#line 1 "C:/temp/microcontroladorPOS/c/mikroC/lcd_example/lcd_example.c"










void main ()
{
 int q = 123;
 char w1[4];

 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1= 0x07;
 q = q + 1;

 lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);

 lcd_custom_cmd(0x01);
 delay_ms(3);


 ByteToStr(q,w1);
 lcd_custom_out(2,2,w1);

 asm { goto $ }


}
