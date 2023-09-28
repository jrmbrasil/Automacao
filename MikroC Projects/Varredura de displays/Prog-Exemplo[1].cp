#line 1 "C:/Users/José Roberto/Documents/Mikro C Projects/Prog-Teste/Prog-Exemplo.c"
unsigned contador=0,contador_bcd=0,temp1,lim_inf=10,lim_sup=20;
unsigned short unidade,dezena,centena,milhar,display=0,overflow=0;

unsigned short sete_segmentos(unsigned valor);
void interrupt();

void main()
{


 TRISA = 0x01;
 adcon1 = 0x07;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISE.PSPMODE=0;
 TRISD = 0x00;


 INTCON=0x20;
 OPTION_REG=0x07;
 INTCON.GIE=1;


 while(1)
 {

 if(contador >= 9999) overflow=1;
 else overflow=0;


 if(contador>=lim_inf && contador<=lim_sup)
 {
 PORTA.RA1=1;
 PORTA.RA2=0;
 }
 else
 {
 PORTA.RA1=0;
 PORTA.RA2=1;
 }


 while(PORTA.RA0==0);
 contador++;
 while(PORTA.RA0==1);

 }
}


void interrupt()
{
 if (INTCON.TMR0IF)
 {
 contador_bcd = Dec2Bcd16(contador);
 temp1 = contador_bcd;
 unidade = temp1 & 0x000F;
 temp1 = temp1 >> 4;
 dezena=temp1&0x000F;
 temp1 = temp1 >> 4;
 centena=temp1&0x000F;
 temp1 = temp1 >> 4;
 milhar=temp1&0x000F;



 switch(display)
 {
 case 0: PORTC=0x0E;
 PORTB=sete_segmentos(unidade);
 break;
 case 1: PORTC=0x0D;
 PORTB=sete_segmentos(dezena);
 break;
 case 2: PORTC=0x0B;
 PORTB=sete_segmentos(centena);
 break;
 case 3: PORTC=0x07;
 PORTB=sete_segmentos(milhar);
 break;
 }


 if(++display == 4) display = 0;

 INTCON.TMR0IF = 0;
 }
}

unsigned short sete_segmentos(unsigned valor)
{
 if(overflow==1) return (0xDC);

 switch(valor)
 {
 case 0: return (0x3F);
 case 1: return (0x06);
 case 2: return (0x5B);
 case 3: return (0x4F);
 case 4: return (0x66);
 case 5: return (0x6D);
 case 6: return (0x7D);
 case 7: return (0x07);
 case 8: return (0x7F);
 case 9: return (0x6F);
 }

}
