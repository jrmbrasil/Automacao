// LCD module connections
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
// End LCD module connections

char txt1[]="Voltagem:";
char txt2[16];
char txt3;
unsigned temp_res;
float result;

void main()
{
     TRISA  = 0xFF;              // PORTA is input
     TRISC.B6=0;                 // PORTC is output
     TRISC.B7=1;                 // PORTC is entrada
     TRISB  = 0;                 // PORTB is output

     Lcd_Init();                        // Initialize LCD
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
     Lcd_Out(1,1,txt1);                 // Write text in first row
     
     UART1_Init(57600);
     Delay_ms(100);
     
     while(1)
     {
          temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
          result=(5.0/1024.0)*temp_res;
          FloatToStr(result, txt2);  // txt is "-374.2"

          txt3=strcat(txt2," Volts\0");
          Lcd_Out(2,1,txt3);                 // Write text in second row
          Delay_ms(1000);
          //txt2;
          UART1_Write_Text(txt3);
     }


}