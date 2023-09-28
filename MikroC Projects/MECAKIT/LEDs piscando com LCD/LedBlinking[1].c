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

char txt1[] = "LEDS ON";
char txt2[] = "LEDS OFF";

void main()
{

  ADCON1=0B00001110;    // AN0 habilitado (somente)
  TRISA = 0;           // RB0: entrada analógica (ADCON1)- RB1 a RB5: saída digital
  TRISB = 0;           // set direction to be output
  TRISC = 0;           // set direction to be output
  TRISD = 0;           // set direction to be output
  TRISE = 0;           // set direction to be output

  Lcd_Init();                        // Initialize LCD


  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off


  do
  {
    PORTD=0XFF;
    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Out(1,1,txt1);                 // Write text in first row
    Delay_ms(1000);                    // 1 second delay

    PORTD=0;
    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Out(2,1,txt2);                 // Write text in first row
    Delay_ms(1000);    // 1 second delay
  }
  while(1);          // Endless loop
}