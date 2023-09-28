
_main:

;Teste.c,2 :: 		void main()
;Teste.c,4 :: 		unsigned int num1,num2,controle=0;
	CLRF       main_controle_L0+0
	CLRF       main_controle_L0+1
;Teste.c,5 :: 		ADCON1=6;
	MOVLW      6
	MOVWF      ADCON1+0
;Teste.c,6 :: 		TRISA=255;
	MOVLW      255
	MOVWF      TRISA+0
;Teste.c,7 :: 		TRISB=0;
	CLRF       TRISB+0
;Teste.c,8 :: 		PORTB=0;
	CLRF       PORTB+0
;Teste.c,10 :: 		while(1)
L_main0:
;Teste.c,12 :: 		while(!RA4_BIT);
L_main2:
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Teste.c,13 :: 		if(controle==3)
	MOVLW      0
	XORWF      main_controle_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      3
	XORWF      main_controle_L0+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Teste.c,15 :: 		PORTB.B0=0;
	BCF        PORTB+0, 0
;Teste.c,16 :: 		controle=0;
	CLRF       main_controle_L0+0
	CLRF       main_controle_L0+1
;Teste.c,17 :: 		}
L_main4:
;Teste.c,18 :: 		if((PORTA&0x0F) == 8 && controle==0)
	MOVLW      15
	ANDWF      PORTA+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	MOVLW      0
	XORWF      main_controle_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      0
	XORWF      main_controle_L0+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
L__main15:
;Teste.c,20 :: 		controle=1;
	MOVLW      1
	MOVWF      main_controle_L0+0
	MOVLW      0
	MOVWF      main_controle_L0+1
;Teste.c,22 :: 		}
L_main7:
;Teste.c,23 :: 		if((PORTA&0x0F) == 3 && controle==1)
	MOVLW      15
	ANDWF      PORTA+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      0
	XORWF      main_controle_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      1
	XORWF      main_controle_L0+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
L__main14:
;Teste.c,25 :: 		controle=2;
	MOVLW      2
	MOVWF      main_controle_L0+0
	MOVLW      0
	MOVWF      main_controle_L0+1
;Teste.c,27 :: 		}
L_main10:
;Teste.c,28 :: 		if(controle==2)
	MOVLW      0
	XORWF      main_controle_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      2
	XORWF      main_controle_L0+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;Teste.c,30 :: 		PORTB.B0=1;
	BSF        PORTB+0, 0
;Teste.c,31 :: 		controle=3;
	MOVLW      3
	MOVWF      main_controle_L0+0
	MOVLW      0
	MOVWF      main_controle_L0+1
;Teste.c,32 :: 		}
L_main11:
;Teste.c,33 :: 		while(RA4_BIT);
L_main12:
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;Teste.c,34 :: 		}
	GOTO       L_main0
;Teste.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
