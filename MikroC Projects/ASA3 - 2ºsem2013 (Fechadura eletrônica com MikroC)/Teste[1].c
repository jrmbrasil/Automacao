
void main()
{
    unsigned int num1,num2,controle=0;
    ADCON1=6;
    TRISA=255;
    TRISB=0;
    PORTB=0;
    
    while(1)
    {
      while(!RA4_BIT);
      if(controle==3)
      {
         PORTB.B0=0;
         controle=0;
      }
      if((PORTA&0x0F) == 8 && controle==0)
      {
         controle=1;
         num1=PORTA&0x0F;
      }
      if((PORTA&0x0F) == 3 && controle==1)
      {
         controle=2;
         num2=PORTA&0x0F;
      }
      if(controle==2)
      {
         PORTB.B0=1;
         controle=3;
      }
      while(RA4_BIT);
    }
}