#line 1 "C:/Users/Jose Roberto/Documents/MikroC Projects/LCD2-MKC/LCD2-MKC.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


char txt1[] = "Microcontrolador";
char txt2[] = "PIC16F877A";
char txt3[] = "Lcd4bit";
char txt4[] = "exemplo";

char i;

void main()
{

 Lcd_Init();
 Delay_ms(1000);

 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,txt3);
 Delay_ms(4000);
 Lcd_Out(2,6,txt4);
 Delay_ms(4000);
 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(1000);

 Lcd_Out(1,1,txt1);
 Delay_ms(4000);
 Lcd_Out(2,5,txt2);

 Delay_ms(4000);


 for(i=0; i<4; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(1000);
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(1000);
 }

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(1000);
 }
 }
}
