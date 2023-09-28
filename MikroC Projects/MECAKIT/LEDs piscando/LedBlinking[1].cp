#line 1 "C:/Users/José Roberto/Documents/MikroC Projects/MECAKIT/LEDs piscando/LedBlinking.c"
void main()
{

 ADCON1=0B00001110;
 TRISA = 0;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 do
 {
 PORTD=0XFF;
 Delay_ms(1000);

 PORTD=0;
 Delay_ms(1000);
 }
 while(1);
}
