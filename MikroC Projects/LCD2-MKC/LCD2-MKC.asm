
_main:

;LCD2-MKC.c,24 :: 		void main()
;LCD2-MKC.c,27 :: 		Lcd_Init();                        // Inicializa o LCD
	CALL       _Lcd_Init+0
;LCD2-MKC.c,28 :: 		Delay_ms(1000);
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
;LCD2-MKC.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,31 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;LCD2-MKC.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Desliga o cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,33 :: 		Lcd_Out(1,6,txt3);                 // Escreve texto na posição: linha=1,coluna=6
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD2-MKC.c,34 :: 		Delay_ms(4000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LCD2-MKC.c,35 :: 		Lcd_Out(2,6,txt4);                 // Escreve texto na posição: linha=2,coluna=6
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD2-MKC.c,36 :: 		Delay_ms(4000);                    // Atraso de 2 segundos
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;LCD2-MKC.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpa o display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,38 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;LCD2-MKC.c,40 :: 		Lcd_Out(1,1,txt1);                 // Escreve texto na posição: linha=1,coluna=1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD2-MKC.c,41 :: 		Delay_ms(4000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;LCD2-MKC.c,42 :: 		Lcd_Out(2,5,txt2);                 // Escreve texto na posição: linha=2,coluna=5
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD2-MKC.c,44 :: 		Delay_ms(4000);                    // Atraso de 2 segundos
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;LCD2-MKC.c,47 :: 		for(i=0; i<4; i++) {               // Desloca o texto para a direita 4 vezes
	CLRF       _i+0
L_main7:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;LCD2-MKC.c,48 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,49 :: 		Delay_ms(1000);                   // Atraso de 0,5 segundo
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
;LCD2-MKC.c,47 :: 		for(i=0; i<4; i++) {               // Desloca o texto para a direita 4 vezes
	INCF       _i+0, 1
;LCD2-MKC.c,50 :: 		}
	GOTO       L_main7
L_main8:
;LCD2-MKC.c,52 :: 		while(1) {                         // Loop infinito
L_main11:
;LCD2-MKC.c,53 :: 		for(i=0; i<8; i++) {             // Desloca o texto para a esquerda 7 vezes
	CLRF       _i+0
L_main13:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;LCD2-MKC.c,54 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,55 :: 		Delay_ms(1000);                 // Atraso de 0,5 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;LCD2-MKC.c,53 :: 		for(i=0; i<8; i++) {             // Desloca o texto para a esquerda 7 vezes
	INCF       _i+0, 1
;LCD2-MKC.c,56 :: 		}
	GOTO       L_main13
L_main14:
;LCD2-MKC.c,58 :: 		for(i=0; i<8; i++) {             // Desloca o texto para a direita 7 vezes
	CLRF       _i+0
L_main17:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;LCD2-MKC.c,59 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD2-MKC.c,60 :: 		Delay_ms(1000);                 // Atraso de 0,5 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;LCD2-MKC.c,58 :: 		for(i=0; i<8; i++) {             // Desloca o texto para a direita 7 vezes
	INCF       _i+0, 1
;LCD2-MKC.c,61 :: 		}
	GOTO       L_main17
L_main18:
;LCD2-MKC.c,62 :: 		}
	GOTO       L_main11
;LCD2-MKC.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
