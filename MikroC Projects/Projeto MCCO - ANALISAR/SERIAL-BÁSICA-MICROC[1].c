sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;
sbit RW at RE2_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit RW_Direction at TRISE2_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

char recebido;
int a;


void main()
 {
 TRISC = 0;
TRISE.RE2 = 0;
TRISC=0b10000000;
ADCON1 = 0b00000110;
RW = 0;
TRISD0_bit = 0;
TRISD1_bit = 0;
TRISD2_bit = 0;
TRISD3_bit = 0;
TRISA=0x3F;
UART1_Init(9600);
Delay_ms(100);
Lcd_init();
Lcd_cmd(0x0C);        //sem cursor piscante e deslocamento para direita
Lcd_cmd(0x01);        // limpeza do lcd  e posicionando linha 1, coluna 1.
delay_ms(2);          // aguardando tempo exigido pelo lcd 1602
Lcd_out(1,2,"MOTOR");
Lcd_out(2,2,"DESLIGADO!");
UART1_Write_Text("AGUARDANDO COMANDO A OU H");
PORTD.RD0 =0;
PORTD.RD1 =0;
PORTD.RD2 =0;
PORTD.RD3 =0;


while(1)
{
if(UART1_Data_ready () == 1)
{
recebido = UART1_Read();
if((recebido == 'D')||(recebido == 'd'))
{
Lcd_Cmd(_LCD_CLEAR);
PORTD.RD0 = 0;
PORTD.RD1 = 0;
PORTD.RD2 = 0;
PORTD.RD3 = 0;
PORTC.RC2 = 0;
PORTC.RC1 = 0;
Lcd_out(1,2,"MOTOR");
Lcd_out(2,2,"DESLIGADO");
UART1_Write_Text("\n\r");
}
if((recebido == 'H')||(recebido == 'h'))
{PORTC.RC2 = 1;
PORTC.RC1 = 0;
PORTD.RD2 = 1;
PORTD.RD1 = 0;
PORTD.RD0 = 0;
Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,2,"MOTOR SENTIDO");
Lcd_out(2,2,"HORARIO!");
UART1_Write_Text("\n\r");
          
          while(a<=20)
           {
           PORTD.RD3 = ~PORTD.RD3;
           PORTD.RD1 = ~PORTD.RD1;
           
           a++;
           Delay_ms(100);
           }
}
if((recebido == 'a') || (recebido == 'A'))
{
PORTC.RC1 = 1;
PORTC.RC2 = 0;
PORTC.RC1 = 0;
PORTD.RD1 = 1;
PORTD.RD0 = 1;
PORTD.RD2 = 0;
PORTD.RD3 = 0;
Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,2,"MOTOR SENTIDO");
Lcd_out(2,2,"ANTI-HORARIO!");
UART1_Write_Text("\n\r");
          while(a<=40)
           {
           PORTD.RD3 = ~PORTD.RD3;
           PORTD.RD1 = ~PORTD.RD1;

           a++;
           Delay_ms(100);
           }
}
a=0;
}
}
}