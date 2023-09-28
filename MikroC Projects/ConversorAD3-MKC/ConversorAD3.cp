#line 1 "C:/Users/José Roberto/Documents/Mikro C Projects/ConversorAD3/ConversorAD3.c"
#line 15 "C:/Users/José Roberto/Documents/Mikro C Projects/ConversorAD3/ConversorAD3.c"
unsigned int temp_res;

void main()
{
 TRISA = 0xFF;
 TRISC = 0;
 TRISB = 0;

 do
 {

 temp_res = ADC_Read(0);

 PORTB = temp_res;
 PORTC = temp_res >> 8;
 } while(1);

}
