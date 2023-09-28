
_main:

;teste_18f4550.c,28 :: 		void main() org 0x1000 {
;teste_18f4550.c,29 :: 		TRISA = 0x0F;
	MOVLW       15
	MOVWF       TRISA+0 
;teste_18f4550.c,30 :: 		TRISB = 0;
	CLRF        TRISB+0 
;teste_18f4550.c,31 :: 		TRISC = 0;
	CLRF        TRISC+0 
;teste_18f4550.c,32 :: 		TRISD = 0;
	CLRF        TRISD+0 
;teste_18f4550.c,33 :: 		TRISE = 0;
	CLRF        TRISE+0 
;teste_18f4550.c,35 :: 		while(true) {
L_main0:
;teste_18f4550.c,36 :: 		asm { bsf PORTD,2}
	BSF         PORTD+0, 2, 0
;teste_18f4550.c,39 :: 		}
	GOTO        L_main0
;teste_18f4550.c,42 :: 		}
	GOTO        $+0
; end of _main
