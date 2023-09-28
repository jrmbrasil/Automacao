#line 1 "C:/temp/microcontroladorPOS/c/mikroC/portalogica_teste/portalogica_teste.c"





char valor;

int soma(int , int );

void main()
{
 char letra;

 TRISA = 0x03;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;
 ADCON1= 0X07;

 letra = 0x35;

 PORTB = letra;
 asm{DB ['t','e','x','t','o']}

 PORTC = (char) soma(1025, 2356);

 while (PORTA.f1)
 {
 if(PORTA.f0) PORTB.f1=1;
 else PORTB.f1=0;

 }


}





int soma(int a, int b)
 {
 return (a + b);
 }
