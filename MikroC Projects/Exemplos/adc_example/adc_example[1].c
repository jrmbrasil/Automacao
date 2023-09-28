#define    true      1
#define    false     0

#define setbit(var, bitno)    ((var) |= 1UL << (bitno))
#define clrbit(var, bitno)    ((var) &= ~(1UL << (bitno)))
#define getbit(var, bitno)     ((var>>bitno) & 1UL)


void main ()
{
   int valor_adc;
   char b[6];
   char i;
  // b[4]=0x00;
   //b[5]=0x00;
   TRISA = 0x01;
   TRISB = 0x00;
   TRISC = 0x00;
   TRISD = 0x00;
   TRISE = 0x00;
   ADRESH = 0x00;
   ADRESL = 0x00;
   //ADCON1= 0x80;
   adcon0 = 0b10000001;
   adcon1 = 0b11001110;

    for ( i=0; i<=5; i++)
    {
        b[i]=0x00;
    }


   lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);
   lcd_custom_cmd(0x0C);

   lcd_custom_cmd(0x01);
   delay_ms(2);
    while(1)
    {
               valor_adc = adc_read(0);

               IntToStr(valor_adc, b);

               lcd_custom_out(2,2, b );

     }
}

