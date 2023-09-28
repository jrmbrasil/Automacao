
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;serial_interrupt.c,8 :: 		void interrupt()
;serial_interrupt.c,10 :: 		if (PIR1.RCIF)
	BTFSS      PIR1+0, 5
	GOTO       L_interrupt0
;serial_interrupt.c,13 :: 		recebe = uart1_read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recebe+0
;serial_interrupt.c,14 :: 		uart1_write(recebe);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;serial_interrupt.c,16 :: 		}
L_interrupt0:
;serial_interrupt.c,17 :: 		}
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

;serial_interrupt.c,19 :: 		void main(void)
;serial_interrupt.c,21 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;serial_interrupt.c,22 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;serial_interrupt.c,23 :: 		TRISC = 0x80;
	MOVLW      128
	MOVWF      TRISC+0
;serial_interrupt.c,24 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;serial_interrupt.c,25 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;serial_interrupt.c,26 :: 		ADCON1= 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;serial_interrupt.c,27 :: 		PIE1.RCIE = 1;      //habilitando a interrupção por recepção
	BSF        PIE1+0, 5
;serial_interrupt.c,28 :: 		INTCON.PEIE = 1;         //habilitando a interrupção para outros periféricos
	BSF        INTCON+0, 6
;serial_interrupt.c,29 :: 		INTCON.GIE = 1;         //habilitando a interrupção global.
	BSF        INTCON+0, 7
;serial_interrupt.c,31 :: 		uart1_init(9600);   //escolhendo o baudrate
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;serial_interrupt.c,33 :: 		while(true)
L_main1:
;serial_interrupt.c,35 :: 		}
	GOTO       L_main1
;serial_interrupt.c,39 :: 		}
	GOTO       $+0
; end of _main
