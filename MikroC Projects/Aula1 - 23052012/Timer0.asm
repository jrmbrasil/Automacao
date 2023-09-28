
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Timer0.c,3 :: 		void interrupt()
;Timer0.c,5 :: 		if (TMR0IF_bit == 1)
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt0
;Timer0.c,7 :: 		cnt++;                 // increment counter
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Timer0.c,8 :: 		TMR0IF_bit = 0;        // clear TMR0IF
	BCF        TMR0IF_bit+0, 2
;Timer0.c,9 :: 		TMR0   = 0;
	CLRF       TMR0+0
;Timer0.c,10 :: 		}
L_interrupt0:
;Timer0.c,11 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Timer0.c,13 :: 		void main()
;Timer0.c,14 :: 		{ INTCON.TMR0IF=0;
	BCF        INTCON+0, 2
;Timer0.c,15 :: 		OPTION_REG = 0x07;       // Assign prescaler to TMR0
	MOVLW      7
	MOVWF      OPTION_REG+0
;Timer0.c,16 :: 		ADCON1 = 6;
	MOVLW      6
	MOVWF      ADCON1+0
;Timer0.c,17 :: 		TRISB = 0;               // PORTB is output
	CLRF       TRISB+0
;Timer0.c,18 :: 		PORTB = 0x0F;            // Initialize PORTB
	MOVLW      15
	MOVWF      PORTB+0
;Timer0.c,19 :: 		TMR0  = 0;               // Timer0 initial value
	CLRF       TMR0+0
;Timer0.c,20 :: 		INTCON = 0xA0;           // Enable TMRO interrupt
	MOVLW      160
	MOVWF      INTCON+0
;Timer0.c,21 :: 		cnt = 0;                 // Initialize cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Timer0.c,22 :: 		PORTB.B0=1;
	BSF        PORTB+0, 0
;Timer0.c,23 :: 		while(1)
L_main1:
;Timer0.c,25 :: 		if (cnt == 76)
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      76
	XORWF      _cnt+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Timer0.c,27 :: 		PORTB = ~PORTB;      // complemento de 1 do PORTB
	COMF       PORTB+0, 1
;Timer0.c,28 :: 		cnt = 0;             // Reset cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Timer0.c,29 :: 		}
L_main3:
;Timer0.c,30 :: 		}
	GOTO       L_main1
;Timer0.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
