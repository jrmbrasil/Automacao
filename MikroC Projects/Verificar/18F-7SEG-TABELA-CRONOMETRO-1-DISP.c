
/*;*********************************************************************
;**  SENAI - MICROCONTROLADORES
;**  PROF. DOUGLAS AIROLDI
;**  PROGRAMA:         CRONOMETRO DE 1 DISP 7SEG e USO DE TABELA
;**  VERSÃO: 0.0
;**  DATA: 26/9/2016
;**********************************************************************/
#define  B_start  RB0_bit
#define  B_stop  RB1_bit
#define  B_reset  RB2_bit

bit  F_conta;
char unidade = 0;
const char *tabela[] =
//  gfedcba
{0b00111111,//RETORNA 0
 0b00000110,//RETORNA 1
 0b01011011,//RETORNA 2
 0b01001111,//RETORNA 3
 0b01100110,//RETORNA 4
 0b01101101,//RETORNA 5
 0b01111101,//RETORNA 6
 0b00000111,//RETORNA 7
 0b01111111,//RETORNA 8
 0b01101111,//RETORNA 9
 0b01110111,//RETORNA A
 0b01111100,//RETORNA B
 0b00111001,//RETORNA C
 0b01011110,//RETORNA D
 0b01111001,//RETORNA E
 0b01110001};//RETORNA F


void main()
{
 PORTB = 0X00;
 PORTD = 0X00;
 TRISB = 0XFF;
 TRISD = 0X00;
 ADCON1 = 0X0F;
 TRISE2_bit = 0;
 RE2_bit = 1;
 F_conta=0;

 while(1){
    PORTD = tabela[unidade];
    Delay_ms(300);
    if(!B_start)F_conta=1;
    if(!B_stop)F_conta=0;
    if (!B_reset){
      unidade=0;
      F_conta=0;
    }
    if(F_conta){
      unidade++;
      if(unidade==16)unidade=0;
    }
  }
}