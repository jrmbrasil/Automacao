#define    true      1
#define    false     0

#define setbit(var, bitno)    ((var) |= 1UL << (bitno))
#define clrbit(var, bitno)    ((var) &= ~(1UL << (bitno)))
#define getbit(var, bitno)     ((var>>bitno) & 1UL)

//const char b[] = "0123456789";
//b at 0x234;

void main ()
{
   int q = 123;
   char w1[4];

   TRISA = 0x00;
   TRISB = 0x00;
   TRISC = 0x00;
   TRISD = 0x00;
   TRISE = 0x00;
   ADCON1= 0x07;
   q = q + 1;
   //Flash_Write(0x234,1234);
   lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);
   //lcd_custom_cmd(0x0C);
   lcd_custom_cmd(0x01);
   delay_ms(3);
   //lcd_custom_out(1,1,"oba123abc456def4");
   //lcd_custom_out(2,1,"444");
   ByteToStr(q,w1);
   lcd_custom_out(2,2,w1);
   //portc = b[8];
   asm { goto $ }


}

