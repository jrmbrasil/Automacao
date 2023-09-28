#line 1 "C:/Users/José Roberto/Documents/Mikro C Projects/ConversorAD/ConversorAD.c"
#line 16 "C:/Users/José Roberto/Documents/Mikro C Projects/ConversorAD/ConversorAD.c"
unsigned int temp_res;

void anselect(char sel);
void adconfig(char adc1,char adc0);

void main()
{
 ADCON0=0b01000001;
 ADCON1=0b10100000;

 TRISA = 0xFF;
 TRISC = 0;
 TRISB = 0;

 do
 {
 ADCON0.GO_DONE=1;
 while(ADCON0.GO_DONE == 1);
 Delay_us(4);


 temp_res = temp_res << 8;
 temp_res += ADRESL;

 PORTB = temp_res;
 PORTC = temp_res >> 8;
 } while(1);

}
