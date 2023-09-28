
_main:

;MyProject.c,30 :: 		void main()
;MyProject.c,32 :: 		ADCON1=0b00001110;
	MOVLW      14
	MOVWF      ADCON1+0
;MyProject.c,34 :: 		TRISD=0;
	CLRF       TRISD+0
;MyProject.c,35 :: 		PORTD=1;
	MOVLW      1
	MOVWF      PORTD+0
;MyProject.c,36 :: 		Delay_ms(200);               // Atraso de 0,2 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;MyProject.c,37 :: 		Lcd_Init();                        // Inicializa o LCD
	CALL       _Lcd_Init+0
;MyProject.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,40 :: 		while(1)                          // Loop infinito
L_main1:
;MyProject.c,42 :: 		contador2=256;
	MOVLW      0
	MOVWF      _contador2+0
	MOVLW      1
	MOVWF      _contador2+1
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,46 :: 		Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,48 :: 		for(contador1=0; contador1<256; contador1++) // Desloca o texto para a esquerda 7 vezes
	CLRF       _contador1+0
	CLRF       _contador1+1
L_main3:
	MOVLW      128
	XORWF      _contador1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	SUBWF      _contador1+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,50 :: 		IntToStr(contador1,valor1);
	MOVF       _contador1+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _contador1+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _valor1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,51 :: 		Ltrim(valor1);
	MOVLW      _valor1+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;MyProject.c,52 :: 		Lcd_Out(1,7,valor1);          // Escreve texto na posição: linha=1,coluna=10
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _valor1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,54 :: 		Delay_ms(200);               // Atraso de 0,2 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,55 :: 		contador2--;
	MOVLW      1
	SUBWF      _contador2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _contador2+1, 1
;MyProject.c,56 :: 		IntToStr(contador2,valor2);
	MOVF       _contador2+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _contador2+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _valor2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,57 :: 		Ltrim(valor2);
	MOVLW      _valor2+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;MyProject.c,58 :: 		if(contador2==99 || contador2==9)
	MOVLW      0
	XORWF      _contador2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      99
	XORWF      _contador2+0, 0
L__main15:
	BTFSC      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      _contador2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      9
	XORWF      _contador2+0, 0
L__main16:
	BTFSC      STATUS+0, 2
	GOTO       L__main12
	GOTO       L_main9
L__main12:
;MyProject.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,61 :: 		Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,63 :: 		Lcd_Out(2,1,txt2);                 // Escreve texto na posição: linha=2,coluna=1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,65 :: 		}
L_main9:
;MyProject.c,66 :: 		Lcd_Out(2,7,valor2);          // Escreve texto na posição: linha=1,coluna=10
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _valor2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,68 :: 		Delay_ms(200);               // Atraso de 0,2 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;MyProject.c,70 :: 		PORTD=PORTD<<1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MyProject.c,71 :: 		if(PORTD==0)
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;MyProject.c,73 :: 		PORTD=1;
	MOVLW      1
	MOVWF      PORTD+0
;MyProject.c,74 :: 		}
L_main11:
;MyProject.c,48 :: 		for(contador1=0; contador1<256; contador1++) // Desloca o texto para a esquerda 7 vezes
	INCF       _contador1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador1+1, 1
;MyProject.c,76 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,77 :: 		}
	GOTO       L_main1
;MyProject.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
