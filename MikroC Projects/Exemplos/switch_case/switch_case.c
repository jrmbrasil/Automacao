#define     true    1
#define     false   0

#define     OR      0x01
#define     AND     0x02
#define     NOR     0x06
#define     NAND    0x05
#define     XOR     0x03

void main() {
     char tipo_porta;
     TRISA =  0b00011111;
     TRISB =  0x00;
     TRISC =  0x00;
     TRISD =  0x00;
     TRISE =  0x00;
     ADCON1 = 0x07;   //PORTA e PORTE digitais
     PORTB  = 0x00;
     PORTC =  0x00;
     //PORTD =  &tipo_porta;
     PORTE =  0x00;
     

     while (true)
     {
     
      tipo_porta = (PORTA>>2) & 0x07;
      switch (tipo_porta)
       {
        case OR:
               PORTB.f0  = PORTA.f0 |  PORTA.f1;
               break;
               
        case AND:
               PORTB.f0  = PORTA.f0  & PORTA.f1;
               break;
               
        case NOR:
               PORTB.f0  =  ~(PORTA.f0  | PORTA.f1);
               break;
               
        case NAND:
               PORTB.f0  =  ~(PORTA.f0 &  PORTA.f1);
               break;
               
        case XOR:
               PORTB.f0  =  PORTA.f0  ^ PORTA.f1;
               break;
               
        default:
               ;
        }
      }
}
