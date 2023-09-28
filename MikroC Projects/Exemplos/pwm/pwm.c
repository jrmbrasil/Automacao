#define  true   1
#define  false  0


void main() {
     TRISA = 0x0F;
     TRISB = 0x00;
     TRISC = 0x00;
     TRISD = 0x00;
     TRISE = 0x00;
     
     
     ADCON1 = 0x07;
     
     pwm1_init(1000);
     pwm1_start();
     pwm1_set_duty(127);
     
     while(1);

}
