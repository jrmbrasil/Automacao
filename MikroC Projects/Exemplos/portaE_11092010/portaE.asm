
_main:

;portaE.c,5 :: 		void main()
;portaE.c,7 :: 		TRISA = 0b00001111;
	MOVLW      15
	MOVWF      TRISA+0
;portaE.c,8 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;portaE.c,9 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;portaE.c,10 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;portaE.c,11 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;portaE.c,12 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;portaE.c,14 :: 		PORTB = 0;
	CLRF       PORTB+0
;portaE.c,17 :: 		while (true)
L_main0:
;portaE.c,19 :: 		if(PORTA.F0 && PORTA.F1) PORTB.F1 = 1;
	BTFSS      PORTA+0, 0
	GOTO       L_main4
	BTFSS      PORTA+0, 1
	GOTO       L_main4
L__main6:
	BSF        PORTB+0, 1
	GOTO       L_main5
L_main4:
;portaE.c,20 :: 		else  PORTB.F1 = 0;
	BCF        PORTB+0, 1
L_main5:
;portaE.c,21 :: 		}
	GOTO       L_main0
;portaE.c,25 :: 		}
	GOTO       $+0
; end of _main
