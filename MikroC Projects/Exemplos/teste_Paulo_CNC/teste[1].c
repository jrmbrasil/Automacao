
  #define         true    1
  #define         false   0


//prot�tipo de fun��es utilizadas no programa
void avancasv1();
void retornasv1();

/*Variaveis Globais*/
void main()
{

/*Declara��o de entradas e sa�das*/

  TRISA = 0x00;
  TRISB = 0x00;
  TRISC = 0x80;
  TRISD = 0x00;
  TRISE = 0x00;

 /*Declara PORTA e PORTE como digital*/
  ADCON1 = 0x07;

 /*Limpando todas as PORTs*/
  PORTA = 0x00;
  PORTB = 0x00;
  PORTC = 0x00;
  PORTD = 0x00;
  PORTE = 0x00;

 /*Para setar ou zerar um bit de uma variavel:
 PORTA.F1 = 1 >> bsf PORTA,1*/

 //configurando recep��o da serial com interrup��o
 PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrup��o

    while(true)
    {
        long i = 0;
        long j = 0;
        while(i < 50000)
          {
             PORTB.F0= 1;
             Delay_us(40);
             PORTB.F0= 0;
             Delay_us(27);
             i++;
          }
        while(j < 50000)
          {
             PORTB.F1= 1;
             Delay_us(40);
             PORTB.F1= 0;
             Delay_us(27);
             j++;
          }
    }// fim do while
}

/*Fun��es*/
void avancasv1() // avan�a servi motor 1
{
     long i = 0;
        while(i < 50000)
          {
             PORTB.F0= 1;
             Delay_us(40);
             PORTB.F0= 0;
             Delay_us(27);
             i++;
          }
}

void retornasv1() // avan�a servi motor 1
{
     long j = 0;
       while(j < 50000)
          {
             PORTB.F1= 1;
             Delay_us(40);
             PORTB.F1= 0;
             Delay_us(27);
             j++;
          }
}
