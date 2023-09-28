
_main:

;SERIAL-BÁSICA-MICROC.c,20 :: 		void main()
;SERIAL-BÁSICA-MICROC.c,22 :: 		TRISC = 0;
	CLRF       TRISC+0
;SERIAL-BÁSICA-MICROC.c,23 :: 		TRISE.RE2 = 0;
	BCF        TRISE+0, 2
;SERIAL-BÁSICA-MICROC.c,24 :: 		TRISC=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;SERIAL-BÁSICA-MICROC.c,25 :: 		ADCON1 = 0b00000110;
	MOVLW      6
	MOVWF      ADCON1+0
;SERIAL-BÁSICA-MICROC.c,26 :: 		RW = 0;
	BCF        RE2_bit+0, 2
;SERIAL-BÁSICA-MICROC.c,27 :: 		TRISD0_bit = 0;
	BCF        TRISD0_bit+0, 0
;SERIAL-BÁSICA-MICROC.c,28 :: 		TRISD1_bit = 0;
	BCF        TRISD1_bit+0, 1
;SERIAL-BÁSICA-MICROC.c,29 :: 		TRISD2_bit = 0;
	BCF        TRISD2_bit+0, 2
;SERIAL-BÁSICA-MICROC.c,30 :: 		TRISD3_bit = 0;
	BCF        TRISD3_bit+0, 3
