#define   true     1
#define   false    0
//#include <stdlib.h>
#include "lcd.h"
float asdf;
int mounth = 12;

char gen;

void interrupt()
{
     if(PIR1.RCIF) gen = Usart_Read();

}


void main()
{

     char gh[30];
     //char gen;
     float b, a;
     TRISA = 0b00000011;
     TRISB = 0x00;
     TRISC = 0x00;
     TRISD = 0x00;
     TRISE = 0x00;
     ADCON1= 0x07;
     Adc_Read(0);
     //GIE = 0;
     a = 22;
     b = 3;
     //PORTA.f0=1;
     asdf = a/b;
     lcd_gen_setup();
     lcd_gen_init();
     lcd_gen_send_command(0x01);   //
     delay_ms(2);
     lcd_gen_send_data(0x41);
     FloatToStr(asdf  ,gh);
     lcd_gen_send_string(gh);
     
     Usart_Init(9600);
     //if(Usart_Data_Ready()) gen = Usart_Read();
     Usart_Write(0x41);
     //sprintf(gh, "%d", );  //não funciona para pic16
     //FloatToStr(asdf  ,gh);
     //portd = gh[8];
     //portc = &portd;

     mounth = razao;
     asm {goto $};
     
     while(true)
     {
         if(porta.f0 ^ porta.f1)  portb.f0=1;
         else    portb.f0=0;
     
     }


}