/*
 * Nome do projeto:
     Prog1 - LCD - 8 bits
 * Revisão:
     28-05-2010:
       - initial release;
       - 04-11-2010 - modified by Profº Engº José Roberto;
 * Descrição:
     Este é um programa de teste para comunicar o PIC com um módulo LCD,
     utilizando o PORTB para controle e envio de dados contidos no PORTC ao LCD
     (RB0 a RB3).
 * Configuração:
     MCU:             PIC16F877A
     Oscillator:      XT, 4.0000 MHz
     Ext. Modules:    -
     SW:              mikroC PRO for PIC
*/

// Configura os pinos que serão conectados ao LCD
#define display PORTB
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;


void LCD_inicializa(void);
void LCD_escreve(unsigned char valor);
void LCD_mensagem(unsigned char linha,unsigned char coluna,unsigned char *mensagem);
void LCD_limpar(void);
void LCD_ligar(void);

void main()
{
  unsigned char contador[4];
  unsigned char temp;
 // TRISA = 0x00;        // set direction to be output
  TRISB = 0x00;          // set direction to be output
  TRISC = 0x00;          // set direction to be output
  TRISD = 0x00;          // set direction to be output
  //adcon1 = 0x07;       // para o caso de utilizar o PORTA como saída digital

  LCD_inicializa();
  LCD_ligar();
  temp = 0;
  do 
  {
    PORTB=temp;
    ByteToStr(PORTB,contador);
    LCD_mensagem(1,1,contador);
    Delay_ms(500);      // 0.5 second delay
    temp++;
  } 
  while(1);            // Endless loop
}

void LCD_inicializa(void)
{
     LCD_RS=0;                   //SELECIONA O DISPLAY P/ COMANDOS

     LCD_escreve(0b00111000);   //B'00111000'        FUNCTION SET (0 0 1 DL N F * *)
                                //ONDE:  DL=1 => DADO DE 8 BITS ; DL=0 => DADO DE 4 BITS (DADO RECEBIDO EM DUAS OPERAÇÕES)
                                //ONDE:  N=1 => 2 LINHAS ; N=0 => 1 LINHA
                                //ONDE:  F=1 => FONTE 5X10 ; F=0 => FONTE 5X7
     Delay_ms(1000);
     LCD_RS=1;                  //SELECIONA O DISPLAY P/ DADOS
}

void LCD_escreve(unsigned char valor)
{
     display=valor;             //ATUALIZA DISPLAY (PORTB)
     Delay_us(1);                //PERDE 1us PARA ESTABILIZAÇÃO
     
     LCD_EN=1;                        //ENVIA UM PULSO DE ENABLE AO DISPLAY
     Delay_us(2);
     LCD_EN=0;

     Delay_ms(2);                //DELAY DE 1ms

}

void LCD_mensagem(unsigned char linha,unsigned char coluna,unsigned char mensagem[])
{
     unsigned char posicao;
     int cont;
     
     //OS COMANDOS A SEGUIR SÃO PARA ESCREVER A FRASE
     if(linha<=2)
     {
           LCD_RS=0;                        //SELECIONA O DISPLAY P/ COMANDOS
           LCD_limpar();                //COMANDO P/ LIMPAR O LCD

           if(linha==1) posicao=0x80+coluna-1;
           else if(linha==2)posicao=0xC0+coluna-1;
           
           LCD_escreve(posicao);      //;COMANDO PARA POSICIONAR O CURSOR
           LCD_RS=1;                        //SELECIONA O DISPLAY P/ DADOS

           for(cont=0;mensagem[cont]!=0;cont++)
                LCD_escreve(mensagem[cont]);
      }
}

void LCD_limpar(void)
{
     LCD_RS=0;                  //SELECIONA O DISPLAY P/ COMANDOS
     LCD_escreve(0x01);         //COMANDO P/ LIMPAR A TELA
     LCD_RS=1;                  //SELECIONA O DISPLAY P/ DADOS
}

void LCD_ligar(void)
{
     LCD_RS=0;                   //SELECIONA O DISPLAY P/ COMANDOS

     LCD_escreve(0b00001100);   //B'00001100'          DISPLAY ON/OFF CONTROL ( 0 0 0 0 1 D C B)
                                //ONDE:
                                //D=1 => DISPLAY LIGADO
                                //C=1 => CURSOR LIGADO
                                      //B=1 => BLINK (CARACTER PISCANTE) LIGADO
     Delay_ms(1000);
     LCD_RS=1;                        //SELECIONA O DISPLAY P/ DADOS
}