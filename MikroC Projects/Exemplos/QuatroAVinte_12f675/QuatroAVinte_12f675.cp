#line 1 "C:/temp/microcontroladorPOS/c/mikroC/QuatroAVinte_12f675/QuatroAVinte_12f675.c"
#line 1 "c:/temp/microcontroladorpos/c/mikroc/quatroavinte_12f675/base_12f.h"
#line 13 "c:/temp/microcontroladorpos/c/mikroc/quatroavinte_12f675/base_12f.h"
void timer_0_setup(unsigned char);
void rtcc_0_setup(unsigned char);
void set_timer_1(unsigned long);
void timer_1_setup(unsigned char);

void timer_0_setup(unsigned char c){
 OPTION_REG = 0x80;
 OPTION_REG |= c;
}

void rtcc_0_setup(unsigned char c){
 OPTION_REG = 0x80;
 OPTION_REG |= c;
}
#line 66 "c:/temp/microcontroladorpos/c/mikroc/quatroavinte_12f675/base_12f.h"
 void set_timer_1(unsigned long c) {
 TMR1L = (unsigned char) (c);
 TMR1H = (unsigned char) (c>>8);
 }


 void timer_1_setup(unsigned char pr)
 {
 T1CON = 0x00;
 T1CON = (pr << 4);
 }


 void timer_1_on() { T1CON.TMR1ON = 1;}

 void timer_1_off() {T1CON.TMR1ON = 0;}
#line 8 "C:/temp/microcontroladorPOS/c/mikroC/QuatroAVinte_12f675/QuatroAVinte_12f675.c"
void interrupt () ;
int valor_adc;
unsigned int t;

void pwm(unsigned int fr) { t = fr; }

void main()
{

 TRISIO = 0b00000001;
 PIE1.TMR1IE = 1;
 INTCON.PEIE = 1;

 ansel = 1;

 timer_1_setup( 0x02 );


 TMR1H = 0xFD;
 TMR1L = 0xE8;

 timer_1_on();

 GPIO.f2 =1;

 INTCON.GIE = 1;





 while(1)
 {
 valor_adc = adc_read(0);


 }

}


void interrupt ()
 {
 INTCON.GIE =0;


 if (PIR1.TMR1IF)
 {
 if(valor_adc>100 && valor_adc < 1020)
 {
 if(GPIO.f2) {
 timer_1_off();
 GPIO.f2 = 0;
 set_timer_1(65535 - (1024-valor_adc));
 timer_1_on();

 }
 else {
 timer_1_off();
 GPIO.f2 = 1;
 set_timer_1(65535 - (valor_adc-1));
 timer_1_on();
 }

 }

 if(valor_adc < 100) GPIO.f2 = 0;
 if (valor_adc > 1020) GPIO.f2 = 1;



 }
 PIR1.TMR1IF = 0;
 INTCON.GIE =1;
 }
