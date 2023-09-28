/*
 * Nome do projeto:
     Conversor AD
 * Revis�o:
       - initial release;
       - 10-11-2010 - modified by Prof� Eng� Jos� Roberto;
 * Descri��o:
     Este � um programa de teste para testar o uso do conversor AD.
 * Configura��o:
     MCU:             PIC16F877A
     Oscillator:      XT, 4.0000 MHz
     Ext. Modules:    -
     SW:              mikroC PRO for PIC
*/
unsigned int temp_res;

void main()
{
  TRISA  = 0xFF;              // PORTA is input
  TRISC  = 0;                 // PORTC is output
  TRISB  = 0;                 // PORTB is output

  do 
  {
    // Salva em "temp_res" o resultado (10 bits) da convers�o AD realizada
    temp_res = ADC_Read(0);
    
    PORTB = temp_res;         // Send lower 8 bits to PORTB
    PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
  } while(1);

}