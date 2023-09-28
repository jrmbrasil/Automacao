;  ASM code generated by mikroVirtualMachine for PIC - V. 8.2.0.0
;  Date/Time: 29/05/2010 21:06:28
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$284E			GOTO	_main
$0004	$	_Mul_16x16_S:
$0004	$1303			BCF	STATUS, RP1
$0005	$1283			BCF	STATUS, RP0
$0006	$01FB			CLRF	STACK_11
$0007	$01FA			CLRF	STACK_10
$0008	$01F9			CLRF	STACK_9
$0009	$3080			MOVLW	128
$000A	$00F8			MOVWF	STACK_8
$000B	$01FD			CLRF	STACK_13
$000C	$1FF1			BTFSS	STACK_1, 7
$000D	$2814			GOTO	$+7
$000E	$09F1			COMF	STACK_1, F
$000F	$09F0			COMF	STACK_0, F
$0010	$0AF0			INCF	STACK_0, F
$0011	$1903			BTFSC	STATUS, Z
$0012	$0AF1			INCF	STACK_1, F
$0013	$0AFD			INCF	STACK_13, F
$0014	$1FF5			BTFSS	STACK_5, 7
$0015	$281C			GOTO	$+7
$0016	$09F5			COMF	STACK_5, F
$0017	$09F4			COMF	STACK_4, F
$0018	$0AF4			INCF	STACK_4, F
$0019	$1903			BTFSC	STATUS, Z
$001A	$0AF5			INCF	STACK_5, F
$001B	$0AFD			INCF	STACK_13, F
$001C	$0CF1			RRF	STACK_1, F
$001D	$0CF0			RRF	STACK_0, F
$001E	$1C03			BTFSS	STATUS, C
$001F	$2829			GOTO	$+10
$0020	$0874			MOVF	STACK_4, W
$0021	$07F9			ADDWF	STACK_9, F
$0022	$0875			MOVF	STACK_5, W
$0023	$1803			BTFSC	STATUS, C
$0024	$0F75			INCFSZ	STACK_5, W
$0025	$07FA			ADDWF	STACK_10, F
$0026	$1803			BTFSC	STATUS, C
$0027	$0AFB			INCF	STACK_11, F
$0028	$1003			BCF	STATUS, C
$0029	$1FF0			BTFSS	STACK_0, 7
$002A	$2831			GOTO	$+7
$002B	$0874			MOVF	STACK_4, W
$002C	$07FA			ADDWF	STACK_10, F
$002D	$1803			BTFSC	STATUS, C
$002E	$0AFB			INCF	STACK_11, F
$002F	$0875			MOVF	STACK_5, W
$0030	$07FB			ADDWF	STACK_11, F
$0031	$0CFB			RRF	STACK_11, F
$0032	$0CFA			RRF	STACK_10, F
$0033	$0CF9			RRF	STACK_9, F
$0034	$0CF8			RRF	STACK_8, F
$0035	$1C03			BTFSS	STATUS, C
$0036	$281C			GOTO	$-26
$0037	$1C7D			BTFSS	STACK_13, 0
$0038	$2844			GOTO	$+12
$0039	$09FB			COMF	STACK_11, F
$003A	$09FA			COMF	STACK_10, F
$003B	$09F9			COMF	STACK_9, F
$003C	$09F8			COMF	STACK_8, F
$003D	$0AF8			INCF	STACK_8, F
$003E	$1903			BTFSC	STATUS, Z
$003F	$0AF9			INCF	STACK_9, F
$0040	$1903			BTFSC	STATUS, Z
$0041	$0AFA			INCF	STACK_10, F
$0042	$1903			BTFSC	STATUS, Z
$0043	$0AFB			INCF	STACK_11, F
$0044	$087B			MOVF	STACK_11, W
$0045	$00F3			MOVWF	STACK_3
$0046	$087A			MOVF	STACK_10, W
$0047	$00F2			MOVWF	STACK_2
$0048	$0879			MOVF	STACK_9, W
$0049	$00F1			MOVWF	STACK_1
$004A	$0878			MOVF	STACK_8, W
$004B	$00F0			MOVWF	STACK_0
$004C	$0000			NOP
$004D	$0008			RETURN
$00F6	$	_PWM1_Start:
$00F6	$1303			BCF	STATUS, RP1
$00F7	$1683			BSF	STATUS, RP0
$00F8	$1107			BCF	TRISC, 2
$00F9	$1283			BCF	STATUS, RP0
$00FA	$1512			BSF	T2CON, 2
$00FB	$300C			MOVLW	12
$00FC	$0497			IORWF	CCP1CON, 1
$00FD	$0008			RETURN
$0084	$	_PWM_Change_Duty:
$0084	$1303			BCF	STATUS, RP1
$0085	$1683			BSF	STATUS, RP0
$0086	$0812			MOVF	PR2, 0
$0087	$3F01			ADDLW	1
$0088	$00F0			MOVWF	STACK_0
$0089	$01F1			CLRF	STACK_0+1
$008A	$1803			BTFSC	STATUS, C
$008B	$0AF1			INCF	STACK_0+1, 1
$008C	$1283			BCF	STATUS, RP0
$008D	$0821			MOVF	FARG_PWM_Change_Duty+0, 0
$008E	$00F4			MOVWF	STACK_4
$008F	$01F5			CLRF	STACK_4+1
$0090	$2004			CALL	_mul_16x16_s
$0091	$3006			MOVLW	6
$0092	$00F2			MOVWF	STACK_2
$0093	$0870			MOVF	STACK_0, 0
$0094	$00F4			MOVWF	STACK_4
$0095	$0871			MOVF	STACK_0+1, 0
$0096	$00F5			MOVWF	STACK_4+1
$0097	$0872			MOVF	STACK_2, 0
$0098	$	L_PWM_Change_Duty_4:
$0098	$1903			BTFSC	STATUS, Z
$0099	$289F			GOTO	L_PWM_Change_Duty_5
$009A	$0CF5			RRF	STACK_4+1, 1
$009B	$0CF4			RRF	STACK_4, 1
$009C	$13F5			BCF	STACK_4+1, 7
$009D	$3FFF			ADDLW	255
$009E	$2898			GOTO	L_PWM_Change_Duty_4
$009F	$	L_PWM_Change_Duty_5:
$009F	$0874			MOVF	STACK_4, 0
$00A0	$00F0			MOVWF	STACK_0
$00A1	$0DF0			RLF	STACK_0, 1
$00A2	$1070			BCF	STACK_0, 0
$00A3	$0DF0			RLF	STACK_0, 1
$00A4	$1070			BCF	STACK_0, 0
$00A5	$0DF0			RLF	STACK_0, 1
$00A6	$1070			BCF	STACK_0, 0
$00A7	$0DF0			RLF	STACK_0, 1
$00A8	$1070			BCF	STACK_0, 0
$00A9	$3030			MOVLW	48
$00AA	$0570			ANDWF	STACK_0, 0
$00AB	$00F3			MOVWF	STACK_3
$00AC	$0874			MOVF	STACK_4, 0
$00AD	$00F0			MOVWF	STACK_0
$00AE	$0875			MOVF	STACK_4+1, 0
$00AF	$00F1			MOVWF	STACK_0+1
$00B0	$0CF1			RRF	STACK_0+1, 1
$00B1	$0CF0			RRF	STACK_0, 1
$00B2	$13F1			BCF	STACK_0+1, 7
$00B3	$0CF1			RRF	STACK_0+1, 1
$00B4	$0CF0			RRF	STACK_0, 1
$00B5	$13F1			BCF	STACK_0+1, 7
$00B6	$0870			MOVF	STACK_0, 0
$00B7	$0095			MOVWF	CCPR1L
$00B8	$300F			MOVLW	15
$00B9	$0597			ANDWF	CCP1CON, 1
$00BA	$0873			MOVF	STACK_3, 0
$00BB	$0497			IORWF	CCP1CON, 1
$00BC	$0008			RETURN
$00BD	$	_PWM1_Change_Duty:
$00BD	$1303			BCF	STATUS, RP1
$00BE	$1683			BSF	STATUS, RP0
$00BF	$0812			MOVF	PR2, 0
$00C0	$3F01			ADDLW	1
$00C1	$00F0			MOVWF	STACK_0
$00C2	$01F1			CLRF	STACK_0+1
$00C3	$1803			BTFSC	STATUS, C
$00C4	$0AF1			INCF	STACK_0+1, 1
$00C5	$1283			BCF	STATUS, RP0
$00C6	$0821			MOVF	FARG_PWM1_Change_Duty+0, 0
$00C7	$00F4			MOVWF	STACK_4
$00C8	$01F5			CLRF	STACK_4+1
$00C9	$2004			CALL	_mul_16x16_s
$00CA	$3006			MOVLW	6
$00CB	$00F2			MOVWF	STACK_2
$00CC	$0870			MOVF	STACK_0, 0
$00CD	$00F4			MOVWF	STACK_4
$00CE	$0871			MOVF	STACK_0+1, 0
$00CF	$00F5			MOVWF	STACK_4+1
$00D0	$0872			MOVF	STACK_2, 0
$00D1	$	L_PWM1_Change_Duty_2:
$00D1	$1903			BTFSC	STATUS, Z
$00D2	$28D8			GOTO	L_PWM1_Change_Duty_3
$00D3	$0CF5			RRF	STACK_4+1, 1
$00D4	$0CF4			RRF	STACK_4, 1
$00D5	$13F5			BCF	STACK_4+1, 7
$00D6	$3FFF			ADDLW	255
$00D7	$28D1			GOTO	L_PWM1_Change_Duty_2
$00D8	$	L_PWM1_Change_Duty_3:
$00D8	$0874			MOVF	STACK_4, 0
$00D9	$00F0			MOVWF	STACK_0
$00DA	$0DF0			RLF	STACK_0, 1
$00DB	$1070			BCF	STACK_0, 0
$00DC	$0DF0			RLF	STACK_0, 1
$00DD	$1070			BCF	STACK_0, 0
$00DE	$0DF0			RLF	STACK_0, 1
$00DF	$1070			BCF	STACK_0, 0
$00E0	$0DF0			RLF	STACK_0, 1
$00E1	$1070			BCF	STACK_0, 0
$00E2	$3030			MOVLW	48
$00E3	$0570			ANDWF	STACK_0, 0
$00E4	$00F3			MOVWF	STACK_3
$00E5	$0874			MOVF	STACK_4, 0
$00E6	$00F0			MOVWF	STACK_0
$00E7	$0875			MOVF	STACK_4+1, 0
$00E8	$00F1			MOVWF	STACK_0+1
$00E9	$0CF1			RRF	STACK_0+1, 1
$00EA	$0CF0			RRF	STACK_0, 1
$00EB	$13F1			BCF	STACK_0+1, 7
$00EC	$0CF1			RRF	STACK_0+1, 1
$00ED	$0CF0			RRF	STACK_0, 1
$00EE	$13F1			BCF	STACK_0+1, 7
$00EF	$0870			MOVF	STACK_0, 0
$00F0	$0095			MOVWF	CCPR1L
$00F1	$300F			MOVLW	15
$00F2	$0597			ANDWF	CCP1CON, 1
$00F3	$0873			MOVF	STACK_3, 0
$00F4	$0497			IORWF	CCP1CON, 1
$00F5	$0008			RETURN
$00FE	$	_PWM1_Init:
$00FE	$1303			BCF	STATUS, RP1
$00FF	$1283			BCF	STATUS, RP0
$0100	$0195			CLRF	CCPR1L, 1
$0101	$1217			BCF	CCP1CON, 4
$0102	$1297			BCF	CCP1CON, 5
$0103	$0008			RETURN
$004E	$	_main:
;pwm_example.c,9 :: 		void main ()
;pwm_example.c,12 :: 		TRISA = 0x1F;
$004E	$301F			MOVLW	31
$004F	$1303			BCF	STATUS, RP1
$0050	$1683			BSF	STATUS, RP0
$0051	$0085			MOVWF	TRISA
;pwm_example.c,13 :: 		TRISB = 0x00;
$0052	$0186			CLRF	TRISB, 1
;pwm_example.c,14 :: 		TRISC = 0x00;
$0053	$0187			CLRF	TRISC, 1
;pwm_example.c,15 :: 		TRISD = 0x00;
$0054	$0188			CLRF	TRISD, 1
;pwm_example.c,16 :: 		TRISE = 0x00;
$0055	$0189			CLRF	TRISE, 1
;pwm_example.c,17 :: 		ADCON1 = 0x07;
$0056	$3007			MOVLW	7
$0057	$009F			MOVWF	ADCON1
;pwm_example.c,19 :: 		portc = 0x00;
$0058	$1283			BCF	STATUS, RP0
$0059	$0187			CLRF	PORTC, 1
;pwm_example.c,20 :: 		INTCON.GIE = 0x00;
$005A	$138B			BCF	INTCON, 7
;pwm_example.c,21 :: 		PWM1_Init(5000);
$005B	$1012			BCF	T2CON, T2CKPS0
$005C	$1092			BCF	T2CON, T2CKPS1
$005D	$30C7			MOVLW	199
$005E	$1683			BSF	STATUS, RP0
$005F	$0092			MOVWF	PR2
$0060	$20FE			CALL	_PWM1_Init
;pwm_example.c,23 :: 		PWM1_Start();
$0061	$20F6			CALL	_PWM1_Start
;pwm_example.c,24 :: 		Pwm_Change_Duty(0);
$0062	$01A1			CLRF	FARG_PWM_Change_Duty+0, 1
$0063	$2084			CALL	_PWM_Change_Duty
;pwm_example.c,28 :: 		T2CON.TMR2ON=1;
$0064	$1512			BSF	T2CON, 2
;pwm_example.c,29 :: 		PWM1_Change_Duty(0);
$0065	$01A1			CLRF	FARG_PWM1_Change_Duty+0, 1
$0066	$20BD			CALL	_PWM1_Change_Duty
;pwm_example.c,30 :: 		tmr2 = 0;
$0067	$0191			CLRF	TMR2, 1
;pwm_example.c,31 :: 		for (j=0; j < 250; j++)
$0068	$01A0			CLRF	main_j_L0, 1
$0069	$	L_main_0:
$0069	$30FA			MOVLW	250
$006A	$0220			SUBWF	main_j_L0, 0
$006B	$1803			BTFSC	STATUS, C
$006C	$2882			GOTO	L_main_1
;pwm_example.c,33 :: 		PWM1_Change_Duty(j);
$006D	$0820			MOVF	main_j_L0, 0
$006E	$00A1			MOVWF	FARG_PWM1_Change_Duty+0
$006F	$20BD			CALL	_PWM1_Change_Duty
;pwm_example.c,34 :: 		tmr2 = 0;
$0070	$0191			CLRF	TMR2, 1
;pwm_example.c,35 :: 		delay_ms(10);
$0071	$300D			MOVLW	13
$0072	$00FB			MOVWF	STACK_11
$0073	$30FF			MOVLW	255
$0074	$00FA			MOVWF	STACK_10
$0075	$0BFB			DECFSZ	STACK_11, F
$0076	$2878			GOTO	$+2
$0077	$287B			GOTO	$+4
$0078	$0BFA			DECFSZ	STACK_10, F
$0079	$2878			GOTO	$-1
$007A	$2875			GOTO	$-5
$007B	$30F3			MOVLW	243
$007C	$00FA			MOVWF	STACK_10
$007D	$0BFA			DECFSZ	STACK_10, F
$007E	$287D			GOTO	$-1
$007F	$0000			NOP
;pwm_example.c,37 :: 		}
$0080	$	L_main_2:
;pwm_example.c,31 :: 		for (j=0; j < 250; j++)
$0080	$0AA0			INCF	main_j_L0, 1
;pwm_example.c,37 :: 		}
$0081	$2869			GOTO	L_main_0
$0082	$	L_main_1:
;pwm_example.c,40 :: 		asm { goto $ }
$0082	$2882			GOTO	$
;pwm_example.c,43 :: 		}
$0083	$2883			GOTO	$
