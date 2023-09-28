#line 1 "C:/Users/Jose Roberto/Desktop/Programa motor bipolar que inverte os lados/movimentação teste.c"
 int direita,esquerda,contador;




 void main()
 {
 trisa = 0b00000011;
 trisb = 0b00000000;
 portb = 0b00000000;

 while(1)
 {
 contador=0;
 while( porta.f0 ==1)
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
 while( porta.f1 ==1)
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
