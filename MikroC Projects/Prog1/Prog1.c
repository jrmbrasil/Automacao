/*
 * Nome do projeto:
     Prog1 - LCD - 4 bits
 * Revisão:
     28-05-2010:
       - initial release;
       - 28-05-2010 - modified by Profº Engº José Roberto;
 * Descrição:
     Este é um programa de teste para comunicar o PIC com um módulo LCD,
     utilizando o PORTB para controle e envio de dados contidos no PORTC ao LCD
     (RB0 a RB3).
 * Configuração:
     MCU:             PIC16F877A
     Oscillator:      HS, 20.0000 MHz
     Ext. Modules:    -
     SW:              mikroC PRO for PIC

 * OBSERVAÇÃO:
     - Turn ON the PORT LEDs at SW9.
*/

  // Configura os pinos que serão conectados ao LCD
  sbit LCD_RS at RB4_bit;
  sbit LCD_EN at RB5_bit;
  sbit LCD_D7 at RB3_bit;
  sbit LCD_D6 at RB2_bit;
  sbit LCD_D5 at RB1_bit;
  sbit LCD_D4 at RB0_bit;

  // Configura os bits que controlarão a direção dos dados (LCD)
  sbit LCD_RS_Direction at TRISB4_bit;
  sbit LCD_EN_Direction at TRISB5_bit;
  sbit LCD_D7_Direction at TRISB3_bit;
  sbit LCD_D6_Direction at TRISB2_bit;
  sbit LCD_D5_Direction at TRISB1_bit;
  sbit LCD_D4_Direction at TRISB0_bit;
  
  char contador[9];

void main()
{
  TRISA = 0x00;          // set direction to be output
  TRISB = 0x00;          // set direction to be output
  TRISC = 0x00;          // set direction to be output
  TRISD = 0x00;          // set direction to be output
  //adcon1 = 0x07;       // para o caso de utilizar o PORTA como saída digital

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_TURN_ON);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display

//  Lcd_Out(1,6,txt3);                 // Write text in first row

//  Lcd_Out(2,6,txt4);                 // Write text in second row

  PORTC = 0x00;
  do 
  {
    ByteToStr(PORTC,contador);
    Lcd_Out(1,1,contador);
    Delay_ms(500);      // 0.5 second delay
    PORTC++;
  } 
  while(1);            // Endless loop
}