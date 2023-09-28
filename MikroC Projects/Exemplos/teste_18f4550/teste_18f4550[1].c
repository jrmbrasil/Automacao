 #define true   1
 #define false  0
//#pragma orgall 0x1000
//#pragma interrupt_low 0x1008
//#pragma SetPage(PAGE0, 0x01000, 0x7FFF)
//void Interrupt_low () org 0x1018;
//void Interrupt() org 0x1008;
 //interrup vector at 0x1008;
 //code 0x00
// void reset() org 0x1000 {
 //  asm {goto 0x10e6}
//   }

//void (*app_start)(void) = 0x1000;


////void app_start (void) {   asm {goto 0x1050 }  }

//const init_vector() org 0x1000;
//const init_vector() org 0x1000 {
    //  asm {goto 0x1050 }
//void main_bootloader(void);

//void main() org 0x1000 {
 //asm { nop }
 ////

void main() org 0x1000 {
       TRISA = 0x0F;
       TRISB = 0;
       TRISC = 0;
       TRISD = 0;
       TRISE = 0;

      // init_vector();
       while(true) {
        asm { bsf PORTD,2}

       
       }


}
