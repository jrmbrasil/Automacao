#line 1 "C:/Users/Jose Roberto/Documents/MikroC Projects/Prog1/Prog1.c"
#line 23 "C:/Users/Jose Roberto/Documents/MikroC Projects/Prog1/Prog1.c"
 sbit LCD_RS at RB4_bit;
 sbit LCD_EN at RB5_bit;
 sbit LCD_D7 at RB3_bit;
 sbit LCD_D6 at RB2_bit;
 sbit LCD_D5 at RB1_bit;
 sbit LCD_D4 at RB0_bit;


 sbit LCD_RS_Direction at TRISB4_bit;
 sbit LCD_EN_Direction at TRISB5_bit;
 sbit LCD_D7_Direction at TRISB3_bit;
 sbit LCD_D6_Direction at TRISB2_bit;
 sbit LCD_D5_Direction at TRISB1_bit;
 sbit LCD_D4_Direction at TRISB0_bit;

 char contador[9];

void main()
{
 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;


 Lcd_Init();
 Lcd_Cmd(_LCD_TURN_ON);
 Lcd_Cmd(_LCD_CLEAR);





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
