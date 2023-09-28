
_main:

;Prog1.c,40 :: 		void main()
;Prog1.c,42 :: 		TRISA = 0x00;          // set direction to be output
	CLRF       TRISA+0
;Prog1.c,43 :: 		TRISB = 0x00;          // set direction to be output
	CLRF       TRISB+0
;Prog1.c,44 :: 		TRISC = 0x00;          // set direction to be output
	CLRF       TRISC+0
;Prog1.c,45 :: 		TRISD = 0x00;          // set direction to be output
	CLRF       TRISD+0
;Prog1.c,48 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Prog1.c,49 :: 		Lcd_Cmd(_LCD_TURN_ON);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Prog1.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Prog1.c,56 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Prog1.c,57 :: 		do
L_main0:
;Prog1.c,59 :: 		ByteToStr(PORTC,contador);
	MOVF       PORTC+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _contador+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Prog1.c,60 :: 		Lcd_Out(1,1,contador);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _contador+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Prog1.c,61 :: 		Delay_ms(500);      // 0.5 second delay
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Prog1.c,62 :: 		PORTC++;
	INCF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Prog1.c,64 :: 		while(1);            // Endless loop
	GOTO       L_main0
;Prog1.c,65 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
