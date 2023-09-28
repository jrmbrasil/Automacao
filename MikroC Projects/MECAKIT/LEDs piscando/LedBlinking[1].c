void main()
{

  ADCON1=0B00001110;    // AN0 habilitado (somente)
  TRISA = 0;           // RB0: entrada analógica (ADCON1)- RB1 a RB5: saída digital
  TRISB = 0;           // set direction to be output
  TRISC = 0;           // set direction to be output
  TRISD = 0;           // set direction to be output
  TRISE = 0;           // set direction to be output

  do
  {
    PORTD=0XFF;
    Delay_ms(1000);    // 1 second delay

    PORTD=0;
    Delay_ms(1000);    // 1 second delay
  }
  while(1);          // Endless loop
}