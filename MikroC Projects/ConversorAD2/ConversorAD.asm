
_main:

;ConversorAD.c,21 :: 		void main()
;ConversorAD.c,23 :: 		ADCON0=0b01000001; // ADCS1   ADCS0   CHS2   CHS1   CHS0   GO/DONE   —   ADON
	MOVLW      65
	MOVWF      ADCON0+0
;ConversorAD.c,24 :: 		ADCON1=0b10100000; // ADFM    ADCS2    —      —     PCFG3  PCFG2   PCFG1 PCFG0
	MOVLW      160
	MOVWF      ADCON1+0
;ConversorAD.c,26 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;ConversorAD.c,27 :: 		TRISC  = 0;                 // PORTC is output
	CLRF       TRISC+0
;ConversorAD.c,28 :: 		TRISB  = 0;                 // PORTB is output
	CLRF       TRISB+0
;ConversorAD.c,30 :: 		do
L_main0:
;ConversorAD.c,32 :: 		ADCON0.GO_DONE=1; //Inicia a conversão AD
	BSF        ADCON0+0, 2
;ConversorAD.c,33 :: 		while(ADCON0.GO_DONE == 1); //Espera a conversão ser concluída
L_main3:
	BTFSS      ADCON0+0, 2
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;ConversorAD.c,34 :: 		Delay_us(4); // Delay de 2.TAD = 4us após a conversão
	NOP
	NOP
	NOP
	NOP
;ConversorAD.c,37 :: 		temp_res = temp_res << 8;
	MOVF       _temp_res+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ConversorAD.c,38 :: 		temp_res += ADRESL;
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      _temp_res+0
	MOVF       R3+1, 0
	MOVWF      _temp_res+1
;ConversorAD.c,40 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF       R3+0, 0
	MOVWF      PORTB+0
;ConversorAD.c,41 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF       R3+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;ConversorAD.c,42 :: 		} while(1);
	GOTO       L_main0
;ConversorAD.c,44 :: 		}
	GOTO       $+0
; end of _main
