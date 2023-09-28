#line 1 "C:/Users/José Roberto/Documents/MikroC Projects/MECAKIT/LCD-Contador/MyProject.c"

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



char txt1[] = "UP:";
char txt2[] = "DOWN:";
char valor1[10];
char valor2[10];
char temp[10];
int contador1;
int contador2;
int i;
int tam;
int i2;


void main()
{
 ADCON1=0b00001110;

 TRISD=0;
 PORTD=1;
 Delay_ms(200);
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 contador2=256;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt1);

 Lcd_Out(2,1,txt2);

 for(contador1=0; contador1<256; contador1++)
 {
 IntToStr(contador1,valor1);
 Ltrim(valor1);
 Lcd_Out(1,7,valor1);

 Delay_ms(200);
 contador2--;
 IntToStr(contador2,valor2);
 Ltrim(valor2);
 if(contador2==99 || contador2==9)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt1);

 Lcd_Out(2,1,txt2);

 }
 Lcd_Out(2,7,valor2);

 Delay_ms(200);

 PORTD=PORTD<<1;
 if(PORTD==0)
 {
 PORTD=1;
 }

 }
 }
}
