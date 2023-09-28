// Conex�es do m�dulo LCD
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
char txt1[] = "Microcontrolador";
char txt2[] = "PIC16F877A";
char txt3[] = "Lcd4bit";
char txt4[] = "exemplo";

char i;

void main() 
{

   Lcd_Init();                        // Inicializa o LCD
   Delay_ms(1000);

  Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
  Delay_ms(1000);
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor
  Lcd_Out(1,6,txt3);                 // Escreve texto na posi��o: linha=1,coluna=6
  Delay_ms(4000);
  Lcd_Out(2,6,txt4);                 // Escreve texto na posi��o: linha=2,coluna=6
  Delay_ms(4000);                    // Atraso de 2 segundos
  Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
  Delay_ms(1000);

  Lcd_Out(1,1,txt1);                 // Escreve texto na posi��o: linha=1,coluna=1
  Delay_ms(4000);
  Lcd_Out(2,5,txt2);                 // Escreve texto na posi��o: linha=2,coluna=5

  Delay_ms(4000);                    // Atraso de 2 segundos

  // Moving text
  for(i=0; i<4; i++) {               // Desloca o texto para a direita 4 vezes
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Delay_ms(1000);                   // Atraso de 0,5 segundo
  }

  while(1) {                         // Loop infinito
    for(i=0; i<8; i++) {             // Desloca o texto para a esquerda 7 vezes
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Delay_ms(1000);                 // Atraso de 0,5 segundo
    }

    for(i=0; i<8; i++) {             // Desloca o texto para a direita 7 vezes
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Delay_ms(1000);                 // Atraso de 0,5 segundo
    }
  }
}