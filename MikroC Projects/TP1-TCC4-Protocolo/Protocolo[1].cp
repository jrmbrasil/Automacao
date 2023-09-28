#line 1 "C:/Users/José Roberto/Documents/MikroC Projects/TP1-TCC4-Protocolo/Protocolo.c"
void main()
{
 char PACOTE[4],cmd,id,endereco;
 int pos;

 adcon1=6;
 trise=7;
 trisb=0;
 trisc.B6=0;
 trisc.B7=1;
 trisd=0;

 portb=1;
 portc=0;
 portd=0;

 UART1_Init(19200);
 Delay_ms(100);

 while (1)
 {
 endereco=(PORTE&0x07)+0x30;

 PACOTE[0]=0;
 PACOTE[1]=0;
 PACOTE[2]=0;
 if (UART1_Data_Ready()==1)
 {

 UART1_Read_Text(PACOTE,"x",4);
 id=PACOTE[0];
 cmd=PACOTE[1];
 portd=id;
 if(id==endereco)
 {
 if(PACOTE[1]=='L')
 {
 RB0_bit=0;
 PACOTE[1]='1';
 }
 else
 {
 RB0_bit=1;
 PACOTE[1]='0';
 }
 PACOTE[0]=endereco;
 PACOTE[2]=0;

 UART1_Write_Text(PACOTE);
 }

 }

 }
}
