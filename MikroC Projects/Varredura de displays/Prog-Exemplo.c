unsigned contador=0,contador_bcd=0,temp1,lim_inf=10,lim_sup=20;
unsigned short unidade,dezena,centena,milhar,display=0,overflow=0;

unsigned short sete_segmentos(unsigned valor);
void interrupt();

void main()
{

// Configuração dos PORTs
      TRISA = 0x01;        // RA0 entrada, demais bits saida
      adcon1 = 0x07;       // Para o caso de utilizar o PORTA como saída digital
      TRISB = 0x00;        // PORTB saida
      TRISC = 0x00;        // PORTC saida
      TRISE.PSPMODE=0;     // Desliga o PSP Mode do PORTD
      TRISD = 0x00;        // PORTD saida
 
 // Configuração do Timer0
      INTCON=0x20;         //Habilita interrupção do Timer0
      OPTION_REG=0x07;     //Configura o Timer0 com prescaler 1:256
      INTCON.GIE=1;

 // Rotina Principal
      while(1)
      {
             // Verifica se o valor da contagem ultrapassou 9999
             if(contador >= 9999) overflow=1;
             else overflow=0;
             
             // Verifica se o valor da contagem está dentro dos limites
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
             
             // Incremento do contador por pulsos em RA0 (borda de subida)
             while(PORTA.RA0==0);
             contador++;
             while(PORTA.RA0==1);

      }
}

// Rotina de tratamento da interrupção
void interrupt()
{
  if (INTCON.TMR0IF) // Verifica se a interrupção foi do Timer0
  {
     contador_bcd = Dec2Bcd16(contador);// Converte contador (16 bits) para BCD
     temp1 = contador_bcd;
     unidade = temp1 & 0x000F; // Filtra a unidade (4 bits)
     temp1 = temp1 >> 4;   // Rotaciona 4 bits para a esquerda
     dezena=temp1&0x000F;  // Filtra a dezena (4 bits)
     temp1 = temp1 >> 4;
     centena=temp1&0x000F; // Filtra a centena (4 bits)
     temp1 = temp1 >> 4;
     milhar=temp1&0x000F;  // Filtra o milhar (4 bits)


     // Verifica qual display receberá atualização pelo PORTB
     switch(display)
     {
         case 0: PORTC=0x0E;  //Display 4 (unidade)
                 PORTB=sete_segmentos(unidade);
                 break;
         case 1: PORTC=0x0D;  //Display 3 (dezena)
                 PORTB=sete_segmentos(dezena);
                 break;
         case 2: PORTC=0x0B;  //Display 2 (centena)
                 PORTB=sete_segmentos(centena);
                 break;
         case 3: PORTC=0x07;  //Display 1 (milhar)
                 PORTB=sete_segmentos(milhar);
                 break;
     }
     
     // Aponta para o próximo display a ser atualizado
     if(++display == 4) display = 0;  //Após o display da unidade, aponta para
                                      // o milhar
     INTCON.TMR0IF = 0; // Desliga o flag da interrupção do Timer0
  }
}

unsigned short sete_segmentos(unsigned valor)
{
         if(overflow==1) return (0xDC); //Overflow 'o.'

         switch(valor)
         {
             case 0: return (0x3F); //Algarismo '0'
             case 1: return (0x06); //Algarismo '1'
             case 2: return (0x5B); //Algarismo '2'
             case 3: return (0x4F); //Algarismo '3'
             case 4: return (0x66); //Algarismo '4'
             case 5: return (0x6D); //Algarismo '5'
             case 6: return (0x7D); //Algarismo '6'
             case 7: return (0x07); //Algarismo '7'
             case 8: return (0x7F); //Algarismo '8'
             case 9: return (0x6F); //Algarismo '9'
         }

}