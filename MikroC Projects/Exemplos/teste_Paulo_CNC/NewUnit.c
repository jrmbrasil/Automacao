
  #define         true    1
  #define         false   0


//protótipo de funções utilizadas no programa
void avancasv1 ();
void retornasv1 ();


/*Variaveis Globais*/
char g;  // recebe letra da RCREG
short frag; // frag para interupção
char eixo; // decide qual eixo vai ser selecionado
short pulsos; // variavel que ira receber o número de pulsos para os motores

void main()
{

/*Declaração de entradas e saídas*/

  TRISA = 0x00;
  TRISB = 0x10;
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

 //configurando recepção da serial com interrupção
 PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrupção
    while(true)
    {
        avancasv1();
        retornasv1();
    }// fim do while

}

/*Funções*/
void avancasv1 () // avança servi motor 1
{
     PORTB.F1 = 1;
     for(int i = 0; i < 50000; i++)
     {
       PORTB.F2 = 1;
       delay_us (40);
       PORTB.F2 = 0;
     }
}

void retornasv1 ()
{
     PORTB.F1 = 0;
     for(int i = 0; i < 50000; i++)
     {
       PORTB.F0 = 1;
       delay_ms(40);
       PORTB.F0 = 0;
     }
}
