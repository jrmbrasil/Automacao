#line 1 "C:/Users/José Roberto/Documents/Mikro C Projects/LCD/LCD.c"
#line 21 "C:/Users/José Roberto/Documents/Mikro C Projects/LCD/LCD.c"
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

 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;


 LCD_inicializa();
 LCD_ligar();
 temp = 0;
 do
 {
 PORTB=temp;
 ByteToStr(PORTB,contador);
 LCD_mensagem(1,1,contador);
 Delay_ms(500);
 temp++;
 }
 while(1);
}

void LCD_inicializa(void)
{
 LCD_RS=0;

 LCD_escreve(0b00111000);



 Delay_ms(1000);
 LCD_RS=1;
}

void LCD_escreve(unsigned char valor)
{
  PORTB =valor;
 Delay_us(1);

 LCD_EN=1;
 Delay_us(2);
 LCD_EN=0;

 Delay_ms(2);

}

void LCD_mensagem(unsigned char linha,unsigned char coluna,unsigned char mensagem[])
{
 unsigned char posicao;
 int cont;


 if(linha<=2)
 {
 LCD_RS=0;
 LCD_limpar();

 if(linha==1) posicao=0x80+coluna-1;
 else if(linha==2)posicao=0xC0+coluna-1;

 LCD_escreve(posicao);
 LCD_RS=1;

 for(cont=0;mensagem[cont]!=0;cont++)
 LCD_escreve(mensagem[cont]);
 }
}

void LCD_limpar(void)
{
 LCD_RS=0;
 LCD_escreve(0x01);
 LCD_RS=1;
}

void LCD_ligar(void)
{
 LCD_RS=0;

 LCD_escreve(0b00001100);




 Delay_ms(1000);
 LCD_RS=1;
}
