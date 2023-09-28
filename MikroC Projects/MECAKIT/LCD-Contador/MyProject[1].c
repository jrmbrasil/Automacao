// LCD module connections
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
// End LCD module connections

// Mensagens a serem mostradas no LCD
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
  Delay_ms(200);               // Atraso de 0,2 segundo
  Lcd_Init();                        // Inicializa o LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor

  while(1)                          // Loop infinito
  {
    contador2=256;
    Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
    Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
    //Delay_ms(100);
    Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1
    //Delay_ms(100);                    // Atraso de 0,5 segundo
    for(contador1=0; contador1<256; contador1++) // Desloca o texto para a esquerda 7 vezes
    {
       IntToStr(contador1,valor1);
       Ltrim(valor1);
       Lcd_Out(1,7,valor1);          // Escreve texto na posição: linha=1,coluna=10
       //PORTD=contador1;
       Delay_ms(200);               // Atraso de 0,2 segundo
       contador2--;
       IntToStr(contador2,valor2);
       Ltrim(valor2);
       if(contador2==99 || contador2==9)
       {
          Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
          Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
          //Delay_ms(100);
          Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1
          //Delay_ms(100);                    // Atraso de 0,5 segundo
        }
       Lcd_Out(2,7,valor2);          // Escreve texto na posição: linha=1,coluna=10
       //PORTD=contador2;
       Delay_ms(200);               // Atraso de 0,2 segundo
       
       PORTD=PORTD<<1;
       if(PORTD==0)
       {
          PORTD=1;
       }
       //Delay_ms(50);               // Atraso de 0,2 segundo
    }
  }
}