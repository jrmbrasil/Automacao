#line 1 "C:/temp/microcontroladorPOS/c/mikroC/porta_ou_exclusivo/porta_ou_exclusivo.c"
#line 1 "c:/temp/microcontroladorpos/c/mikroc/porta_ou_exclusivo/lcd.h"
#line 44 "c:/temp/microcontroladorpos/c/mikroc/porta_ou_exclusivo/lcd.h"
 void lcd_gen_setup();
 void lcd_gen_init();
 void lcd_gen_send_nibble(unsigned char );
 void lcd_gen_send_command(unsigned char);
 void lcd_gen_send_data(unsigned char);
 void lcd_gen_send_string(unsigned char *);
 void lcd_gen_pos_xy(unsigned char, unsigned char);
#line 97 "c:/temp/microcontroladorpos/c/mikroc/porta_ou_exclusivo/lcd.h"
 void lcd_gen_setup()
 {
 if( 0x08 ==0x06 &&  0x09 ==0x06) {
 TRISB = TRISB & 0x0C;
 }

 if( 0x08 ==0x06 &&  0x09 ==0x09) {
 TRISB = TRISB & 0x0F;
 TRISE = TRISE & 0x04;
 }
 if( 0x08 ==0x07 &&  0x09 ==0x09) {
 TRISC = TRISC & 0x0F;
 TRISE = TRISE & 0x04;
 }
 if( 0x08 ==0x08 &&  0x09 ==0x09) {
 TRISD = TRISD & 0x0F;
 TRISE = TRISE & 0x04;
 }
 }


 void lcd_gen_send_nibble(unsigned char dado)
 {
 unsigned char c;
  PORTD.F4  =0;
  PORTD.F5  =0;
  PORTD.F6  =0;
  PORTD.F7  =0;

 if ((dado & 0x01) >> 0) { PORTD.F4  =1;}
 if ((dado & 0x02) >> 1) { PORTD.F5  =1;}
 if ((dado & 0x04) >> 2) { PORTD.F6  =1;}
 if ((dado & 0x08) >> 3) { PORTD.F7  =1;}

  PORTE.F1  = 1;
 for(c=0; c<= Get_Fosc_kHz()/4000L ;c++) {
 asm {
 nop
 nop
 nop
 }

 }
  PORTE.F1  = 0;
 }

 void lcd_gen_send_command(unsigned char command)
 {
  PORTE.F0  = 0;
 lcd_gen_send_nibble(command>>4);
 lcd_gen_send_nibble(command & 0x0F);

 }

 void lcd_gen_send_data(unsigned char valor)
 {
  PORTE.F0  = 1;
 lcd_gen_send_nibble(valor>>4);
 lcd_gen_send_nibble(valor & 0x0F);

 }

 void lcd_gen_init( )
 {
 int c;

 delay_ms(40);
  PORTE.F0  = 0;
 lcd_gen_send_nibble(0x03);
 delay_ms(5);
 lcd_gen_send_nibble(0x03);

 lcd_gen_send_nibble(0x03);

 lcd_gen_send_nibble(0x02);
 for(c=0; c<45;c++);

 lcd_gen_send_command(0x28);
 for(c=0; c<45;c++);
 lcd_gen_send_command(0x01);
 delay_ms(2);
 lcd_gen_send_command(0x0C);
 for(c=0; c<45;c++);
 lcd_gen_send_command(0x06);
 for(c=0; c<45;c++);

  PORTE.F0  =1;
 }

 void lcd_gen_send_string(unsigned char *a)
 {
 int p=0;
 unsigned char b;
 b = a[p];
 while(b!=0x00)
 {
 b=a[p];
 if(b!=0x00)
 {
 p++;
 }
 }

 if (p>0)
 {
 p=0;
 b = a[p];
 while(b!=0x00)
 {
 b=a[p];
 if(b!=0x00)
 {
 lcd_gen_send_data(a[p]);
 p++;
 }
 }

 }

 }


 void lcd_gen_pos_xy(unsigned char x, unsigned char y)
 {
 unsigned char address;
 if(y!=0)
 address =  0xC0 ;
 else
 address =  0x80 ;
 address += x;
 lcd_gen_send_command(0x80 | address);
 }
#line 5 "C:/temp/microcontroladorPOS/c/mikroC/porta_ou_exclusivo/porta_ou_exclusivo.c"
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

 float b, a;
 TRISA = 0b00000011;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1= 0x07;
 Adc_Read(0);

 a = 22;
 b = 3;

 asdf = a/b;
 lcd_gen_setup();
 lcd_gen_init();
 lcd_gen_send_command(0x01);
 delay_ms(2);
 lcd_gen_send_data(0x41);
 FloatToStr(asdf ,gh);
 lcd_gen_send_string(gh);

 Usart_Init(9600);

 Usart_Write(0x41);





 mounth =  Get_Fosc_kHz()/4000L ;
 asm {goto $};

 while( 1 )
 {
 if(porta.f0 ^ porta.f1) portb.f0=1;
 else portb.f0=0;

 }


}
