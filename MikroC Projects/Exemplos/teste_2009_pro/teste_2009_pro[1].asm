
_main:

;teste_2009_pro.c,1 :: 		void main() {
;teste_2009_pro.c,2 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;teste_2009_pro.c,4 :: 		}
	GOTO       $+0
; end of _main
