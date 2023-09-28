#line 1 "C:/temp/microcontroladorPOS/c/mikroC/pwm_example/pwm_example.c"








void main ()
{
 char j;
 TRISA = 0x1F;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1 = 0x07;

 portc = 0x00;
 INTCON.GIE = 0x00;
 PWM1_Init(5000);

 PWM1_Start();
 Pwm_Change_Duty(0);



 T2CON.TMR2ON=1;
 PWM1_Change_Duty(0);
 tmr2 = 0;
 for (j=0; j < 250; j++)
 {
 PWM1_Change_Duty(j);
 tmr2 = 0;
 delay_ms(10);

 }


 asm { goto $ }


}
