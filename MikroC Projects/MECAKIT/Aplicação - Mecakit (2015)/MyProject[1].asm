
_main:

;MyProject.c,5 :: 		void main()
;MyProject.c,7 :: 		ADCON1=0x0E; //AN0 habilitado
	MOVLW      14
	MOVWF      ADCON1+0
;MyProject.c,8 :: 		TRISA=0x01; //RA0: entrada (AN0)
	MOVLW      1
	MOVWF      TRISA+0
;MyProject.c,9 :: 		TRISA=1;
	MOVLW      1
	MOVWF      TRISA+0
;MyProject.c,10 :: 		TRISB=0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,11 :: 		TRISE=0;
	CLRF       TRISE+0
;MyProject.c,12 :: 		TRISD=0;
	CLRF       TRISD+0
;MyProject.c,13 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,14 :: 		NOT_RBPU_bit=0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;MyProject.c,16 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,17 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;MyProject.c,19 :: 		while(1)                      // Endless loop
L_main1:
;MyProject.c,21 :: 		if (UART1_Data_Ready())      // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;MyProject.c,23 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;MyProject.c,24 :: 		switch(uart_rd)
	GOTO       L_main4
;MyProject.c,26 :: 		case '1': if(!RD0_bit)
L_main6:
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_main7
;MyProject.c,27 :: 		RD0_bit=1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_main8
L_main7:
;MyProject.c,29 :: 		RD0_bit=0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
L_main8:
;MyProject.c,30 :: 		break;
	GOTO       L_main5
;MyProject.c,31 :: 		case '2': if(!RD1_bit)
L_main9:
	BTFSC      RD1_bit+0, BitPos(RD1_bit+0)
	GOTO       L_main10
;MyProject.c,32 :: 		RD1_bit=1;
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
	GOTO       L_main11
L_main10:
;MyProject.c,34 :: 		RD1_bit=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
L_main11:
;MyProject.c,35 :: 		break;
	GOTO       L_main5
;MyProject.c,36 :: 		case '3': if(!RD2_bit)
L_main12:
	BTFSC      RD2_bit+0, BitPos(RD2_bit+0)
	GOTO       L_main13
;MyProject.c,37 :: 		RD2_bit=1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
	GOTO       L_main14
L_main13:
;MyProject.c,39 :: 		RD2_bit=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
L_main14:
;MyProject.c,40 :: 		break;
	GOTO       L_main5
;MyProject.c,41 :: 		case '4': if(!RD3_bit)
L_main15:
	BTFSC      RD3_bit+0, BitPos(RD3_bit+0)
	GOTO       L_main16
;MyProject.c,42 :: 		RD3_bit=1;
	BSF        RD3_bit+0, BitPos(RD3_bit+0)
	GOTO       L_main17
L_main16:
;MyProject.c,44 :: 		RD3_bit=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
L_main17:
;MyProject.c,45 :: 		break;
	GOTO       L_main5
;MyProject.c,46 :: 		case '5': if(!RD4_bit)
L_main18:
	BTFSC      RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L_main19
;MyProject.c,47 :: 		RD4_bit=1;
	BSF        RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L_main20
L_main19:
;MyProject.c,49 :: 		RD4_bit=0;
	BCF        RD4_bit+0, BitPos(RD4_bit+0)
L_main20:
;MyProject.c,50 :: 		break;
	GOTO       L_main5
;MyProject.c,51 :: 		case '6': if(!RD5_bit)
L_main21:
	BTFSC      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_main22
;MyProject.c,52 :: 		RD5_bit=1;
	BSF        RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_main23
L_main22:
;MyProject.c,54 :: 		RD5_bit=0;
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
L_main23:
;MyProject.c,55 :: 		break;
	GOTO       L_main5
;MyProject.c,56 :: 		case '7': if(!RD6_bit)
L_main24:
	BTFSC      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_main25
;MyProject.c,57 :: 		RD6_bit=1;
	BSF        RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_main26
L_main25:
;MyProject.c,59 :: 		RD6_bit=0;
	BCF        RD6_bit+0, BitPos(RD6_bit+0)
L_main26:
;MyProject.c,60 :: 		break;
	GOTO       L_main5
;MyProject.c,61 :: 		case '8': if(!RD7_bit)
L_main27:
	BTFSC      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_main28
;MyProject.c,62 :: 		RD7_bit=1;
	BSF        RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_main29
L_main28:
;MyProject.c,64 :: 		RD7_bit=0;
	BCF        RD7_bit+0, BitPos(RD7_bit+0)
L_main29:
;MyProject.c,65 :: 		break;
	GOTO       L_main5
;MyProject.c,66 :: 		default: PORTD=0;
L_main30:
	CLRF       PORTD+0
;MyProject.c,67 :: 		}
	GOTO       L_main5
L_main4:
	MOVF       _uart_rd+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _uart_rd+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _uart_rd+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _uart_rd+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _uart_rd+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _uart_rd+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _uart_rd+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _uart_rd+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	GOTO       L_main30
L_main5:
;MyProject.c,69 :: 		}
L_main3:
;MyProject.c,70 :: 		if(!RB0_bit)
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main31
;MyProject.c,72 :: 		UART1_Write('1');
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,73 :: 		while(!RB0_bit);
L_main32:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main33
	GOTO       L_main32
L_main33:
;MyProject.c,74 :: 		UART1_Write('1');
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,75 :: 		}
L_main31:
;MyProject.c,76 :: 		if(!RB1_bit)
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main34
;MyProject.c,78 :: 		UART1_Write('2');
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,79 :: 		while(!RB1_bit);
L_main35:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main36
	GOTO       L_main35
L_main36:
;MyProject.c,80 :: 		UART1_Write('2');
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,81 :: 		}
L_main34:
;MyProject.c,82 :: 		if(!RB2_bit)
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main37
;MyProject.c,84 :: 		UART1_Write('3');
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,85 :: 		while(!RB2_bit);
L_main38:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main39
	GOTO       L_main38
L_main39:
;MyProject.c,86 :: 		UART1_Write('3');
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,87 :: 		}
L_main37:
;MyProject.c,88 :: 		if(!RB3_bit)
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main40
;MyProject.c,90 :: 		UART1_Write('4');
	MOVLW      52
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,91 :: 		while(!RB3_bit);
L_main41:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main42
	GOTO       L_main41
L_main42:
;MyProject.c,92 :: 		UART1_Write('4');
	MOVLW      52
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,93 :: 		}
L_main40:
;MyProject.c,94 :: 		if(!RB4_bit)
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main43
;MyProject.c,96 :: 		UART1_Write('5');
	MOVLW      53
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,97 :: 		while(!RB4_bit);
L_main44:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main45
	GOTO       L_main44
L_main45:
;MyProject.c,98 :: 		UART1_Write('5');
	MOVLW      53
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,99 :: 		}
L_main43:
;MyProject.c,100 :: 		if(!RB5_bit)
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main46
;MyProject.c,102 :: 		UART1_Write('6');
	MOVLW      54
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,103 :: 		while(!RB5_bit);
L_main47:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main48
	GOTO       L_main47
L_main48:
;MyProject.c,104 :: 		UART1_Write('6');
	MOVLW      54
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,105 :: 		}
L_main46:
;MyProject.c,107 :: 		}
	GOTO       L_main1
;MyProject.c,108 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