;SERIAL-BÁSICA-MICROC.c,31 :: 		TRISA=0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;SERIAL-BÁSICA-MICROC.c,32 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SERIAL-BÁSICA-MICROC.c,33 :: 		Delay_ms(100);
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
;SERIAL-BÁSICA-MICROC.c,34 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;SERIAL-BÁSICA-MICROC.c,35 :: 		Lcd_cmd(0x0C);        //sem cursor piscante e deslocamento para direita
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL-BÁSICA-MICROC.c,36 :: 		Lcd_cmd(0x01);        // limpeza do lcd  e posicionando linha 1, coluna 1.
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL-BÁSICA-MICROC.c,37 :: 		delay_ms(2);          // aguardando tempo exigido pelo lcd 1602
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;SERIAL-BÁSICA-MICROC.c,38 :: 		Lcd_out(1,2,"MOTOR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,39 :: 		Lcd_out(2,2,"DESLIGADO!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,40 :: 		UART1_Write_Text("AGUARDANDO COMANDO A OU H");
	MOVLW      ?lstr3_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SERIAL-BÁSICA-MICROC.c,41 :: 		PORTD.RD0 =0;
	BCF        PORTD+0, 0
;SERIAL-BÁSICA-MICROC.c,42 :: 		PORTD.RD1 =0;
	BCF        PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,43 :: 		PORTD.RD2 =0;
	BCF        PORTD+0, 2
;SERIAL-BÁSICA-MICROC.c,44 :: 		PORTD.RD3 =0;
	BCF        PORTD+0, 3
;SERIAL-BÁSICA-MICROC.c,47 :: 		while(1)
L_main2:
;SERIAL-BÁSICA-MICROC.c,49 :: 		if(UART1_Data_ready () == 1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;SERIAL-BÁSICA-MICROC.c,51 :: 		recebido = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recebido+0
;SERIAL-BÁSICA-MICROC.c,52 :: 		if((recebido == 'D')||(recebido == 'd'))
	MOVF       R0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	MOVF       _recebido+0, 0
	XORLW      100
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	GOTO       L_main7
L__main22:
;SERIAL-BÁSICA-MICROC.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL-BÁSICA-MICROC.c,55 :: 		PORTD.RD0 = 0;
	BCF        PORTD+0, 0
;SERIAL-BÁSICA-MICROC.c,56 :: 		PORTD.RD1 = 0;
	BCF        PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,57 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;SERIAL-BÁSICA-MICROC.c,58 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;SERIAL-BÁSICA-MICROC.c,59 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;SERIAL-BÁSICA-MICROC.c,60 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;SERIAL-BÁSICA-MICROC.c,61 :: 		Lcd_out(1,2,"MOTOR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,62 :: 		Lcd_out(2,2,"DESLIGADO");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,63 :: 		UART1_Write_Text("\n\r");
	MOVLW      ?lstr6_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SERIAL-BÁSICA-MICROC.c,64 :: 		}
L_main7:
;SERIAL-BÁSICA-MICROC.c,65 :: 		if((recebido == 'H')||(recebido == 'h'))
	MOVF       _recebido+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L__main21
	MOVF       _recebido+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L__main21
	GOTO       L_main10
L__main21:
;SERIAL-BÁSICA-MICROC.c,66 :: 		{PORTC.RC2 = 1;
	BSF        PORTC+0, 2
;SERIAL-BÁSICA-MICROC.c,67 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;SERIAL-BÁSICA-MICROC.c,68 :: 		PORTD.RD2 = 1;
	BSF        PORTD+0, 2
;SERIAL-BÁSICA-MICROC.c,69 :: 		PORTD.RD1 = 0;
	BCF        PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,70 :: 		PORTD.RD0 = 0;
	BCF        PORTD+0, 0
;SERIAL-BÁSICA-MICROC.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL-BÁSICA-MICROC.c,72 :: 		Lcd_out(1,2,"MOTOR SENTIDO");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,73 :: 		Lcd_out(2,2,"HORARIO!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,74 :: 		UART1_Write_Text("\n\r");
	MOVLW      ?lstr9_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SERIAL-BÁSICA-MICROC.c,76 :: 		while(a<=20)
L_main11:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _a+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       _a+0, 0
	SUBLW      20
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;SERIAL-BÁSICA-MICROC.c,78 :: 		PORTD.RD3 = ~PORTD.RD3;
	MOVLW      8
	XORWF      PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,79 :: 		PORTD.RD1 = ~PORTD.RD1;
	MOVLW      2
	XORWF      PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,81 :: 		a++;
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;SERIAL-BÁSICA-MICROC.c,82 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;SERIAL-BÁSICA-MICROC.c,83 :: 		}
	GOTO       L_main11
L_main12:
;SERIAL-BÁSICA-MICROC.c,84 :: 		}
L_main10:
;SERIAL-BÁSICA-MICROC.c,85 :: 		if((recebido == 'a') || (recebido == 'A'))
	MOVF       _recebido+0, 0
	XORLW      97
	BTFSC      STATUS+0, 2
	GOTO       L__main20
	MOVF       _recebido+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__main20
	GOTO       L_main16
L__main20:
;SERIAL-BÁSICA-MICROC.c,87 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;SERIAL-BÁSICA-MICROC.c,88 :: 		PORTC.RC2 = 0;
	BCF        PORTC+0, 2
;SERIAL-BÁSICA-MICROC.c,89 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;SERIAL-BÁSICA-MICROC.c,90 :: 		PORTD.RD1 = 1;
	BSF        PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,91 :: 		PORTD.RD0 = 1;
	BSF        PORTD+0, 0
;SERIAL-BÁSICA-MICROC.c,92 :: 		PORTD.RD2 = 0;
	BCF        PORTD+0, 2
;SERIAL-BÁSICA-MICROC.c,93 :: 		PORTD.RD3 = 0;
	BCF        PORTD+0, 3
;SERIAL-BÁSICA-MICROC.c,94 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SERIAL-BÁSICA-MICROC.c,95 :: 		Lcd_out(1,2,"MOTOR SENTIDO");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,96 :: 		Lcd_out(2,2,"ANTI-HORARIO!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SERIAL-BÁSICA-MICROC.c,97 :: 		UART1_Write_Text("\n\r");
	MOVLW      ?lstr12_SERIAL_45BÁSICA_45MICROC+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SERIAL-BÁSICA-MICROC.c,98 :: 		while(a<=40)
L_main17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _a+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVF       _a+0, 0
	SUBLW      40
L__main24:
	BTFSS      STATUS+0, 0
	GOTO       L_main18
;SERIAL-BÁSICA-MICROC.c,100 :: 		PORTD.RD3 = ~PORTD.RD3;
	MOVLW      8
	XORWF      PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,101 :: 		PORTD.RD1 = ~PORTD.RD1;
	MOVLW      2
	XORWF      PORTD+0, 1
;SERIAL-BÁSICA-MICROC.c,103 :: 		a++;
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;SERIAL-BÁSICA-MICROC.c,104 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;SERIAL-BÁSICA-MICROC.c,105 :: 		}
	GOTO       L_main17
L_main18:
;SERIAL-BÁSICA-MICROC.c,106 :: 		}
L_main16:
;SERIAL-BÁSICA-MICROC.c,107 :: 		a=0;
	CLRF       _a+0
	CLRF       _a+1
;SERIAL-BÁSICA-MICROC.c,108 :: 		}
L_main4:
;SERIAL-BÁSICA-MICROC.c,109 :: 		}
	GOTO       L_main2
;SERIAL-BÁSICA-MICROC.c,110 :: 		}
	GOTO       $+0
; end of _main
