  // microcontroller : P16F877A
// PWM module is set on RC2.

unsigned short j, oj;

void InitMain() {
  PORTB = 0;              // Set PORTB to 0
  TRISB = 0;              // PORTB is output

  ADCON1 = 6;             // All ADC pins to digital I/O
  PORTA = 255;
  TRISA = 255;            // PORTA is input

  PORTC = 0xFF;           // Set PORTC to $FF
  TRISC = 0;              // PORTC is output
  Pwm_Init(5000);         // Initialize PWM module
}//~

void main() {
  InitMain();
  j   = 80;               // Initial value for j
  oj  = 0;                // oj will keep the 'old j' value
  Pwm_Start();            // Start PWM

  while (1) {             // Endless loop
    if (Button(&PORTA, 0,1,1))   // button on RA0 pressed
      j++ ;                      //    increment j
    if (Button(&PORTA, 1,1,1))   // button on RA1 pressed
      j-- ;                      //    decrement j

    if (oj != j) {        // If change in duty cycle requested,
      Pwm_Change_Duty(j); //   set new duty ratio,
      oj = j;             //   memorize it,
      PORTB = oj;         //   and display on PORTB
    }
    Delay_ms(200);        // Slow down a bit
  }
}