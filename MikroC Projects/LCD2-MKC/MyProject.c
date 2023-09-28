#define direito porta.B0
#define esquerdaa portta.B1

void main()
{
        int dois;

        trisa = 0b00000011;
        trisb = 0b00000100;
        portb=  0b00000000;


        while(1)
        {

                if(dois==1)
                {
                              portb=0b00000001;
                              delay_ms(300);
                              portb=0b00010000;
                              delay_ms(300);
                }
        }
}