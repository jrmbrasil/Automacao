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

char txt1[] = "Senai";
char txt2[] = "Mecakit";
char txt3[] = "Lcd4bit";
char txt4[] = "Teste";

char i;                              // Loop variable

void Move_Delay() {                  // Function used for text moving
  Delay_ms(500);                     // You can change the moving speed here
}

void main()
{
  ADCON1=0B00001110; //AN0 HABILITADO
  TRISA=1;
  TRISE=0;
  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,6,txt3);                 // Write text in first row

  Lcd_Out(2,6,txt4);                 // Write text in second row
  Delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display

  Lcd_Out(1,1,txt1);                 // Write text in first row
  Lcd_Out(2,5,txt2);                 // Write text in second row

  Delay_ms(2000);

  // Moving text
  for(i=0; i<4; i++) {               // Move text to the right 4 times
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                         // Endless loop
    for(i=0; i<8; i++) {             // Move text to the left 7 times
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<8; i++) {             // Move text to the right 7 times
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }
}