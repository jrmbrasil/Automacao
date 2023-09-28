#line 1 "C:/Users/José Roberto/Documents/Mikro C Projects/LCD/Prog1.c"
#line 23 "C:/Users/José Roberto/Documents/Mikro C Projects/LCD/Prog1.c"
 sbit LCD_RS at RD2_bit;
 sbit LCD_EN at RD3_bit;


 char contador[9];

void main()
{
 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;










 PORTC = 0x00;
 do
 {
 ByteToStr(PORTC,contador);
 Lcd_Out(1,1,contador);
 Delay_ms(500);
 PORTC++;
 }
 while(1);
}
