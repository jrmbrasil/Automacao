


#define   true   1
#define   false  0


void main()
{
     TRISA = 0b00001111;
     TRISB = 0x00;
     TRISC = 0x00;
     TRISD = 0x00;
     TRISE = 0x00;
     ADCON1 = 0x07;
     
     PORTB = 0;
     

     while (true)
     {
      if(PORTA.F0 && PORTA.F1) PORTB.F1 = 1;
      else  PORTB.F1 = 0;
     }



}
