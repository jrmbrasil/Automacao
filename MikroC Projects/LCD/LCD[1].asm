
_main:

;LCD.c,31 :: 		void main()
;LCD.c,36 :: 		TRISB = 0x00;          // set direction to be output
	CLRF       TRISB+0
;LCD.c,37 :: 		TRISC = 0x00;          // set direction to be output
	CLRF       TRISC+0
;LCD.c,38 :: 		TRISD = 0x00;          // set direction to be output
	CLRF       TRISD+0
;LCD.c,41 :: 		LCD_inicializa();
	CALL       _LCD_inicializa+0
;LCD.c,42 :: 		LCD_ligar();
	CALL       _LCD_ligar+0
;LCD.c,43 :: 		temp = 0;
	CLRF       main_temp_L0+0
;LCD.c,44 :: 		do
L_main0:
;LCD.c,46 :: 		PORTB=temp;
	MOVF       main_temp_L0+0, 0
	MOVWF      PORTB+0
;LCD.c,47 :: 		ByteToStr(PORTB,contador);
	MOVF       PORTB+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      main_contador_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;LCD.c,48 :: 		LCD_mensagem(1,1,contador);
	MOVLW      1
	MOVWF      FARG_LCD_mensagem_linha+0
	MOVLW      1
	MOVWF      FARG_LCD_mensagem_coluna+0
	MOVLW      main_contador_L0+0
	MOVWF      FARG_LCD_mensagem_mensagem+0
	CALL       _LCD_mensagem+0
;LCD.c,49 :: 		Delay_ms(500);      // 0.5 second delay
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
;LCD.c,50 :: 		temp++;
	INCF       main_temp_L0+0, 1
;LCD.c,52 :: 		while(1);            // Endless loop
	GOTO       L_main0
;LCD.c,53 :: 		}
	GOTO       $+0
; end of _main

_LCD_inicializa:

;LCD.c,55 :: 		void LCD_inicializa(void)
;LCD.c,57 :: 		LCD_RS=0;                   //SELECIONA O DISPLAY P/ COMANDOS
	BCF        RD2_bit+0, 2
;LCD.c,59 :: 		LCD_escreve(0b00111000);   //B'00111000'        FUNCTION SET (0 0 1 DL N F * *)
	MOVLW      56
	MOVWF      FARG_LCD_escreve_valor+0
	CALL       _LCD_escreve+0
;LCD.c,63 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_LCD_inicializa4:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_inicializa4
	DECFSZ     R12+0, 1
	GOTO       L_LCD_inicializa4
	DECFSZ     R11+0, 1
	GOTO       L_LCD_inicializa4
	NOP
	NOP
;LCD.c,64 :: 		LCD_RS=1;                  //SELECIONA O DISPLAY P/ DADOS
	BSF        RD2_bit+0, 2
;LCD.c,65 :: 		}
	RETURN
; end of _LCD_inicializa

_LCD_escreve:

;LCD.c,67 :: 		void LCD_escreve(unsigned char valor)
;LCD.c,69 :: 		display=valor;             //ATUALIZA DISPLAY (PORTB)
	MOVF       FARG_LCD_escreve_valor+0, 0
	MOVWF      PORTB+0
;LCD.c,70 :: 		Delay_us(1);                //PERDE 1us PARA ESTABILIZAÇÃO
	NOP
;LCD.c,72 :: 		LCD_EN=1;                        //ENVIA UM PULSO DE ENABLE AO DISPLAY
	BSF        RD3_bit+0, 3
;LCD.c,73 :: 		Delay_us(2);
	NOP
	NOP
;LCD.c,74 :: 		LCD_EN=0;
	BCF        RD3_bit+0, 3
;LCD.c,76 :: 		Delay_ms(2);                //DELAY DE 1ms
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LCD_escreve5:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_escreve5
	DECFSZ     R12+0, 1
	GOTO       L_LCD_escreve5
	NOP
	NOP
;LCD.c,78 :: 		}
	RETURN
; end of _LCD_escreve

_LCD_mensagem:

;LCD.c,80 :: 		void LCD_mensagem(unsigned char linha,unsigned char coluna,unsigned char mensagem[])
;LCD.c,86 :: 		if(linha<=2)
	MOVF       FARG_LCD_mensagem_linha+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L_LCD_mensagem6
;LCD.c,88 :: 		LCD_RS=0;                        //SELECIONA O DISPLAY P/ COMANDOS
	BCF        RD2_bit+0, 2
