/*
 * Nome do projeto:
     Conversor AD
 * Revis�o:
       - initial release;
       - 10-11-2010 - modified by Prof� Eng� Jos� Roberto;
 * Descri��o:
     Este � um programa de teste para testar o uso do conversor AD.
 * Configura��o:
     MCU:             PIC16F877A
     Oscillator:      XT, 4.0000 MHz
     Ext. Modules:    -
     SW:              mikroC PRO for PIC
*/
unsigned int temp_res;

void main()
{
  ADCON0=0b01000001; // ADCS1   ADCS0   CHS2   CHS1   CHS0   GO/DONE   �   ADON
  ADCON1=0b10100000; // ADFM    ADCS2    �      �     PCFG3  PCFG2   PCFG1 PCFG0

  TRISA  = 0xFF;              // PORTA is input
  TRISC  = 0;                 // PORTC is output
  TRISB  = 0;                 // PORTB is output

  do 
  {
    ADCON0.GO_DONE=1; //Inicia a convers�o AD
    while(ADCON0.GO_DONE == 1); //Espera a convers�o ser conclu�da
    Delay_us(4); // Delay de 2.TAD = 4us ap�s a convers�o
    
    // Salva em "temp_res" o resultado (10 bits) da convers�o AD realizada
    temp_res = temp_res << 8;
    temp_res += ADRESL;
    
    PORTB = temp_res;         // Send lower 8 bits to PORTB
    PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
  } while(1);

}

//******************CONFIGURA��ES DO REGISTRADOR "ADCON0"*********************

//ADCON1 <ADCS2> ; ADCON0 <ADCS1:ADCS0>: Sele��o do clock do conversor A/D
//000 = FOSC/2
//001 = FOSC/8
//010 = FOSC/32
//011 = FRC (clock derivado do oscilador RC interno do conversor A/D)
//100 = FOSC/4
//101 = FOSC/16
//110 = FOSC/64
//111 = FRC (clock derivado do oscilador RC interno do conversor A/D)

//CHS2:CHS0: Sele��o do canal anal�gico a ser utilizado
//000 = channel 0, (AN0)
//001 = channel 1, (AN1)
//010 = channel 2, (AN2)
//011 = channel 3, (AN3)
//100 = channel 4, (AN4)
//101 = channel 5, (AN5)
//110 = channel 6, (AN6)
//111 = channel 7, (AN7)

//GO/DONE: Indica o estado do conversor A/D (somente quando ADON = 1):
//1 = H� uma convers�o A/D sendo executada (quando este bit � ligado � iniciada
//    a convers�o A/D. Assim que a convers�o esteja completa, este bit �
//    automaticamente desligado pelo hardware do PIC)
//0 = N�o h� nenhuma convers�o A/D sendo executada no momento

//bit 1 n�o implementado: � lido como '0'

//ADON: Liga/Desliga o conversor A/D
//1 = O conversor A/D � ligado e est� pronto para operar, mediante o controle
//    do bit GO/DONE
//0 = O conversor A/D � desligado e o m�dulo deixando assim de consumir enrgia


//******************CONFIGURA��ES DO REGISTRADOR "ADCON1"*********************

//ADFM: Seleciona o formato do resultado da convers�o A/D armazenado no par de
//      registradores ADRESH:ADRESL
//1 = Justificado � direita. Os 6 bits mais significativos de ADRESH s�o lidos como �0�
//0 = Justificado � esquerda. Os 6 bits menos significativos de ADRESL s�o lidos como �0�

//ADCS2: Sele��o do clock do conversor A/D, em conjunto com  ADCON0 <ADCS1:ADCS0>

//bits 5 e 4 n�o implementados: Lidos como '0'

//PCFG3:PCFG0: Configura a disposi��o dos bits dos PORTs A/D (RE2:RE0; RA5 ; RA3:RA0)
//PCFG   AN7   AN6   AN5   AN4   AN3   AN2   AN1   AN0
//0000    A     A     A     A     A     A     A     A
//0001    A     A     A     A   VREF+   A     A     A
//0010    D     D     D     A     A     A     A     A
//0011    D     D     D     A   VREF+   A     A     A
//0100    D     D     D     D     A     D     A     A
//0101    D     D     D     D   VREF+   D     A     A
//011x    D     D     D     D     D     D     D     D
//1000    A     A     A     A   VREF+  VREF-  A     A
//1001    D     D     A     A     A     A     A     A
//1010    D     D     A     A   VREF+   A     A     A
//1011    D     D     A     A   VREF+  VREF-  A     A
//1100    D     D     D     A   VREF+  VREF-  A     A
//1101    D     D     D     D   VREF+  VREF-  A     A
//1110    D     D     D     D     D     D     D     A
//1111    D     D     D     D   VREF+  VREF-  D     A