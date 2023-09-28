#line 1 "C:/Documents and Settings/jmarques/Meus documentos/MikroC Projects/MCC4-SP3-PROG1.c"

void main()
{
 TRISA=0xFF;
 TRISB=0;
 ADCON1=0x06;
 while(1) PORTB=PORTA;
}
