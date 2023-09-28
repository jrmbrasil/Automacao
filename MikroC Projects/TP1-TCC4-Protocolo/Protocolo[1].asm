
_main:

;Protocolo.c,1 :: 		void main()
;Protocolo.c,6 :: 		adcon1=6;
	MOVLW      6
	MOVWF      ADCON1+0
;Protocolo.c,7 :: 		trise=7;
	MOVLW      7
	MOVWF      TRISE+0
;Protocolo.c,8 :: 		trisb=0;
	CLRF       TRISB+0
;Protocolo.c,9 :: 		trisc.B6=0;
	BCF        TRISC+0, 6
;Protocolo.c,10 :: 		trisc.B7=1;
	BSF        TRISC+0, 7
;Protocolo.c,11 :: 		trisd=0;
	CLRF       TRISD+0
;Protocolo.c,13 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;Protocolo.c,14 :: 		portc=0;
	CLRF       PORTC+0
;Protocolo.c,15 :: 		portd=0;
	CLRF       PORTD+0
;Protocolo.c,17 :: 		UART1_Init(19200);               // Initialize UART module at 19200 bps
	MOVLW      64
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Protocolo.c,18 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;Protocolo.c,20 :: 		while (1)                      // Endless loop
L_main1:
;Protocolo.c,22 :: 		endereco=(PORTE&0x07)+0x30;
	MOVLW      7
	ANDWF      PORTE+0, 0
	MOVWF      main_endereco_L0+0
	MOVLW      48
	ADDWF      main_endereco_L0+0, 1
;Protocolo.c,24 :: 		PACOTE[0]=0;
	CLRF       main_PACOTE_L0+0
;Protocolo.c,25 :: 		PACOTE[1]=0;
	CLRF       main_PACOTE_L0+1
;Protocolo.c,26 :: 		PACOTE[2]=0;
	CLRF       main_PACOTE_L0+2
;Protocolo.c,27 :: 		if (UART1_Data_Ready()==1)           // if data is received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Protocolo.c,30 :: 		UART1_Read_Text(PACOTE,"x",4);    // reads text until 'null' is found
	MOVLW      main_PACOTE_L0+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_Protocolo+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      4
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;Protocolo.c,33 :: 		portd=id;
	MOVF       main_PACOTE_L0+0, 0
	MOVWF      PORTD+0
;Protocolo.c,34 :: 		if(id==endereco)
	MOVF       main_PACOTE_L0+0, 0
	XORWF      main_endereco_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Protocolo.c,36 :: 		if(PACOTE[1]=='L')
	MOVF       main_PACOTE_L0+1, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Protocolo.c,38 :: 		RB0_bit=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Protocolo.c,39 :: 		PACOTE[1]='1';
	MOVLW      49
	MOVWF      main_PACOTE_L0+1
;Protocolo.c,40 :: 		}
	GOTO       L_main6
L_main5:
;Protocolo.c,43 :: 		RB0_bit=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Protocolo.c,44 :: 		PACOTE[1]='0';
	MOVLW      48
	MOVWF      main_PACOTE_L0+1
;Protocolo.c,45 :: 		}
L_main6:
;Protocolo.c,46 :: 		PACOTE[0]=endereco;
	MOVF       main_endereco_L0+0, 0
	MOVWF      main_PACOTE_L0+0
;Protocolo.c,47 :: 		PACOTE[2]=0;
	CLRF       main_PACOTE_L0+2
;Protocolo.c,49 :: 		UART1_Write_Text(PACOTE);             // sends back text
	MOVLW      main_PACOTE_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Protocolo.c,50 :: 		}
L_main4:
;Protocolo.c,52 :: 		}
L_main3:
;Protocolo.c,54 :: 		}
	GOTO       L_main1
;Protocolo.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
