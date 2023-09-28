
#include "base_12F.h"





void    interrupt   () ;
int valor_adc;
unsigned int t;

void pwm(unsigned int fr) {  t =  fr;         }

void main()
{

        TRISIO = 0b00000001;
        PIE1.TMR1IE = 1;
        INTCON.PEIE = 1;
        //adc_analogs(NO_ANALOGS);
        ansel = 1;  //GPIO_0 entrada analógica

        timer_1_setup(T1_DIV_4);
        //set_timer_1(65535 - 500 );
        //while(1);
        TMR1H = 0xFD;
        TMR1L = 0xE8;
        //set_timer_1(65000);
        timer_1_on();
        //GP2_bit = 1;
        GPIO.f2 =1;

        INTCON.GIE = 1;
        //adc_setup(ANS0_PIN, ADC_CLOCK_DIV_16);
        //adc_set_channel(ADC_CHANNEL_0);
        //adc_on();
        //valor_adc = adc_read_value();

        while(1)
       {
           valor_adc = adc_read(0);
           //delay_ms(10);

        }

}


void interrupt ()
        {
                INTCON.GIE =0;


                if (PIR1.TMR1IF)
                        {
                              if(valor_adc>100 && valor_adc < 1020)
                               {
                                if(GPIO.f2)    {
                                                timer_1_off();
                                                GPIO.f2 = 0;
                                                set_timer_1(65535 - (1024-valor_adc));
                                                timer_1_on();

                                }
                                else   {
                                                timer_1_off();
                                                GPIO.f2 = 1;
                                                set_timer_1(65535 - (valor_adc-1));
                                                timer_1_on();
                                }
                                
                               }
                               
                              if(valor_adc < 100) GPIO.f2 = 0;
                              if (valor_adc > 1020)  GPIO.f2 = 1;
                              
                               
                               
                        }
                PIR1.TMR1IF = 0;
                INTCON.GIE =1;
        }
