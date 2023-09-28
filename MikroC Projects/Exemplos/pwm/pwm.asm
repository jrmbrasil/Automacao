
_main:

;pwm.c,5 :: 		void main() {
;pwm.c,6 :: 		TRISA = 0x0F;
	MOVLW      15
	MOVWF      TRISA+0
;pwm.c,7 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;pwm.c,8 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;pwm.c,9 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;pwm.c,10 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;pwm.c,13 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;pwm.c,15 :: 		pwm1_init(1000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,16 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;pwm.c,17 :: 		pwm1_set_duty(127);
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,19 :: 		while(1);
L_main0:
	GOTO       L_main0
;pwm.c,21 :: 		}
	GOTO       $+0
; end of _main
