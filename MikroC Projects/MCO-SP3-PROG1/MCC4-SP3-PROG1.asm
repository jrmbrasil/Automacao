
_main:

;MCC4-SP3-PROG1.c,2 :: 		void main()
;MCC4-SP3-PROG1.c,4 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;MCC4-SP3-PROG1.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;MCC4-SP3-PROG1.c,6 :: 		ADCON1=0x06;        //Todos os bits do PORTA serão entradas digitais
	MOVLW      6
	MOVWF      ADCON1+0
;MCC4-SP3-PROG1.c,7 :: 		while(1) PORTB=PORTA;
L_main0:
	MOVF       PORTA+0, 0
	MOVWF      PORTB+0
	GOTO       L_main0
;MCC4-SP3-PROG1.c,8 :: 		}
	GOTO       $+0
; end of _main
