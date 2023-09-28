  //C_compiler    mikroC  lembrete//sensor de temperatura mcp9700A

  //Clock = 4Mhz
  //Escolhendo configuration bits:
  // _CP_OFF

  //example using mikroC
  #define         true    1
  #define         false   0


  //prot�tipo de fun��es utilizadas no programa
void  sentido_horario( );
void  sentido_antihorario();
void  interrupt() ;
void  mostra_ad();

//final do prot�tipo de fun��es


//vari�veis globais (que podem ser chamadas de qualquer ponto do programa!)
unsigned char g = 'h';
char flag = 0;
char text[20]; // armazenado em RAM


//constantes armazenadas em flash eeprom
const char *string1 = " motor  girando ";
const char *string2 = "  anti_horario  ";
const char *string3 = "    horario     ";
const char *string4 = "A TENSAO VALE:";




// --- Copying strings from ROM to RAM
void StrConstCpy(char *dest, const char *source) {
   while(*source)
   *dest++ = *source++ ;

   *dest = 0 ;
}




void main(void)
{

  //vari�veis utilizadas dentro de main

  //char dsw[20];
  //int numero = 123;


        ////acerte todos os "TRIS necess�rios para funcionamento do seu programa
        //ADCON1 =  0x07;
        TRISA=0x3F;
        TRISB=0x00;
        TRISC=0x80; //aqui RX - RC7 (pino 26 pic16f877a) � entrada
        TRISD=0x00;
        TRISE=0x00;
        
        //escolhendo as entradas anal�gicas
        ADCON1 = 0x0E;

        //configurando a rs232 para receber  por interrup��o
        usart_init(9600);
        PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrup��o


        //configurando o LCD
        //
        lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);
        lcd_custom_cmd(0x0C);
        lcd_custom_cmd(0x01);
        delay_ms(2);




        //teste;
        if(PORTA.F2==1){

        StrConstCpy(text, string1);
        lcd_custom_out(1,1,text);

        }
        else  mostra_ad();


        pwm1_init(5000);
        pwm1_change_duty(150);
        pwm1_start();

        pwm2_init(5000);
        pwm2_change_duty(50);
        pwm2_start();
        T2CON.TMR2ON=1;   //� importante ap�s configurar os dois pwms
                          //ligar novamente o timer2 em T2CON.TRM2ON


        ////se o processo exigir que alguns sensores ou condi��es sejam verificados
        ////   continuamente crie um "while" especifico!

        ////Cuidado n�o deixe que o fluxo normal do programa reconfigure as portas, ou
        //// n�o permita que o programa volta ao in�cio do main!


        while(true)
        {
                //coloque aqui a sua aplica��o


                switch   (g)
                  {
                     case 'h':
                        sentido_horario();
                        if(PORTA.F2==1){

                          if(flag !=1) {
                             lcd_custom_cmd(0x01);
                             delay_ms(2);

                             StrConstCpy(text,string1);
                             lcd_custom_out(1,1,text);

                             StrConstCpy(text,string3);
                             lcd_custom_out(2,1,text);
                             flag = 1;
                                                  
                          }
                        }
                        else mostra_ad();
                        break;

                     case 'a':
                        sentido_antihorario();
                        if(PORTA.F2==1) {

                          if (flag !=2) {
                            lcd_custom_cmd(0x01);
                            delay_ms(2);

                            StrConstCpy(text,string1);
                            lcd_custom_out(1,1,text);

                            StrConstCpy(text,string2);
                            lcd_custom_out(2,1,text);
                            flag = 2;

                          }
                        }
                        else  mostra_ad();
                        break;
                        //default:


                  }

        }

}



void   sentido_horario()
  {
    char d;
    PORTB = 0x01;
    for (d=0; d<3; d++)
     {
       delay_ms(50);
       PORTB <<=1;

     }

     delay_ms(50);
   }


void   sentido_antihorario()
  {
    char d;
    PORTB = 0x08;
    for (d=0; d<3; d++)
      {
        delay_ms(50);
        PORTB >>=1;

       }

     delay_ms(50);
  }



void interrupt ()
  {
    if (RCIF) g = RCREG;
    usart_write(g);

   }


void   mostra_ad()
  {
    int dado_adc;
    char   string_dado[13];
    float  convert ;

    if(flag!=3) {
      lcd_custom_cmd(0x01);
      delay_ms(2);
      StrConstCpy(text, string4);
	  lcd_custom_out(1,1,text);
    }
                
                
    dado_adc = adc_read(0);
    convert = dado_adc * 5;
    convert = convert / 1023;

    FloatToStr(convert, string_dado);
    lcd_custom_out(2,2,string_dado);
    lcd_custom_out_cp("V");
    flag = 3;
  }
