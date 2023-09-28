
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;jnterrupt_timer0.c,6 :: 		void interrupt()
;jnterrupt_timer0.c,8 :: 		intcon.GIE = 0;
	BCF        INTCON+0, 7
;jnterrupt_timer0.c,11 :: 		if (intcon.TMR0IF)
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;jnterrupt_timer0.c,13 :: 		PORTC.F0 = ~PORTC.F0;
	MOVLW      1
	XORWF      PORTC+0, 1
;jnterrupt_timer0.c,14 :: 		intcon.TMR0IF = 0;
	BCF        INTCON+0, 2
;jnterrupt_timer0.c,15 :: 		}
L_interrupt0:
;jnterrupt_timer0.c,17 :: 		intcon.GIE = 1;
	BSF        INTCON+0, 7
;jnterrupt_timer0.c,18 :: 		}
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;jnterrupt_timer0.c,20 :: 		void main(void)
;jnterrupt_timer0.c,22 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;jnterrupt_timer0.c,23 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;jnterrupt_timer0.c,24 :: 		TRISC = 0x80;
	MOVLW      128
	MOVWF      TRISC+0
;jnterrupt_timer0.c,25 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;jnterrupt_timer0.c,26 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;jnterrupt_timer0.c,27 :: 		ADCON1= 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;jnterrupt_timer0.c,28 :: 		OPTION_REG=0x83;
	MOVLW      131
	MOVWF      OPTION_REG+0
;jnterrupt_timer0.c,29 :: 		INTCON.T0IE = 1;         //habilitando a interrupção o timer 0.
	BSF        INTCON+0, 5
;jnterrupt_timer0.c,30 :: 		INTCON.GIE = 1;         //habilitando a interrupção global.
	BSF        INTCON+0, 7
;jnterrupt_timer0.c,32 :: 		PORTC.F0 = 1;
	BSF        PORTC+0, 0
;jnterrupt_timer0.c,35 :: 		while(true)
L_main1:
;jnterrupt_timer0.c,38 :: 		}
	GOTO       L_main1
;jnterrupt_timer0.c,42 :: 		}
	GOTO       $+0
; end of _main
