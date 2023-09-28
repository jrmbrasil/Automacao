//*************************************************************
//***  ESTE EXEMPLO MOSTRA O ACIONAMENTO DO LCD COM 4 BITS  ***
//***  SENAI - PROF. DOUGLAS                                ***
//***  V= 0.0    17/5/2012                                  ***
//*************************************************************

// LCD module connections
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
//sbit RW at RE2_bit;
sbit LCD_D4 at RE0_bit;
sbit LCD_D5 at RA5_bit;
sbit LCD_D6 at RA3_bit;
sbit LCD_D7 at RA2_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
//sbit RW_Direction at TRISE2_bit;
sbit LCD_D4_Direction at TRISE0_bit;
sbit LCD_D5_Direction at TRISA5_bit;
sbit LCD_D6_Direction at TRISA3_bit;
sbit LCD_D7_Direction at TRISA2_bit;
// End LCD module connections

#define D6 RD0_bit
#define D7 RD1_bit
#define D8 RD2_bit   //NAO USA NO LCD
#define D9 RD3_bit   //NAO USA NO LCD
#define D10 RD4_bit
#define D11 RD5_bit
#define D12 RD6_bit
#define D13 RD7_bit

#define S1 RB5_bit
#define S2 RB4_bit
#define S3 RB3_bit
#define S4 RB2_bit
#define S5 RB1_bit
#define S6 RB0_bit

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
 // TRISE=0x00;
//  RW = 0;
  ADCON1 = 0B00001110;//HABILITA SÓ RA0 COMO ANAL
  NOT_RBPU_bit = 0;



  while(1)
  {
  //configurando o LCD
  lcd_init();
  lcd_cmd(_LCD_CURSOR_OFF);
  lcd_cmd(_LCD_CLEAR);
  lcd_cmd(_LCD_FIRST_ROW);
  delay_ms(2);          // aguardando tempo exigido pelo lcd 1602

    lcd_out(1,2,"SENAI *2015*");
    lcd_out(2,9,string1);
   // Delay_ms(500);//****
    /* IntToStr(numero,txt);
    Lcd_out(2,1,txt);
    numero++;
    delay_ms(50);*/
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
   //Lcd_Cmd(_LCD_TURN_OFF);
   
   TRISD=0x00;
   PORTD=0x00;
   while(1)
     {
     if(!S1)D6=1;
     if(S1)D6=0;
     if(!S2)D7=1;
     if(S2)D7=0;
     if(!S3)D8=1;
     if(S3)D8=0;
     if(!S4)D9=1;
     if(S4)D9=0;
     if(!S5)D10=1;
     if(S5)D10=0;
     if(!S6)D11=1;
     if(S6)D11=0;
     if(!S1 && !S6)break;
     }
  }
}