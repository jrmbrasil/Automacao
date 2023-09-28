
_main:

;Ex1.c,3 :: 		void main()
;Ex1.c,5 :: 		adcon1=6;    //desliga conversor ad
	MOVLW      6
	MOVWF      ADCON1+0
;Ex1.c,6 :: 		trisa=0b00111111; //porta entrada
	MOVLW      63
	MOVWF      TRISA+0
;Ex1.c,7 :: 		trisb=0b00000000; //portb saída
	CLRF       TRISB+0
;Ex1.c,8 :: 		while(1)
L_main0:
;Ex1.c,10 :: 		portb=porta;
	MOVF       PORTA+0, 0
	MOVWF      PORTB+0
;Ex1.c,11 :: 		}
	GOTO       L_main0
;Ex1.c,12 :: 		}
	GOTO       $+0
; end of _main
