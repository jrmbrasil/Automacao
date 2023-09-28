  //C_compiler    mikroC_PRO 2009

  //Clock = 4Mhz
  //Escolhendo configuration bits:
  // _CP_OFF

  //example using mikroC
  #define         true    1
  #define         false   0
  
  //lcd in mikroC Pro
  // LCD module connections
sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD module connections


  
//protótipo de funções utilizadas no programa
void  sentido_horario();
void  sentido_antihorario();
void  interrupt() ;
void  mostra_ad();
//final do protótipo de funções



//variáveis globais (que podem ser chamadas de qualquer ponto do programa!)
unsigned char g = 'h';
char flag = 0;
char text[20]; // armazenado em RAM

//constantes armazenadas em flash eeprom
const char *string1 = " motor girando ";
const char *string2 = "  anti_horario  ";
const char *string3 = "    horario    ";
const char *string4 = " A TENSAO VALE: ";




// --- Copying strings from ROM to RAM
void StrConstCpy(char *dest, const char *source) {
while(*source)
*dest++ = *source++ ;

*dest = 0 ;
}




void main(void)
{

  //variáveis utilizadas dentro de main
  
  //end variáveis

        //char text[5];

        ////acerte todos os "TRIS necessários para funcionamento do seu programa
        //ADCON1 =  0x07;
        TRISA=0x3F;
        TRISB=0x00;
        TRISC=0x80; //aqui RX - RC7 (pino 26 pic16f877a) é entrada
        TRISD=0x00;
        TRISE=0x00;
        
        //escolhendo as entradas analógicas
        ADCON1 = 0x0E;

        //configurando a rs232
        uart1_init(9600);

        //configurando recepção da serial com interrupção
        PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrupção


        //configurando o LCD

        lcd_init();
        lcd_cmd(0x0C);        //sem cursor piscante e deslocamento para direita
        lcd_cmd(0x01);        // limpeza do lcd  e posicionando linha 1, coluna 1.
        delay_ms(2);          // aguardando tempo exigido pelo lcd 1602

        //teste
        if(PORTA.F2==1){

                StrConstCpy(text,string1);
                lcd_out(1,1,text);

        }
        else  mostra_ad();


        pwm1_init(5000);
        pwm1_start();
        pwm1_set_duty(150);

        pwm2_init(5000);
        pwm2_start();
        pwm2_set_duty(150);
        T2CON.TMR2ON=1;   //é importante após configurar os dois pwms
                    //ligar o timer2 em T2CON.TRM2ON


        ////se o processo exigir que alguns sensores ou condições sejam verificados
        ////   continuamente crie um "while" especifico!

        ////Cuidado não deixe que o fluxo normal do programa reconfigure as portas, ou
        //// não permita que o programa volta ao início do main!


        while(true)
        {
           switch   (g)
             {
                case 'h':
                   sentido_horario();
                   if(PORTA.F2==1){
                      if(flag !=1) {
                        lcd_cmd(0x01);
                        delay_ms(2);

                        StrConstCpy(text,string1);
                        lcd_out(1,1,text);

                        StrConstCpy(text,string3);
                        lcd_out(2,1,text);
                        flag = 1;
                       }
                    }
                    else mostra_ad();
                    break;

                 case 'a':
                    sentido_antihorario();
                    if(PORTA.F2==1) {
                       if (flag !=2) {
                          lcd_cmd(0x01);
                          delay_ms(2);

                          StrConstCpy(text,string1);
                          lcd_out(1,1,text);

                          StrConstCpy(text,string2);
                          lcd_out(2,1,text);
                          flag = 2;
                        }
                     }
                     else  mostra_ad();
                     break;
                             //default:

                 default :   mostra_ad();
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
      uart1_write(g);

   }


void   mostra_ad()
  {
    int dado_adc;
    char   string_dado[13];
    float  convert ;
    if(flag!=3) {
      lcd_cmd(0x01);
      delay_ms(2);
      StrConstCpy(text, string4);
     }
     
     dado_adc = adc_read(0);
     lcd_out(1,1,text);
     convert = dado_adc * 5;
     convert = convert / 1023;

     FloatToStr(convert, string_dado);
     lcd_out(2,2,string_dado);
     lcd_out_cp("V");
     flag = 3;
 }
