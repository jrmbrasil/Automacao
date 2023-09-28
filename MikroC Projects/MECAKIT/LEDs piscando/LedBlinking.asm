
_main:

;LedBlinking.c,1 :: 		void main()
;LedBlinking.c,4 :: 		ADCON1=0B00001110;    // AN0 habilitado (somente)
	MOVLW      14
	MOVWF      ADCON1+0
;LedBlinking.c,5 :: 		TRISA = 0;           // RB0: entrada analógica (ADCON1)- RB1 a RB5: saída digital
	CLRF       TRISA+0
;LedBlinking.c,6 :: 		TRISB = 0;           // set direction to be output
	CLRF       TRISB+0
;LedBlinking.c,7 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,8 :: 		TRISD = 0;           // set direction to be output
	CLRF       TRISD+0
;LedBlinking.c,9 :: 		TRISE = 0;           // set direction to be output
	CLRF       TRISE+0
;LedBlinking.c,11 :: 		do
L_main0:
;LedBlinking.c,13 :: 		PORTD=0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;LedBlinking.c,14 :: 		Delay_ms(1000);    // 1 second delay
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;LedBlinking.c,16 :: 		PORTD=0;
	CLRF       PORTD+0
;LedBlinking.c,17 :: 		Delay_ms(1000);    // 1 second delay
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;LedBlinking.c,19 :: 		while(1);          // Endless loop
	GOTO       L_main0
;LedBlinking.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
