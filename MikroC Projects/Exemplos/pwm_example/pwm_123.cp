#line 1 "C:/temp/microcontroladorPOS/c/mikroC/pwm/pwm_123.c"



unsigned short j, oj;

void InitMain() {
 PORTB = 0;
 TRISB = 0;

 ADCON1 = 6;
 PORTA = 255;
 TRISA = 255;

 PORTC = 0xFF;
 TRISC = 0;
 Pwm_Init(5000);
}

void main() {
 InitMain();
 j = 80;
 oj = 0;
 Pwm_Start();

 while (1) {
 if (Button(&PORTA, 0,1,1))
 j++ ;
 if (Button(&PORTA, 1,1,1))
 j-- ;

 if (oj != j) {
 Pwm_Change_Duty(j);
 oj = j;
 PORTB = oj;
 }
 Delay_ms(200);
 }
}
