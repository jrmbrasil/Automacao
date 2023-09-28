
_main:

;LCD-Contador.c,24 :: 		void main()
;LCD-Contador.c,27 :: 		Lcd_Init();                        // Inicializa o LCD
	CALL       _Lcd_Init+0
;LCD-Contador.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Contador.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD-Contador.c,34 :: 		Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Contador.c,35 :: 		Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Contador.c,38 :: 		Delay_ms(500);                    // Atraso de 0,5 segundo
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
;LCD-Contador.c,39 :: 		contador2=65535;
	MOVLW      0
	MOVWF      _contador2+0
	MOVLW      255
	MOVWF      _contador2+1
	MOVLW      127
	MOVWF      _contador2+2
	MOVLW      142
	MOVWF      _contador2+3
;LCD-Contador.c,40 :: 		while(1)                          // Loop infinito
L_main1:
;LCD-Contador.c,42 :: 		for(contador1=0; contador1<65536; contador1++) // Desloca o texto para a esquerda 7 vezes
	CLRF       _contador1+0
	CLRF       _contador1+1
L_main3:
	MOVLW      128
	BTFSC      _contador1+1, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	BTFSC      _contador1+1, 7
	MOVLW      255
	MOVWF      R0+0
	MOVLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	SUBWF      _contador1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	SUBWF      _contador1+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;LCD-Contador.c,44 :: 		IntToStr(contador1,valor1);
	MOVF       _contador1+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _contador1+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _valor1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;LCD-Contador.c,45 :: 		Lcd_Out(1,10,valor1);          // Escreve texto na posição: linha=1,coluna=10
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _valor1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Contador.c,46 :: 		Delay_ms(300);               // Atraso de 0,2 segundo
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;LCD-Contador.c,48 :: 		contador2/=2;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _contador2+0, 0
	MOVWF      R0+0
	MOVF       _contador2+1, 0
	MOVWF      R0+1
	MOVF       _contador2+2, 0
	MOVWF      R0+2
	MOVF       _contador2+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _contador2+0
	MOVF       R0+1, 0
	MOVWF      _contador2+1
	MOVF       R0+2, 0
	MOVWF      _contador2+2
	MOVF       R0+3, 0
	MOVWF      _contador2+3
;LCD-Contador.c,49 :: 		FloatToStr(contador2,valor2);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _valor2+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;LCD-Contador.c,50 :: 		Lcd_Out(2,10,valor2);          // Escreve texto na posição: linha=1,coluna=10
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _valor2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD-Contador.c,51 :: 		Delay_ms(300);               // Atraso de 0,2 segundo
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;LCD-Contador.c,42 :: 		for(contador1=0; contador1<65536; contador1++) // Desloca o texto para a esquerda 7 vezes
	INCF       _contador1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador1+1, 1
;LCD-Contador.c,54 :: 		}
	GOTO       L_main3
L_main4:
;LCD-Contador.c,55 :: 		}
	GOTO       L_main1
;LCD-Contador.c,56 :: 		}
	GOTO       $+0
; end of _main
