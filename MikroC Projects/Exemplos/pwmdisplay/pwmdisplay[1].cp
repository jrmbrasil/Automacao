#line 1 "C:/temp/microcontroladorPOS/c/mikroC/pwmdisplay/pwmdisplay.c"



unsigned short j, oj;
char txt1[13];
char *text ="Valor de PW:";

void InitMain() {

 TRISB = 0;


 TRISB = 0;
 Lcd_Init(&PORTB);
 Lcd_Cmd(Lcd_CLEAR);
 Lcd_Cmd(Lcd_CURSOR_OFF);
 Lcd_Out(1, 1, text);


 ADCON1 = 6;

 TRISA = 3;


 portc = 0;
 TRISC = 0;
 Pwm1_Init(2000);
 pwm2_init(2000);
 pwm2_start();
 pwm2_change_duty(150);
}

void main()
{
 InitMain();
 j = 20;
 oj = 0;
 Pwm1_Start();

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
 {
 Pwm1_Change_Duty(j);
 oj = j;
 }
 } while (1);
}
