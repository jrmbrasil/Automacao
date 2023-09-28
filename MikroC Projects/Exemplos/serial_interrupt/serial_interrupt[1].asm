;  ASM code generated by mikroVirtualMachine for PIC - V. 8.1.0.0
;  Date/Time: 29/05/2010 12:20:54
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$2822			GOTO	_main
$0055	$	_Usart_Read:
$0055	$1303			BCF	STATUS, RP1
$0056	$1283			BCF	STATUS, RP0
$0057	$081A			MOVF	RCREG, 0
$0058	$00A4			MOVWF	Usart_Read_tmp_L0
$0059	$1C98			BTFSS	RCSTA, 1
$005A	$285D			GOTO	L_Usart_Read_2
$005B	$1218			BCF	RCSTA, 4
$005C	$1618			BSF	RCSTA, 4
$005D	$	L_Usart_Read_2:
$005D	$0824			MOVF	Usart_Read_tmp_L0, 0
$005E	$00F0			MOVWF	STACK_0
$005F	$0008			RETURN
$0035	$	_Usart_Write:
$0035	$	L_Usart_Write_3:
$0035	$3000			MOVLW	0
$0036	$1303			BCF	STATUS, RP1
$0037	$1683			BSF	STATUS, RP0
$0038	$1898			BTFSC	TXSTA, 1
$0039	$3001			MOVLW	1
$003A	$00F1			MOVWF	STACK_1
$003B	$0871			MOVF	STACK_1, 0
$003C	$3A00			XORLW	0
$003D	$1D03			BTFSS	STATUS, Z
$003E	$2841			GOTO	L_Usart_Write_4
$003F	$0000			NOP
$0040	$2835			GOTO	L_Usart_Write_3
$0041	$	L_Usart_Write_4:
$0041	$1283			BCF	STATUS, RP0
$0042	$0824			MOVF	FARG_Usart_Write+0, 0
$0043	$0099			MOVWF	TXREG
$0044	$0008			RETURN
$0004	$	_interrupt:
$0004	$00FF			MOVWF	STACK_15
$0005	$0E03			SWAPF	STATUS, 0
$0006	$0183			CLRF	STATUS
$0007	$00A2			MOVWF	?saveSTATUS
$0008	$0804			MOVF	FSR, 0
$0009	$00A1			MOVWF	?saveFSR
$000A	$080A			MOVF	PCLATH, 0
$000B	$00A3			MOVWF	?savePCLATH
$000C	$018A			CLRF	PCLATH
$000D	$0870			MOVF	STACK_0, 0
$000E	$00AA			MOVWF	STSAVED_0
;serial_interrupt.c,8 :: 		void interrupt()
;serial_interrupt.c,10 :: 		if (PIR1.RCIF)
$000F	$1E8C			BTFSS	PIR1, 5
$0010	$2817			GOTO	L_interrupt_0
;serial_interrupt.c,13 :: 		recebe = usart_read();
$0011	$2055			CALL	_Usart_Read
$0012	$0870			MOVF	STACK_0, 0
$0013	$00A0			MOVWF	_recebe
;serial_interrupt.c,14 :: 		usart_write(recebe);
$0014	$0870			MOVF	STACK_0, 0
$0015	$00A4			MOVWF	FARG_Usart_Write+0
$0016	$2035			CALL	_Usart_Write
;serial_interrupt.c,16 :: 		}
$0017	$	L_interrupt_0:
;serial_interrupt.c,17 :: 		}
$0017	$	L_Interrupt_end:
$0017	$082A			MOVF	STSAVED_0, 0
$0018	$00F0			MOVWF	STACK_0
$0019	$0823			MOVF	?savePCLATH, 0
$001A	$008A			MOVWF	PCLATH
$001B	$0821			MOVF	?saveFSR, 0
$001C	$0084			MOVWF	FSR
$001D	$0E22			SWAPF	?saveSTATUS, 0
$001E	$0083			MOVWF	STATUS
$001F	$0EFF			SWAPF	STACK_15, 1
$0020	$0E7F			SWAPF	STACK_15, 0
$0021	$0009			RETFIE
$0045	$	_Usart_Init:
$0045	$1303			BCF	STATUS, RP1
$0046	$1683			BSF	STATUS, RP0
$0047	$1698			BSF	TXSTA, 5
$0048	$3090			MOVLW	144
$0049	$1283			BCF	STATUS, RP0
$004A	$0098			MOVWF	RCSTA
$004B	$1683			BSF	STATUS, RP0
$004C	$1787			BSF	TRISC, 7
$004D	$1307			BCF	TRISC, 6
$004E	$	L_Usart_Init_0:
$004E	$1283			BCF	STATUS, RP0
$004F	$1E8C			BTFSS	PIR1, 5
$0050	$2854			GOTO	L_Usart_Init_1
$0051	$081A			MOVF	RCREG, 0
$0052	$00A9			MOVWF	Usart_Init_tmp_L0
$0053	$284E			GOTO	L_Usart_Init_0
$0054	$	L_Usart_Init_1:
$0054	$0008			RETURN
$0022	$	_main:
;serial_interrupt.c,19 :: 		void main(void)
;serial_interrupt.c,21 :: 		TRISA = 0x00;
$0022	$1303			BCF	STATUS, RP1
$0023	$1683			BSF	STATUS, RP0
$0024	$0185			CLRF	TRISA, 1
;serial_interrupt.c,22 :: 		TRISB = 0x00;
$0025	$0186			CLRF	TRISB, 1
;serial_interrupt.c,23 :: 		TRISC = 0x80;
$0026	$3080			MOVLW	128
$0027	$0087			MOVWF	TRISC
;serial_interrupt.c,24 :: 		TRISD = 0x00;
$0028	$0188			CLRF	TRISD, 1
;serial_interrupt.c,25 :: 		TRISE = 0x00;
$0029	$0189			CLRF	TRISE, 1
;serial_interrupt.c,26 :: 		ADCON1= 0x07;
$002A	$3007			MOVLW	7
$002B	$009F			MOVWF	ADCON1
;serial_interrupt.c,27 :: 		PIE1.RCIE = 1;      //habilitando a interrup��o por recep��o
$002C	$168C			BSF	PIE1, 5
;serial_interrupt.c,28 :: 		INTCON.PEIE = 1;	 //habilitando a interrup��o para outros perif�ricos
$002D	$170B			BSF	INTCON, 6
;serial_interrupt.c,29 :: 		INTCON.GIE = 1;	 //habilitando a interrup��o global.
$002E	$178B			BSF	INTCON, 7
;serial_interrupt.c,31 :: 		usart_init(9600);   //escolhendo o baudrate
$002F	$3081			MOVLW	129
$0030	$0099			MOVWF	SPBRG
$0031	$1518			BSF	TXSTA, BRGH
$0032	$2045			CALL	_Usart_Init
;serial_interrupt.c,33 :: 		while(true)
$0033	$	L_main_1:
$0033	$2833			GOTO	L_main_1
;serial_interrupt.c,39 :: 		}
$0034	$2834			GOTO	$