;LCD.c,89 :: 		LCD_limpar();                //COMANDO P/ LIMPAR O LCD
	CALL       _LCD_limpar+0
;LCD.c,91 :: 		if(linha==1) posicao=0x80+coluna-1;
	MOVF       FARG_LCD_mensagem_linha+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_LCD_mensagem7
	MOVF       FARG_LCD_mensagem_coluna+0, 0
	ADDLW      128
	MOVWF      LCD_mensagem_posicao_L0+0
	DECF       LCD_mensagem_posicao_L0+0, 1
	GOTO       L_LCD_mensagem8
L_LCD_mensagem7:
;LCD.c,92 :: 		else if(linha==2)posicao=0xC0+coluna-1;
	MOVF       FARG_LCD_mensagem_linha+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_LCD_mensagem9
	MOVF       FARG_LCD_mensagem_coluna+0, 0
	ADDLW      192
	MOVWF      LCD_mensagem_posicao_L0+0
	DECF       LCD_mensagem_posicao_L0+0, 1
L_LCD_mensagem9:
L_LCD_mensagem8:
;LCD.c,94 :: 		LCD_escreve(posicao);      //;COMANDO PARA POSICIONAR O CURSOR
	MOVF       LCD_mensagem_posicao_L0+0, 0
	MOVWF      FARG_LCD_escreve_valor+0
	CALL       _LCD_escreve+0
;LCD.c,95 :: 		LCD_RS=1;                        //SELECIONA O DISPLAY P/ DADOS
	BSF        RD2_bit+0, 2
;LCD.c,97 :: 		for(cont=0;mensagem[cont]!=0;cont++)
	CLRF       LCD_mensagem_cont_L0+0
	CLRF       LCD_mensagem_cont_L0+1
L_LCD_mensagem10:
	MOVF       LCD_mensagem_cont_L0+0, 0
	ADDWF      FARG_LCD_mensagem_mensagem+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_mensagem11
;LCD.c,98 :: 		LCD_escreve(mensagem[cont]);
	MOVF       LCD_mensagem_cont_L0+0, 0
	ADDWF      FARG_LCD_mensagem_mensagem+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_LCD_escreve_valor+0
	CALL       _LCD_escreve+0
;LCD.c,97 :: 		for(cont=0;mensagem[cont]!=0;cont++)
	INCF       LCD_mensagem_cont_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LCD_mensagem_cont_L0+1, 1
;LCD.c,98 :: 		LCD_escreve(mensagem[cont]);
	GOTO       L_LCD_mensagem10
L_LCD_mensagem11:
;LCD.c,99 :: 		}
L_LCD_mensagem6:
;LCD.c,100 :: 		}
	RETURN
; end of _LCD_mensagem

_LCD_limpar:

;LCD.c,102 :: 		void LCD_limpar(void)
;LCD.c,104 :: 		LCD_RS=0;                  //SELECIONA O DISPLAY P/ COMANDOS
	BCF        RD2_bit+0, 2
;LCD.c,105 :: 		LCD_escreve(0x01);         //COMANDO P/ LIMPAR A TELA
	MOVLW      1
	MOVWF      FARG_LCD_escreve_valor+0
	CALL       _LCD_escreve+0
;LCD.c,106 :: 		LCD_RS=1;                  //SELECIONA O DISPLAY P/ DADOS
	BSF        RD2_bit+0, 2
;LCD.c,107 :: 		}
	RETURN
; end of _LCD_limpar

_LCD_ligar:

;LCD.c,109 :: 		void LCD_ligar(void)
;LCD.c,111 :: 		LCD_RS=0;                   //SELECIONA O DISPLAY P/ COMANDOS
	BCF        RD2_bit+0, 2
;LCD.c,113 :: 		LCD_escreve(0b00001100);   //B'00001100'          DISPLAY ON/OFF CONTROL ( 0 0 0 0 1 D C B)
	MOVLW      12
	MOVWF      FARG_LCD_escreve_valor+0
	CALL       _LCD_escreve+0
;LCD.c,118 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_LCD_ligar13:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_ligar13
	DECFSZ     R12+0, 1
	GOTO       L_LCD_ligar13
	DECFSZ     R11+0, 1
	GOTO       L_LCD_ligar13
	NOP
	NOP
;LCD.c,119 :: 		LCD_RS=1;                        //SELECIONA O DISPLAY P/ DADOS
	BSF        RD2_bit+0, 2
;LCD.c,120 :: 		}
	RETURN
; end of _LCD_ligar
