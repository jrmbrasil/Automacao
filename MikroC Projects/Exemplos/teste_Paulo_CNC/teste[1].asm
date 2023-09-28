
_main:

;teste.c,11 :: 		void main()
;teste.c,16 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;teste.c,17 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;teste.c,18 :: 		TRISC = 0x80;
	MOVLW      128
	MOVWF      TRISC+0
;teste.c,19 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;teste.c,20 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;teste.c,23 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;teste.c,26 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;teste.c,27 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;teste.c,28 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;teste.c,29 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;teste.c,30 :: 		PORTE = 0x00;
	CLRF       PORTE+0
;teste.c,36 :: 		PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrupção
	BSF        PIE1+0, 5
	BSF        INTCON+0, 6
	BSF        INTCON+0, 7
;teste.c,38 :: 		while(true)
L_main0:
;teste.c,40 :: 		long i = 0;
	CLRF       main_i_L1+0
	CLRF       main_i_L1+1
	CLRF       main_i_L1+2
	CLRF       main_i_L1+3
;teste.c,41 :: 		long j = 0;
	CLRF       main_j_L1+0
	CLRF       main_j_L1+1
	CLRF       main_j_L1+2
	CLRF       main_j_L1+3
;teste.c,42 :: 		while(i < 50000)
L_main2:
	MOVLW      128
	XORWF      main_i_L1+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      0
	SUBWF      main_i_L1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      195
	SUBWF      main_i_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      80
	SUBWF      main_i_L1+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;teste.c,44 :: 		PORTB.F0= 1;
	BSF        PORTB+0, 0
;teste.c,45 :: 		Delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
;teste.c,46 :: 		PORTB.F0= 0;
	BCF        PORTB+0, 0
;teste.c,47 :: 		Delay_us(27);
	MOVLW      8
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	NOP
	NOP
;teste.c,48 :: 		i++;
	MOVF       main_i_L1+0, 0
	MOVWF      R0+0
	MOVF       main_i_L1+1, 0
	MOVWF      R0+1
	MOVF       main_i_L1+2, 0
	MOVWF      R0+2
	MOVF       main_i_L1+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      main_i_L1+0
	MOVF       R0+1, 0
	MOVWF      main_i_L1+1
	MOVF       R0+2, 0
	MOVWF      main_i_L1+2
	MOVF       R0+3, 0
	MOVWF      main_i_L1+3
;teste.c,49 :: 		}
	GOTO       L_main2
L_main3:
;teste.c,50 :: 		while(j < 50000)
L_main6:
	MOVLW      128
	XORWF      main_j_L1+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	SUBWF      main_j_L1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      195
	SUBWF      main_j_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      80
	SUBWF      main_j_L1+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;teste.c,52 :: 		PORTB.F1= 1;
	BSF        PORTB+0, 1
;teste.c,53 :: 		Delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
;teste.c,54 :: 		PORTB.F1= 0;
	BCF        PORTB+0, 1
;teste.c,55 :: 		Delay_us(27);
	MOVLW      8
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	NOP
	NOP
;teste.c,56 :: 		j++;
	MOVF       main_j_L1+0, 0
	MOVWF      R0+0
	MOVF       main_j_L1+1, 0
	MOVWF      R0+1
	MOVF       main_j_L1+2, 0
	MOVWF      R0+2
	MOVF       main_j_L1+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      main_j_L1+0
	MOVF       R0+1, 0
	MOVWF      main_j_L1+1
	MOVF       R0+2, 0
	MOVWF      main_j_L1+2
	MOVF       R0+3, 0
	MOVWF      main_j_L1+3
;teste.c,57 :: 		}
	GOTO       L_main6
L_main7:
;teste.c,58 :: 		}// fim do while
	GOTO       L_main0
;teste.c,59 :: 		}
	GOTO       $+0
; end of _main

_avancasv1:

;teste.c,62 :: 		void avancasv1() // avança servi motor 1
;teste.c,64 :: 		long i = 0;
	CLRF       avancasv1_i_L0+0
	CLRF       avancasv1_i_L0+1
	CLRF       avancasv1_i_L0+2
	CLRF       avancasv1_i_L0+3
