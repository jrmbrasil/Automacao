
_main:

;switch_case.c,10 :: 		void main() {
;switch_case.c,12 :: 		TRISA =  0b00011111;
	MOVLW      31
	MOVWF      TRISA+0
;switch_case.c,13 :: 		TRISB =  0x00;
	CLRF       TRISB+0
;switch_case.c,14 :: 		TRISC =  0x00;
	CLRF       TRISC+0
;switch_case.c,15 :: 		TRISD =  0x00;
	CLRF       TRISD+0
;switch_case.c,16 :: 		TRISE =  0x00;
	CLRF       TRISE+0
;switch_case.c,17 :: 		ADCON1 = 0x07;   //PORTA e PORTE digitais
	MOVLW      7
	MOVWF      ADCON1+0
;switch_case.c,18 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;switch_case.c,19 :: 		PORTC =  0x00;
	CLRF       PORTC+0
;switch_case.c,20 :: 		PORTD =  &tipo_porta;
	MOVLW      R1+0
	MOVWF      PORTD+0
;switch_case.c,21 :: 		PORTE =  0x00;
	CLRF       PORTE+0
;switch_case.c,24 :: 		while (true)
L_main0:
;switch_case.c,27 :: 		tipo_porta = (PORTA>>2) & 0x07;
	MOVF       PORTA+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      7
	ANDWF      R1+0, 1
;switch_case.c,28 :: 		switch (tipo_porta)
	GOTO       L_main2
;switch_case.c,30 :: 		case OR:
L_main4:
;switch_case.c,31 :: 		PORTB.f0  = PORTA.f0 |  PORTA.f1;
	BTFSC      PORTA+0, 0
	GOTO       L__main10
	BTFSC      PORTA+0, 1
	GOTO       L__main10
	BCF        PORTB+0, 0
	GOTO       L__main11
L__main10:
	BSF        PORTB+0, 0
L__main11:
;switch_case.c,32 :: 		break;
	GOTO       L_main3
;switch_case.c,34 :: 		case AND:
L_main5:
;switch_case.c,35 :: 		PORTB.f0  = PORTA.f0  & PORTA.f1;
	BTFSS      PORTA+0, 0
	GOTO       L__main12
	BTFSS      PORTA+0, 1
	GOTO       L__main12
	BSF        PORTB+0, 0
	GOTO       L__main13
L__main12:
	BCF        PORTB+0, 0
L__main13:
;switch_case.c,36 :: 		break;
	GOTO       L_main3
;switch_case.c,38 :: 		case NOR:
L_main6:
;switch_case.c,39 :: 		PORTB.f0  =  ~(PORTA.f0  | PORTA.f1);
	BTFSC      PORTA+0, 0
	GOTO       L__main14
	BTFSC      PORTA+0, 1
	GOTO       L__main14
	BCF        3, 0
	GOTO       L__main15
L__main14:
	BSF        3, 0
L__main15:
	BTFSC      3, 0
	GOTO       L__main16
	BSF        PORTB+0, 0
	GOTO       L__main17
L__main16:
	BCF        PORTB+0, 0
L__main17:
;switch_case.c,40 :: 		break;
	GOTO       L_main3
;switch_case.c,42 :: 		case NAND:
L_main7:
;switch_case.c,43 :: 		PORTB.f0  =  ~(PORTA.f0 &  PORTA.f1);
	BTFSS      PORTA+0, 0
	GOTO       L__main18
	BTFSS      PORTA+0, 1
	GOTO       L__main18
	BSF        3, 0
	GOTO       L__main19
L__main18:
	BCF        3, 0
L__main19:
	BTFSC      3, 0
	GOTO       L__main20
	BSF        PORTB+0, 0
	GOTO       L__main21
L__main20:
	BCF        PORTB+0, 0
L__main21:
;switch_case.c,44 :: 		break;
	GOTO       L_main3
;switch_case.c,46 :: 		case XOR:
L_main8:
;switch_case.c,47 :: 		PORTB.f0  =  PORTA.f0  ^ PORTA.f1;
	BTFSC      PORTA+0, 0
	GOTO       L__main22
	BTFSC      PORTA+0, 1
	GOTO       L__main24
	BCF        PORTB+0, 0
	GOTO       L__main23
L__main24:
	BSF        PORTB+0, 0
	GOTO       L__main23
L__main22:
	BTFSC      PORTA+0, 1
	GOTO       L__main25
	BSF        PORTB+0, 0
	GOTO       L__main23
L__main25:
	BCF        PORTB+0, 0
L__main23:
;switch_case.c,48 :: 		break;
	GOTO       L_main3
;switch_case.c,50 :: 		default:
L_main9:
;switch_case.c,52 :: 		}
	GOTO       L_main3
L_main2:
	MOVF       R1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       R1+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       R1+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       R1+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       R1+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	GOTO       L_main9
L_main3:
;switch_case.c,53 :: 		}
	GOTO       L_main0
;switch_case.c,54 :: 		}
	GOTO       $+0
; end of _main
