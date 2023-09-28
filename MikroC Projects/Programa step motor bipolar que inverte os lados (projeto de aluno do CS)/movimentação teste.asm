
_main:

;movimentação teste.c,6 :: 		void main()
;movimentação teste.c,8 :: 		trisa = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;movimentação teste.c,9 :: 		trisb = 0b00000000;
	CLRF       TRISB+0
;movimentação teste.c,10 :: 		portb = 0b00000000;
	CLRF       PORTB+0
;movimentação teste.c,12 :: 		while(1)
L_main0:
;movimentação teste.c,14 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;movimentação teste.c,15 :: 		while(direita==1)
L_main2:
	BTFSS      PORTA+0, 0
	GOTO       L_main3
;movimentação teste.c,17 :: 		while(contador<10)
L_main4:
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      10
	SUBWF      _contador+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;movimentação teste.c,19 :: 		portb=0b00001000;
	MOVLW      8
	MOVWF      PORTB+0
;movimentação teste.c,20 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;movimentação teste.c,21 :: 		portb=0b00000100;
	MOVLW      4
	MOVWF      PORTB+0
;movimentação teste.c,22 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;movimentação teste.c,23 :: 		portb=0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;movimentação teste.c,24 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;movimentação teste.c,25 :: 		portb=0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;movimentação teste.c,26 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;movimentação teste.c,27 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;movimentação teste.c,28 :: 		}
	GOTO       L_main4
L_main5:
;movimentação teste.c,29 :: 		}
	GOTO       L_main2
L_main3:
;movimentação teste.c,30 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;movimentação teste.c,31 :: 		while(esquerda==1)
L_main10:
	BTFSS      PORTA+0, 1
	GOTO       L_main11
;movimentação teste.c,33 :: 		while(contador<10)
L_main12:
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      10
	SUBWF      _contador+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;movimentação teste.c,35 :: 		portb=0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;movimentação teste.c,36 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;movimentação teste.c,37 :: 		portb=0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;movimentação teste.c,38 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	NOP
	NOP
;movimentação teste.c,39 :: 		portb=0b00000100;
	MOVLW      4
	MOVWF      PORTB+0
;movimentação teste.c,40 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;movimentação teste.c,41 :: 		portb=0b00001000;
	MOVLW      8
	MOVWF      PORTB+0
;movimentação teste.c,42 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
	NOP
;movimentação teste.c,43 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;movimentação teste.c,44 :: 		}
	GOTO       L_main12
L_main13:
;movimentação teste.c,45 :: 		}
	GOTO       L_main10
L_main11:
;movimentação teste.c,46 :: 		}
	GOTO       L_main0
;movimentação teste.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
