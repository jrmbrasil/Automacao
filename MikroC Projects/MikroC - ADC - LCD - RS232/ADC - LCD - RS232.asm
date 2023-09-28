
_main:

;ADC - LCD - RS232.c,23 :: 		void main()
;ADC - LCD - RS232.c,25 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;ADC - LCD - RS232.c,26 :: 		TRISC.B6=0;                 // PORTC is output
	BCF        TRISC+0, 6
;ADC - LCD - RS232.c,27 :: 		TRISC.B7=1;                 // PORTC is entrada
	BSF        TRISC+0, 7
;ADC - LCD - RS232.c,28 :: 		TRISB  = 0;                 // PORTB is output
	CLRF       TRISB+0
;ADC - LCD - RS232.c,30 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;ADC - LCD - RS232.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC - LCD - RS232.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC - LCD - RS232.c,33 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC - LCD - RS232.c,35 :: 		UART1_Init(57600);
	MOVLW      21
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ADC - LCD - RS232.c,36 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;ADC - LCD - RS232.c,38 :: 		while(1)
L_main1:
;ADC - LCD - RS232.c,40 :: 		temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ADC - LCD - RS232.c,41 :: 		result=(5.0/1024.0)*temp_res;
	CALL       _Word2Double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _result+0
	MOVF       R0+1, 0
	MOVWF      _result+1
	MOVF       R0+2, 0
	MOVWF      _result+2
	MOVF       R0+3, 0
	MOVWF      _result+3
;ADC - LCD - RS232.c,42 :: 		FloatToStr(result, txt2);  // txt is "-374.2"
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt2+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;ADC - LCD - RS232.c,44 :: 		txt3=strcat(txt2," Volts\0");
	MOVLW      _txt2+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr1_ADC_32_45_32LCD_32_45_32RS232+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
	MOVF       R0+0, 0
	MOVWF      _txt3+0
;ADC - LCD - RS232.c,45 :: 		Lcd_Out(2,1,txt3);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC - LCD - RS232.c,46 :: 		Delay_ms(1000);
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
;ADC - LCD - RS232.c,48 :: 		UART1_Write_Text(txt3);
	MOVF       _txt3+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ADC - LCD - RS232.c,49 :: 		}
	GOTO       L_main1
;ADC - LCD - RS232.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
