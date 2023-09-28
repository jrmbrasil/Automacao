// Conexões do módulo LCD
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

// Mensagens a serem mostradas no LCD
char txt1[] = "Int:";
char txt2[] = "Float:";
char valor1[5];
char valor2[10];
int contador1;
float contador2;

void main()
{

   Lcd_Init();                        // Inicializa o LCD

  Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor

  //Lcd_Cmd(_LCD_CLEAR);               // Limpa o display

  Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
  Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1


  Delay_ms(500);                    // Atraso de 0,5 segundo
  contador2=65535;
  while(1)                          // Loop infinito
  {
    for(contador1=0; contador1<65536; contador1++) // Desloca o texto para a esquerda 7 vezes
    {  
       IntToStr(contador1,valor1);
       Lcd_Out(1,10,valor1);          // Escreve texto na posição: linha=1,coluna=10
       Delay_ms(300);               // Atraso de 0,2 segundo
       
       contador2/=2;
       FloatToStr(contador2,valor2);
       Lcd_Out(2,10,valor2);          // Escreve texto na posição: linha=1,coluna=10
       Delay_ms(300);               // Atraso de 0,2 segundo

       
    }
  }
}