;  ASM code generated by mikroVirtualMachine for PIC - V. 8.2.0.0
;  Date/Time: 13/05/2010 20:15:10
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$2804			GOTO	_main
$0004	$	_main:
;OuExclusivo.c,4 :: 		void main ()
;OuExclusivo.c,6 :: 		TRISA = 0b00000011;
$0004	$3003			MOVLW	3
$0005	$1303			BCF	STATUS, RP1
$0006	$1683			BSF	STATUS, RP0
$0007	$0085			MOVWF	TRISA
;OuExclusivo.c,7 :: 		TRISB = 0x00;
$0008	$0186			CLRF	TRISB, 1
;OuExclusivo.c,8 :: 		TRISC = 0x00;
$0009	$0187			CLRF	TRISC, 1
;OuExclusivo.c,9 :: 		TRISD = 0x00;
$000A	$0188			CLRF	TRISD, 1
;OuExclusivo.c,10 :: 		TRISE = 0x00;
$000B	$0189			CLRF	TRISE, 1
;OuExclusivo.c,11 :: 		ADCON1 = 0x07;
$000C	$3007			MOVLW	7
$000D	$009F			MOVWF	ADCON1
;OuExclusivo.c,13 :: 		while(true)
$000E	$	L_main_0:
;OuExclusivo.c,15 :: 		if ((PORTA.F0&&!PORTA.F1)||(!PORTA.F0&&PORTA.F1)) PORTB.F0=1;
$000E	$3001			MOVLW	1
$000F	$1283			BCF	STATUS, RP0
$0010	$0505			ANDWF	PORTA, 0
$0011	$00F0			MOVWF	STACK_0
$0012	$1903			BTFSC	STATUS, Z
$0013	$2816			GOTO	L19_ex_L40_ex_L_main_8
$0014	$1C85			BTFSS	PORTA, 1
$0015	$2820			GOTO	L40_ex_L_main_8
$0016	$	L19_ex_L40_ex_L_main_8:
$0016	$1805			BTFSC	PORTA, 0
$0017	$281F			GOTO	L33_ex_L40_ex_L_main_8
$0018	$3000			MOVLW	0
$0019	$1885			BTFSC	PORTA, 1
$001A	$3001			MOVLW	1
$001B	$00F1			MOVWF	STACK_1
$001C	$0871			MOVF	STACK_1, 0
$001D	$1D03			BTFSS	STATUS, Z
$001E	$2820			GOTO	L40_ex_L_main_8
$001F	$	L33_ex_L40_ex_L_main_8:
$001F	$2822			GOTO	L_main_8
$0020	$	L40_ex_L_main_8:
$0020	$1406			BSF	PORTB, 0
$0021	$2823			GOTO	L_main_9
$0022	$	L_main_8:
;OuExclusivo.c,16 :: 		else PORTB.F0=0;
$0022	$1006			BCF	PORTB, 0
$0023	$	L_main_9:
;OuExclusivo.c,19 :: 		}
$0023	$280E			GOTO	L_main_0
;OuExclusivo.c,22 :: 		}
$0024	$2824			GOTO	$
