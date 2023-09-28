
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,3 :: 		void interrupt()
;MyProject.c,5 :: 		if (INTCON.INTF==1)
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;MyProject.c,7 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;MyProject.c,8 :: 		PORTC=contador;
	MOVF       _contador+0, 0
	MOVWF      PORTC+0
;MyProject.c,9 :: 		INTCON.INTF=0;
	BCF        INTCON+0, 1
;MyProject.c,10 :: 		}
L_interrupt0:
;MyProject.c,11 :: 		}
L_end_interrupt:
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,14 :: 		void main()
;MyProject.c,16 :: 		TRISB=0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,17 :: 		PORTB=0;
	CLRF       PORTB+0
;MyProject.c,18 :: 		TRISC=0;
	CLRF       TRISC+0
;MyProject.c,19 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,20 :: 		INTCON.INTE=1;
	BSF        INTCON+0, 4
;MyProject.c,21 :: 		OPTION_REG.INTEDG=1;
	BSF        OPTION_REG+0, 6
;MyProject.c,22 :: 		INTCON.INTF=0;
	BCF        INTCON+0, 1
;MyProject.c,23 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;MyProject.c,25 :: 		while(1)
L_main1:
;MyProject.c,26 :: 		{}
	GOTO       L_main1
;MyProject.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
