  int direita,esquerda,contador;

  #define direita porta.f0
  #define esquerda porta.f1

  void main()
  {
      trisa = 0b00000011;
      trisb = 0b00000000;
      portb = 0b00000000;

      while(1)
      {
              contador=0;
              while(direita==1)
              {
                   while(contador<10)
                   {
                        portb=0b00001000;
                        delay_ms(100);
                        portb=0b00000100;
                        delay_ms(100);
                        portb=0b00000010;
                        delay_ms(100);
                        portb=0b00000001;
                        delay_ms(100);
                        contador++;
                   }
               }
               contador=0;
               while(esquerda==1)
              {
                   while(contador<10)
                   {
                        portb=0b00000001;
                        delay_ms(100);
                        portb=0b00000010;
                        delay_ms(100);
                        portb=0b00000100;
                        delay_ms(100);
                        portb=0b00001000;
                        delay_ms(100);
                        contador++;
                   }
               }
      }

  }