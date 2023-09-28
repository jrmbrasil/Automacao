#line 1 "F:/DADOS_/PROJETOS/PIC.DOUGLINO/FIRMWARE/TESTE-PLACA-LCD-PORTAE/LCD.c"







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
#line 41 "F:/DADOS_/PROJETOS/PIC.DOUGLINO/FIRMWARE/TESTE-PLACA-LCD-PORTAE/LCD.c"
char string1[] = "MCCO :-)";
void main(void)
{
 int numero = 0;
 char txt[7];
 char i=0;
 TRISA=0x3F;
 TRISB=0xFF;
 TRISC=0X00;
 TRISD=0x00;


 ADCON1 = 0B00001110;
 NOT_RBPU_bit = 0;



 while(1)
 {

 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);
 lcd_cmd(_LCD_FIRST_ROW);
 delay_ms(2);

 lcd_out(1,2,"SENAI *2015*");
 lcd_out(2,9,string1);
#line 74 "F:/DADOS_/PROJETOS/PIC.DOUGLINO/FIRMWARE/TESTE-PLACA-LCD-PORTAE/LCD.c"
 PORTD = 0X80;
 for(i=1;i<8;i++){
 PORTD=PORTD>>1;
 Delay_ms(150);
 }
 for(i=1;i<8;i++){
 PORTD=PORTD<<1;
 Delay_ms(150);
 }
 for(i=1;i<8;i++){
 PORTD=PORTD>>1;
 Delay_ms(150);
 }
 for(i=1;i<8;i++){
 PORTD=PORTD<<1;
 Delay_ms(150);
 }
 PORTD=0XFF;
 for(i=1;i<30;i++){
 PORTD=~PORTD;
 Delay_ms(100);
 }
 for(i=1;i<14;i++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(100);
 }
 for(i=1;i<21;i++){
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(100);
 }
 for(i=1;i<21;i++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(100);
 }
 for(i=1;i<20;i++){
 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(100);
 lcd_out(1,2,"TESTE OS BOTOES AGORA!!!");
 Delay_ms(100);
 }


 TRISD=0x00;
 PORTD=0x00;
 while(1)
 {
 if(! RB5_bit ) RD0_bit =1;
 if( RB5_bit ) RD0_bit =0;
 if(! RB4_bit ) RD1_bit =1;
 if( RB4_bit ) RD1_bit =0;
 if(! RB3_bit ) RD2_bit =1;
 if( RB3_bit ) RD2_bit =0;
 if(! RB2_bit ) RD3_bit =1;
 if( RB2_bit ) RD3_bit =0;
 if(! RB1_bit ) RD4_bit =1;
 if( RB1_bit ) RD4_bit =0;
 if(! RB0_bit ) RD5_bit =1;
 if( RB0_bit ) RD5_bit =0;
 if(! RB5_bit  && ! RB0_bit )break;
 }
 }
}
