#line 1 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/teste_18f4550/teste_18f4550.c"
#line 28 "C:/Users/paulo/temp/microcontroladorPOS/c/mikroC/teste_18f4550/teste_18f4550.c"
void main() org 0x1000 {
 TRISA = 0x0F;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 while( 1 ) {
 asm { bsf PORTD,2}


 }


}
