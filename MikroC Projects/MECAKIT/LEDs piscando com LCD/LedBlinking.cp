#line 1 "C:/Users/José Roberto/Documents/_Senai/_Aulas/Kits de Simulação/MECAKIT/PROFESSOR/_MikroC/LEDs piscando com LCD/LedBlinking.c"

sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RE0_bit;
sbit LCD_D5 at RA5_bit;
sbit LCD_D6 at RA3_bit;
sbit LCD_D7 at RA2_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISE0_bit;
sbit LCD_D5_Direction at TRISA5_bit;
sbit LCD_D6_Direction at TRISA3_bit;
sbit LCD_D7_Direction at TRISA2_bit;


char txt1[] = "LEDS ON";
char txt2[] = "LEDS OFF";

void main()
{

 ADCON1=0B00001110;
 TRISA = 0;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 Lcd_Init();


 Lcd_Cmd(_LCD_CURSOR_OFF);


 do
 {
 PORTD=0XFF;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt1);
 Delay_ms(1000);

 PORTD=0;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,txt2);
 Delay_ms(1000);
 }
 while(1);
}
