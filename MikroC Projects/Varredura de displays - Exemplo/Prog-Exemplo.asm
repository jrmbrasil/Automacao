
_main:

;Prog-Exemplo.c,7 :: 		void main()
;Prog-Exemplo.c,11 :: 		TRISA = 0x01;        // RA0 entrada, demais bits saida
	MOVLW      1
	MOVWF      TRISA+0
;Prog-Exemplo.c,12 :: 		adcon1 = 0x07;       // Para o caso de utilizar o PORTA como saída digital
	MOVLW      7
	MOVWF      ADCON1+0
;Prog-Exemplo.c,13 :: 		TRISB = 0x00;        // PORTB saida
	CLRF       TRISB+0
;Prog-Exemplo.c,14 :: 		TRISC = 0x00;        // PORTC saida
	CLRF       TRISC+0
;Prog-Exemplo.c,15 :: 		TRISE.PSPMODE=0;     // Desliga o PSP Mode do PORTD
	BCF        TRISE+0, 4
;Prog-Exemplo.c,16 :: 		TRISD = 0x00;        // PORTD saida
	CLRF       TRISD+0
;Prog-Exemplo.c,19 :: 		INTCON=0x20;         //Habilita interrupção do Timer0
	MOVLW      32
	MOVWF      INTCON+0
;Prog-Exemplo.c,20 :: 		OPTION_REG=0x07;     //Configura o Timer0 com prescaler 1:256
	MOVLW      7
	MOVWF      OPTION_REG+0
;Prog-Exemplo.c,21 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;Prog-Exemplo.c,24 :: 		while(1)
L_main0:
;Prog-Exemplo.c,27 :: 		if(contador >= 9999) overflow=1;
	MOVLW      39
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      15
	SUBWF      _contador+0, 0
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
	MOVLW      1
	MOVWF      _overflow+0
	GOTO       L_main3
L_main2:
;Prog-Exemplo.c,28 :: 		else overflow=0;
	CLRF       _overflow+0
L_main3:
;Prog-Exemplo.c,31 :: 		if(contador>=lim_inf && contador<=lim_sup)
	MOVF       _lim_inf+1, 0
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       _lim_inf+0, 0
	SUBWF      _contador+0, 0
L__main35:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	MOVF       _contador+1, 0
	SUBWF      _lim_sup+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _contador+0, 0
	SUBWF      _lim_sup+0, 0
L__main36:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
L__main33:
;Prog-Exemplo.c,33 :: 		PORTA.RA1=1;
	BSF        PORTA+0, 1
;Prog-Exemplo.c,34 :: 		PORTA.RA2=0;
	BCF        PORTA+0, 2
;Prog-Exemplo.c,35 :: 		}
	GOTO       L_main7
L_main6:
;Prog-Exemplo.c,38 :: 		PORTA.RA1=0;
	BCF        PORTA+0, 1
;Prog-Exemplo.c,39 :: 		PORTA.RA2=1;
	BSF        PORTA+0, 2
;Prog-Exemplo.c,40 :: 		}
L_main7:
;Prog-Exemplo.c,43 :: 		while(PORTA.RA0==0);
L_main8:
	BTFSC      PORTA+0, 0
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;Prog-Exemplo.c,44 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Prog-Exemplo.c,45 :: 		while(PORTA.RA0==1);
L_main10:
	BTFSS      PORTA+0, 0
	GOTO       L_main11
	GOTO       L_main10
L_main11:
;Prog-Exemplo.c,47 :: 		}
	GOTO       L_main0
;Prog-Exemplo.c,48 :: 		}
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Prog-Exemplo.c,51 :: 		void interrupt()
;Prog-Exemplo.c,53 :: 		if (INTCON.TMR0IF) // Verifica se a interrupção foi do Timer0
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt12
;Prog-Exemplo.c,55 :: 		contador_bcd = Dec2Bcd16(contador);// Converte contador (16 bits) para BCD
	MOVF       _contador+0, 0
	MOVWF      FARG_Dec2Bcd16_decnum+0
	MOVF       _contador+1, 0
	MOVWF      FARG_Dec2Bcd16_decnum+1
	CALL       _Dec2Bcd16+0
	MOVF       R0+0, 0
	MOVWF      _contador_bcd+0
	MOVF       R0+1, 0
	MOVWF      _contador_bcd+1
