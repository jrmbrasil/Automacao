

#define     true    1
#define     false   0

char  valor;  //isto é uma variável global

int soma(int , int ); //protótipo da função

void main()
{
    char letra;  //isto é uma variável local

    TRISA = 0x03;
    TRISB = 0x00;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
    ADCON1= 0X07;    //PORTA e PORTE digitais
    
    letra = 0x35;

    PORTB = letra;
    asm{DB ['t','e','x','t','o']}

    PORTC = (char) soma(1025, 2356); //o PORTC fica com  o byte LOW

    while (PORTA.f1) //loop infinito
    {
      if(PORTA.f0) PORTB.f1=1;
      else       PORTB.f1=0;
    
    }


}





int soma(int a, int b)
 {
   return (a + b);
 }
