// microcontroller : P16F877A
// PWM module is set on RC2.

unsigned short j, oj;
char txt1[13];
char *text ="Valor de PW:";

void InitMain() {

  TRISB = 0;              // PORTB is output

    //------------display------------
   TRISB = 0;                // PORTB is output
   Lcd_Init(&PORTB);         // Initialize LCD connected to PORTB
   Lcd_Cmd(Lcd_CLEAR);       // Clear display
   Lcd_Cmd(Lcd_CURSOR_OFF);  // Turn cursor off
   Lcd_Out(1, 1, text);      // Print text to LCD, 2nd row, 1st column
 //-----------------------------------

  ADCON1 = 6;             // All ADC pins to digital I/O
//  PORTA = 255;         //apenas para simulaco!!!!!!!!!
  TRISA = 3;            // PORTA is input

  //PORTC = 0xFF;           // Set PORTC to $FF
  portc = 0;
  TRISC = 0;              // PORTC is output
  Pwm1_Init(2000);         // Initialize PWM module p/ 2KHz
  pwm2_init(2000);
  pwm2_start();
  pwm2_change_duty(150);
}//~

void main()
{
  InitMain();
  j   = 20;               // Initial value for j  (0<=j<=255)
  oj  = 0;                // oj will keep the 'old j' value
  Pwm1_Start();            // Start PWM
  
    IntToStr(j, txt1);
    Lcd_Out(2, 1, txt1);
  

   do
  {
    if (PORTA.F0)
    {
       Delay_ms(10);
       if(PORTA.F0)
       {
              if( j <= 220 )
              {
                 j=j+10 ;
                 IntToStr(j, txt1);
                 Lcd_Out(2, 1, txt1);
              }
        }
        do
        {
           do
           {
           }while(PORTA.F0);
          Delay_ms(10);
        }while(PORTA.F0);
    }
    if (PORTA.F1)
    {
       Delay_ms(10);
       if(PORTA.F1)
       {
              if( j >= 30)
              {
                 j=j-10 ;
                 IntToStr(j, txt1);
                 Lcd_Out(2, 1, txt1);
              }
        }
        do
        {
           do
           {
           }while(PORTA.F1);
          Delay_ms(10);
        }while(PORTA.F1);
    }
    if (oj != j)
    {        // If change in duty cycle requested,
      Pwm1_Change_Duty(j); //   set new duty ratio,
      oj = j;             //   memorize it,
    }
  }  while (1);
}