;Prog-Exemplo.c,56 :: 		temp1 = contador_bcd;
	MOVF       R0+0, 0
	MOVWF      _temp1+0
	MOVF       R0+1, 0
	MOVWF      _temp1+1
;Prog-Exemplo.c,57 :: 		unidade = temp1 & 0x000F; // Filtra a unidade (4 bits)
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _unidade+0
;Prog-Exemplo.c,58 :: 		temp1 = temp1 >> 4;   // Rotaciona 4 bits para a esquerda
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _temp1+0
	MOVF       R2+1, 0
	MOVWF      _temp1+1
;Prog-Exemplo.c,59 :: 		dezena=temp1&0x000F;  // Filtra a dezena (4 bits)
	MOVLW      15
	ANDWF      R2+0, 0
	MOVWF      _dezena+0
;Prog-Exemplo.c,60 :: 		temp1 = temp1 >> 4;
	MOVF       R2+0, 0
	MOVWF      R4+0
	MOVF       R2+1, 0
	MOVWF      R4+1
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+1, 7
	MOVF       R4+0, 0
	MOVWF      _temp1+0
	MOVF       R4+1, 0
	MOVWF      _temp1+1
;Prog-Exemplo.c,61 :: 		centena=temp1&0x000F; // Filtra a centena (4 bits)
	MOVLW      15
	ANDWF      R4+0, 0
	MOVWF      _centena+0
;Prog-Exemplo.c,62 :: 		temp1 = temp1 >> 4;
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _temp1+0
	MOVF       R0+1, 0
	MOVWF      _temp1+1
;Prog-Exemplo.c,63 :: 		milhar=temp1&0x000F;  // Filtra o milhar (4 bits)
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _milhar+0
;Prog-Exemplo.c,67 :: 		switch(display)
	GOTO       L_interrupt13
;Prog-Exemplo.c,69 :: 		case 0: PORTC=0x0E;  //Display 4 (unidade)
L_interrupt15:
	MOVLW      14
	MOVWF      PORTC+0
;Prog-Exemplo.c,70 :: 		PORTB=sete_segmentos(unidade);
	MOVF       _unidade+0, 0
	MOVWF      FARG_sete_segmentos_valor+0
	CLRF       FARG_sete_segmentos_valor+1
	CALL       _sete_segmentos+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Prog-Exemplo.c,71 :: 		break;
	GOTO       L_interrupt14
;Prog-Exemplo.c,72 :: 		case 1: PORTC=0x0D;  //Display 3 (dezena)
L_interrupt16:
	MOVLW      13
	MOVWF      PORTC+0
;Prog-Exemplo.c,73 :: 		PORTB=sete_segmentos(dezena);
	MOVF       _dezena+0, 0
	MOVWF      FARG_sete_segmentos_valor+0
	CLRF       FARG_sete_segmentos_valor+1
	CALL       _sete_segmentos+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Prog-Exemplo.c,74 :: 		break;
	GOTO       L_interrupt14
;Prog-Exemplo.c,75 :: 		case 2: PORTC=0x0B;  //Display 2 (centena)
L_interrupt17:
	MOVLW      11
	MOVWF      PORTC+0
;Prog-Exemplo.c,76 :: 		PORTB=sete_segmentos(centena);
	MOVF       _centena+0, 0
	MOVWF      FARG_sete_segmentos_valor+0
	CLRF       FARG_sete_segmentos_valor+1
	CALL       _sete_segmentos+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Prog-Exemplo.c,77 :: 		break;
	GOTO       L_interrupt14
;Prog-Exemplo.c,78 :: 		case 3: PORTC=0x07;  //Display 1 (milhar)
L_interrupt18:
	MOVLW      7
	MOVWF      PORTC+0
