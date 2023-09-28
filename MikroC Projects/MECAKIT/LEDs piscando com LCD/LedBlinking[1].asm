
_main:

;LedBlinking.c,20 :: 		void main()
;LedBlinking.c,23 :: 		ADCON1=0B00001110;    // AN0 habilitado (somente)
	MOVLW      14
	MOVWF      ADCON1+0
;LedBlinking.c,24 :: 		TRISA = 0;           // RB0: entrada analógica (ADCON1)- RB1 a RB5: saída digital
	CLRF       TRISA+0
;LedBlinking.c,25 :: 		TRISB = 0;           // set direction to be output
	CLRF       TRISB+0
;LedBlinking.c,26 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,27 :: 		TRISD = 0;           // set direction to be output
	CLRF       TRISD+0
;LedBlinking.c,28 :: 		TRISE = 0;           // set direction to be output
	CLRF       TRISE+0
;LedBlinking.c,30 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LedBlinking.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LedBlinking.c,36 :: 		do
L_main0:
;LedBlinking.c,38 :: 		PORTD=0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;LedBlinking.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LedBlinking.c,40 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LedBlinking.c,41 :: 		Delay_ms(1000);
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
;LedBlinking.c,43 :: 		PORTD=0;
	CLRF       PORTD+0
;LedBlinking.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LedBlinking.c,45 :: 		Lcd_Out(2,1,txt2);                 // Write text in first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LedBlinking.c,46 :: 		Delay_ms(1000);    // 1 second delay
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
;LedBlinking.c,48 :: 		while(1);          // Endless loop
	GOTO       L_main0
;LedBlinking.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
