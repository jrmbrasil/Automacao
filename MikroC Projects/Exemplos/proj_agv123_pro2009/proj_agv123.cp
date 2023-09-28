#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/proj_agv123_pro2009/proj_agv123.c"
#line 13 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/proj_agv123_pro2009/proj_agv123.c"
sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;





void sentido_horario();
void sentido_antihorario();
void interrupt() ;
void mostra_ad();





unsigned char g = 'h';
char flag = 0;
char text[20];


const char *string1 = " motor girando ";
const char *string2 = "  anti_horario  ";
const char *string3 = "    horario    ";
const char *string4 = " A TENSAO VALE: ";





void StrConstCpy(char *dest, const char *source) {
while(*source)
*dest++ = *source++ ;

*dest = 0 ;
}




void main(void)
{









 TRISA=0x3F;
 TRISB=0x00;
 TRISC=0x80;
 TRISD=0x00;
 TRISE=0x00;


 ADCON1 = 0x0E;


 uart1_init(9600);


 PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1;




 lcd_init();
 lcd_cmd(0x0C);
 lcd_cmd(0x01);
 delay_ms(2);


 if(PORTA.F2==1){

 StrConstCpy(text,string1);
 lcd_out(1,1,text);

 }
 else mostra_ad();


 pwm1_init(5000);
 pwm1_start();
 pwm1_set_duty(150);

 pwm2_init(5000);
 pwm2_start();
 pwm2_set_duty(150);
 T2CON.TMR2ON=1;










 while( 1 )
 {
 switch (g)
 {
 case 'h':
 sentido_horario();
 if(PORTA.F2==1){
 if(flag !=1) {
 lcd_cmd(0x01);
 delay_ms(2);

 StrConstCpy(text,string1);
 lcd_out(1,1,text);

 StrConstCpy(text,string3);
 lcd_out(2,1,text);
 flag = 1;
 }
 }
 else mostra_ad();
 break;

 case 'a':
 sentido_antihorario();
 if(PORTA.F2==1) {
 if (flag !=2) {
 lcd_cmd(0x01);
 delay_ms(2);

 StrConstCpy(text,string1);
 lcd_out(1,1,text);

 StrConstCpy(text,string2);
 lcd_out(2,1,text);
 flag = 2;
 }
 }
 else mostra_ad();
 break;


 default : mostra_ad();
 }

 }

}



void sentido_horario()
 {
 char d;
 PORTB = 0x01;
 for (d=0; d<3; d++)
 {
 delay_ms(50);
 PORTB <<=1;
 }

 delay_ms(50);
 }


void sentido_antihorario()
 {
 char d;
 PORTB = 0x08;
 for (d=0; d<3; d++)
 {
 delay_ms(50);
 PORTB >>=1;
 }

 delay_ms(50);
 }



void interrupt ()
 {
 if (RCIF) g = RCREG;
 uart1_write(g);

 }


void mostra_ad()
 {
 int dado_adc;
 char string_dado[13];
 float convert ;
 if(flag!=3) {
 lcd_cmd(0x01);
 delay_ms(2);
 StrConstCpy(text, string4);
 }

 dado_adc = adc_read(0);
 lcd_out(1,1,text);
 convert = dado_adc * 5;
 convert = convert / 1023;

 FloatToStr(convert, string_dado);
 lcd_out(2,2,string_dado);
 lcd_out_cp("V");
 flag = 3;
 }
