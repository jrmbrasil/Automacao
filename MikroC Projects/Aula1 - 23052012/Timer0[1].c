unsigned cnt;
set TMR0_FLAG at INTCON.B2

void interrupt()
{
  if (TMR0IF_bit == 1)
  {
    cnt++;                 // increment counter
    TMR0IF_bit = 0;        // clear TMR0IF
    TMR0   = 0;
  }
}

void main()
{
  INTCON.TMR0IF=0;
  OPTION_REG = 0x07;       // Assign prescaler to TMR0
  ADCON1 = 6;
  TRISB = 0;               // PORTB is output
  PORTB = 0x0F;            // Initialize PORTB
  TMR0  = 0;               // Timer0 initial value
  INTCON = 0xA0;           // Enable TMRO interrupt
  cnt = 0;                 // Initialize cnt
  PORTB.B0=1;
  while(1)
  {
    if (cnt == 76)
    {
      PORTB = ~PORTB;      // complemento de 1 do PORTB
      cnt = 0;             // Reset cnt
    }
  }

}