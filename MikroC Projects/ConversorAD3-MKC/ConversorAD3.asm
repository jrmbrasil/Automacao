
_main:

;ConversorAD3.c,17 :: 		void main()
;ConversorAD3.c,19 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;ConversorAD3.c,20 :: 		TRISC  = 0;                 // PORTC is output
	CLRF       TRISC+0
;ConversorAD3.c,21 :: 		TRISB  = 0;                 // PORTB is output
	CLRF       TRISB+0
;ConversorAD3.c,23 :: 		do
L_main0:
;ConversorAD3.c,26 :: 		temp_res = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ConversorAD3.c,28 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ConversorAD3.c,29 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTC+0
;ConversorAD3.c,30 :: 		} while(1);
	GOTO       L_main0
;ConversorAD3.c,32 :: 		}
	GOTO       $+0
; end of _main