;Prog-Exemplo.c,79 :: 		PORTB=sete_segmentos(milhar);
	MOVF       _milhar+0, 0
	MOVWF      FARG_sete_segmentos_valor+0
	CLRF       FARG_sete_segmentos_valor+1
	CALL       _sete_segmentos+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Prog-Exemplo.c,80 :: 		break;
	GOTO       L_interrupt14
;Prog-Exemplo.c,81 :: 		}
L_interrupt13:
	MOVF       _display+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt15
	MOVF       _display+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt16
	MOVF       _display+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt17
	MOVF       _display+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt18
L_interrupt14:
;Prog-Exemplo.c,84 :: 		if(++display == 4) display = 0;  //Após o display da unidade, aponta para
	INCF       _display+0, 1
	MOVF       _display+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt19
	CLRF       _display+0
L_interrupt19:
;Prog-Exemplo.c,86 :: 		INTCON.TMR0IF = 0; // Desliga o flag da interrupção do Timer0
	BCF        INTCON+0, 2
;Prog-Exemplo.c,87 :: 		}
L_interrupt12:
;Prog-Exemplo.c,88 :: 		}
L__interrupt37:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_sete_segmentos:

;Prog-Exemplo.c,90 :: 		unsigned short sete_segmentos(unsigned valor)
;Prog-Exemplo.c,92 :: 		if(overflow==1) return (0xDC); //Overflow 'o.'
	MOVF       _overflow+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_sete_segmentos20
	MOVLW      220
	MOVWF      R0+0
	RETURN
L_sete_segmentos20:
;Prog-Exemplo.c,94 :: 		switch(valor)
	GOTO       L_sete_segmentos21
;Prog-Exemplo.c,96 :: 		case 0: return (0x3F); //Algarismo '0'
L_sete_segmentos23:
	MOVLW      63
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,97 :: 		case 1: return (0x06); //Algarismo '1'
L_sete_segmentos24:
	MOVLW      6
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,98 :: 		case 2: return (0x5B); //Algarismo '2'
L_sete_segmentos25:
	MOVLW      91
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,99 :: 		case 3: return (0x4F); //Algarismo '3'
L_sete_segmentos26:
	MOVLW      79
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,100 :: 		case 4: return (0x66); //Algarismo '4'
L_sete_segmentos27:
	MOVLW      102
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,101 :: 		case 5: return (0x6D); //Algarismo '5'
L_sete_segmentos28:
	MOVLW      109
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,102 :: 		case 6: return (0x7D); //Algarismo '6'
L_sete_segmentos29:
	MOVLW      125
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,103 :: 		case 7: return (0x07); //Algarismo '7'
L_sete_segmentos30:
	MOVLW      7
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,104 :: 		case 8: return (0x7F); //Algarismo '8'
L_sete_segmentos31:
	MOVLW      127
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,105 :: 		case 9: return (0x6F); //Algarismo '9'
L_sete_segmentos32:
	MOVLW      111
	MOVWF      R0+0
	RETURN
;Prog-Exemplo.c,106 :: 		}
L_sete_segmentos21:
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos38
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos38:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos23
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos39
	MOVLW      1
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos39:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos24
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos40
	MOVLW      2
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos40:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos25
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos41
	MOVLW      3
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos41:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos26
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos42
	MOVLW      4
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos42:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos27
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos43
	MOVLW      5
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos43:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos28
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos44
	MOVLW      6
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos44:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos29
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos45
	MOVLW      7
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos45:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos30
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos46
	MOVLW      8
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos46:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos31
	MOVLW      0
	XORWF      FARG_sete_segmentos_valor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sete_segmentos47
	MOVLW      9
	XORWF      FARG_sete_segmentos_valor+0, 0
L__sete_segmentos47:
	BTFSC      STATUS+0, 2
	GOTO       L_sete_segmentos32
;Prog-Exemplo.c,108 :: 		}
	RETURN
; end of _sete_segmentos