;teste.c,65 :: 		while(i < 50000)
L_avancasv110:
	MOVLW      128
	XORWF      avancasv1_i_L0+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__avancasv120
	MOVLW      0
	SUBWF      avancasv1_i_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__avancasv120
	MOVLW      195
	SUBWF      avancasv1_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__avancasv120
	MOVLW      80
	SUBWF      avancasv1_i_L0+0, 0
L__avancasv120:
	BTFSC      STATUS+0, 0
	GOTO       L_avancasv111
;teste.c,67 :: 		PORTB.F0= 1;
	BSF        PORTB+0, 0
;teste.c,68 :: 		Delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_avancasv112:
	DECFSZ     R13+0, 1
	GOTO       L_avancasv112
;teste.c,69 :: 		PORTB.F0= 0;
	BCF        PORTB+0, 0
;teste.c,70 :: 		Delay_us(27);
	MOVLW      8
	MOVWF      R13+0
L_avancasv113:
	DECFSZ     R13+0, 1
	GOTO       L_avancasv113
	NOP
	NOP
;teste.c,71 :: 		i++;
	MOVF       avancasv1_i_L0+0, 0
	MOVWF      R0+0
	MOVF       avancasv1_i_L0+1, 0
	MOVWF      R0+1
	MOVF       avancasv1_i_L0+2, 0
	MOVWF      R0+2
	MOVF       avancasv1_i_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      avancasv1_i_L0+0
	MOVF       R0+1, 0
	MOVWF      avancasv1_i_L0+1
	MOVF       R0+2, 0
	MOVWF      avancasv1_i_L0+2
	MOVF       R0+3, 0
	MOVWF      avancasv1_i_L0+3
;teste.c,72 :: 		}
	GOTO       L_avancasv110
L_avancasv111:
;teste.c,73 :: 		}
	RETURN
; end of _avancasv1

_retornasv1:

;teste.c,75 :: 		void retornasv1() // avança servi motor 1
;teste.c,77 :: 		long j = 0;
	CLRF       retornasv1_j_L0+0
	CLRF       retornasv1_j_L0+1
	CLRF       retornasv1_j_L0+2
	CLRF       retornasv1_j_L0+3
;teste.c,78 :: 		while(j < 50000)
L_retornasv114:
	MOVLW      128
	XORWF      retornasv1_j_L0+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__retornasv121
	MOVLW      0
	SUBWF      retornasv1_j_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__retornasv121
	MOVLW      195
	SUBWF      retornasv1_j_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__retornasv121
	MOVLW      80
	SUBWF      retornasv1_j_L0+0, 0
L__retornasv121:
	BTFSC      STATUS+0, 0
	GOTO       L_retornasv115
;teste.c,80 :: 		PORTB.F1= 1;
	BSF        PORTB+0, 1
;teste.c,81 :: 		Delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_retornasv116:
	DECFSZ     R13+0, 1
	GOTO       L_retornasv116
;teste.c,82 :: 		PORTB.F1= 0;
	BCF        PORTB+0, 1
;teste.c,83 :: 		Delay_us(27);
	MOVLW      8
	MOVWF      R13+0
L_retornasv117:
	DECFSZ     R13+0, 1
	GOTO       L_retornasv117
	NOP
	NOP
;teste.c,84 :: 		j++;
	MOVF       retornasv1_j_L0+0, 0
	MOVWF      R0+0
	MOVF       retornasv1_j_L0+1, 0
	MOVWF      R0+1
	MOVF       retornasv1_j_L0+2, 0
	MOVWF      R0+2
	MOVF       retornasv1_j_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      retornasv1_j_L0+0
	MOVF       R0+1, 0
	MOVWF      retornasv1_j_L0+1
	MOVF       R0+2, 0
	MOVWF      retornasv1_j_L0+2
	MOVF       R0+3, 0
	MOVWF      retornasv1_j_L0+3
;teste.c,85 :: 		}
	GOTO       L_retornasv114
L_retornasv115:
;teste.c,86 :: 		}
	RETURN
; end of _retornasv1
