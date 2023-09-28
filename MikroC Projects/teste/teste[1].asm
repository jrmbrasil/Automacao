
_main:

;teste.c,1 :: 		void main()
;teste.c,3 :: 		trisb=0;
	CLRF       TRISB+0
;teste.c,5 :: 		while(1)
L_main0:
;teste.c,7 :: 		portb=0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;teste.c,8 :: 		}
	GOTO       L_main0
;teste.c,10 :: 		}
	GOTO       $+0
; end of _main
