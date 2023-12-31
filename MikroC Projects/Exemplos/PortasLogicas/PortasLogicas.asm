;  ASM code generated by mikroVirtualMachine for PIC - V. 8.1.0.0
;  Date/Time: 21/05/2010 21:14:41
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$29CD			GOTO	_main
$036F	$	_RES032:
$036F	$1303			BCF	STATUS, RP1
$0370	$1283			BCF	STATUS, RP0
$0371	$01F2			CLRF	STACK_2
$0372	$01F1			CLRF	STACK_1
$0373	$01F0			CLRF	STACK_0
$0374	$01F8			CLRF	STACK_8
$0375	$01F3			CLRF	STACK_3
$0376	$3000			MOVLW	0
$0377	$0008			RETURN
$0353	$	_SETFOV32:
$0353	$1303			BCF	STATUS, RP1
$0354	$1283			BCF	STATUS, RP0
$0355	$14FB			BSF	STACK_11, 1
$0356	$1FFB			BTFSS	STACK_11, 7
$0357	$2B5F			GOTO	SETFOV32EEE
$0358	$30FF			MOVLW	0xFF
$0359	$00F3			MOVWF	STACK_3
$035A	$00F2			MOVWF	STACK_2
$035B	$00F1			MOVWF	STACK_1
$035C	$00F0			MOVWF	STACK_0
$035D	$0DFA			RLF	STACK_10, F
$035E	$0CF2			RRF	STACK_2, F
$035F	$	SETFOV32EEE:
$035F	$30FF			MOVLW	0xFF
$0360	$0008			RETURN
$0361	$	_SETFUN32:
$0361	$1303			BCF	STATUS, RP1
$0362	$1283			BCF	STATUS, RP0
$0363	$157B			BSF	STACK_11, 2
$0364	$1FFB			BTFSS	STACK_11, 7
$0365	$2B6D			GOTO	SETFUN32EEE
$0366	$3001			MOVLW	0x01
$0367	$00F3			MOVWF	STACK_3
$0368	$01F2			CLRF	STACK_2
$0369	$01F1			CLRF	STACK_1
$036A	$01F0			CLRF	STACK_0
$036B	$0DFA			RLF	STACK_10, F
$036C	$0CF2			RRF	STACK_2, F
$036D	$	SETFUN32EEE:
$036D	$30FF			MOVLW	0xFF
$036E	$0008			RETURN
$0328	$	_strcpy:
$0328	$1303			BCF	STATUS, RP1
$0329	$1283			BCF	STATUS, RP0
$032A	$084A			MOVF	FARG_strcpy+0, 0
$032B	$00CC			MOVWF	strcpy_cp_L0
$032C	$	L_strcpy_31:
$032C	$084C			MOVF	strcpy_cp_L0, 0
$032D	$00F1			MOVWF	STACK_1
$032E	$0ACC			INCF	strcpy_cp_L0, 1
$032F	$084B			MOVF	FARG_strcpy+1, 0
$0330	$0084			MOVWF	FSR
$0331	$0ACB			INCF	FARG_strcpy+1, 1
$0332	$0800			MOVF	INDF, 0
$0333	$00F0			MOVWF	STACK_0
$0334	$0871			MOVF	STACK_1, 0
$0335	$0084			MOVWF	FSR
$0336	$0870			MOVF	STACK_0, 0
$0337	$0080			MOVWF	INDF
$0338	$0871			MOVF	STACK_1, 0
$0339	$0084			MOVWF	FSR
$033A	$0800			MOVF	INDF, 0
$033B	$00F0			MOVWF	STACK_0
$033C	$0870			MOVF	STACK_0, 0
$033D	$1D03			BTFSS	STATUS, Z
$033E	$2B2C			GOTO	L_strcpy_31
$033F	$	L_strcpy_32:
$033F	$084A			MOVF	FARG_strcpy+0, 0
$0340	$00F0			MOVWF	STACK_0
$0341	$0008			RETURN
$02D8	$	_Compare_Double:
$02D8	$1303			BCF	STATUS, RP1
$02D9	$1283			BCF	STATUS, RP0
$02DA	$01FA			CLRF	STACK_10
$02DB	$0873			MOVF	STACK_3, W
$02DC	$1D03			BTFSS	STATUS, Z
$02DD	$147A			BSF	STACK_10, 0
$02DE	$0877			MOVF	STACK_7, W
$02DF	$1D03			BTFSS	STATUS, Z
$02E0	$14FA			BSF	STACK_10, 1
$02E1	$087A			MOVF	STACK_10, W
$02E2	$1903			BTFSC	STATUS, Z
$02E3	$2B24			GOTO	COMPARE_EQU
$02E4	$3A03			XORLW	0x03
$02E5	$1903			BTFSC	STATUS, Z
$02E6	$2AEF			GOTO	COMPARE_NOTZERO
$02E7	$187A			BTFSC	STACK_10, 0
$02E8	$2AEC			GOTO	COMPARE_XNOTZERO
$02E9	$	COMPARE_YNOTZERO:
$02E9	$1FF6			BTFSS	STACK_6, 7
$02EA	$2B22			GOTO	COMPARE_LT
$02EB	$2B20			GOTO	COMPARE_GT
$02EC	$	COMPARE_XNOTZERO:
$02EC	$1FF2			BTFSS	STACK_2, 7
$02ED	$2B20			GOTO	COMPARE_GT
$02EE	$2B22			GOTO	COMPARE_LT
$02EF	$	COMPARE_NOTZERO:
$02EF	$0872			MOVF	STACK_2, W
$02F0	$3980			ANDLW	0x80
$02F1	$00FA			MOVWF	STACK_10
$02F2	$13F2			BCF	STACK_2, 7
$02F3	$0876			MOVF	STACK_6, W
$02F4	$3980			ANDLW	0x80
$02F5	$13F6			BCF	STACK_6, 7
$02F6	$067A			XORWF	STACK_10, W
$02F7	$1903			BTFSC	STATUS, Z
$02F8	$2AFD			GOTO	COMPARE_TESTALL
$02F9	$087A			MOVF	STACK_10, W
$02FA	$1903			BTFSC	STATUS, Z
$02FB	$2B20			GOTO	COMPARE_GT
$02FC	$2B22			GOTO	COMPARE_LT
$02FD	$	COMPARE_TESTALL:
$02FD	$0877			MOVF	STACK_7, W
$02FE	$0273			SUBWF	STACK_3, W
$02FF	$1903			BTFSC	STATUS, Z
$0300	$2B04			GOTO	COMPARE_C1
$0301	$1C03			BTFSS	STATUS, C
$0302	$2B18			GOTO	GT_FALSE
$0303	$2B1C			GOTO	GT_TRUE
$0304	$	COMPARE_C1:
$0304	$0876			MOVF	STACK_6, W
$0305	$0272			SUBWF	STACK_2, W
$0306	$1903			BTFSC	STATUS, Z
$0307	$2B0B			GOTO	COMPARE_C2
$0308	$1C03			BTFSS	STATUS, C
$0309	$2B18			GOTO	GT_FALSE
$030A	$2B1C			GOTO	GT_TRUE
$030B	$	COMPARE_C2:
$030B	$0875			MOVF	STACK_5, W
$030C	$0271			SUBWF	STACK_1, W
$030D	$1903			BTFSC	STATUS, Z
$030E	$2B12			GOTO	COMPARE_C3
$030F	$1C03			BTFSS	STATUS, C
$0310	$2B18			GOTO	GT_FALSE
$0311	$2B1C			GOTO	GT_TRUE
$0312	$	COMPARE_C3:
$0312	$0874			MOVF	STACK_4, W
$0313	$0270			SUBWF	STACK_0, W
$0314	$1903			BTFSC	STATUS, Z
$0315	$2B24			GOTO	COMPARE_EQU
$0316	$1803			BTFSC	STATUS, C
$0317	$2B1C			GOTO	GT_TRUE
$0318	$	GT_FALSE:
$0318	$08FA			MOVF	STACK_10, F
$0319	$1903			BTFSC	STATUS, Z
$031A	$2B22			GOTO	COMPARE_LT
$031B	$2B20			GOTO	COMPARE_GT
$031C	$	GT_TRUE:
$031C	$08FA			MOVF	STACK_10, F
$031D	$1903			BTFSC	STATUS, Z
$031E	$2B20			GOTO	COMPARE_GT
$031F	$2B22			GOTO	COMPARE_LT
$0320	$	COMPARE_GT:
$0320	$1403			BSF	STATUS, C
$0321	$0008			RETURN
$0322	$	COMPARE_LT:
$0322	$1003			BCF	STATUS, C
$0323	$0008			RETURN
$0324	$	COMPARE_EQU:
$0324	$1403			BSF	STATUS, C
$0325	$1503			BSF	STATUS, Z
$0326	$0008			RETURN
$0327	$0008			RETURN
$0277	$	_Mul_32x32_FP:
$0277	$1303			BCF	STATUS, RP1
$0278	$1283			BCF	STATUS, RP0
$0279	$	FPM32:
$0279	$01FB			CLRF	STACK_11
$027A	$0873			MOVF	STACK_3, W
$027B	$1D03			BTFSS	STATUS, Z
$027C	$0877			MOVF	STACK_7, W
$027D	$1903			BTFSC	STATUS, Z
$027E	$2ACE			GOTO	JPMRES032
$027F	$	M32BNE0:
$027F	$0872			MOVF	STACK_2, W
$0280	$0676			XORWF	STACK_6, W
$0281	$00FA			MOVWF	STACK_10
$0282	$0877			MOVF	STACK_7, W
$0283	$07F3			ADDWF	STACK_3, F
$0284	$307E			MOVLW	126
$0285	$1C03			BTFSS	STATUS, C
$0286	$2A8B			GOTO	MTUN32
$0287	$02F3			SUBWF	STACK_3, F
$0288	$1803			BTFSC	STATUS, C
$0289	$2AD1			GOTO	JPMSETFOV32
$028A	$2A8E			GOTO	MOK32
$028B	$	MTUN32:
$028B	$02F3			SUBWF	STACK_3, F
$028C	$1C03			BTFSS	STATUS, C
$028D	$2AD4			GOTO	JPMSETFUN32
$028E	$	MOK32:
$028E	$0872			MOVF	STACK_2, W
$028F	$00F8			MOVWF	STACK_8
$0290	$0871			MOVF	STACK_1, W
$0291	$00FC			MOVWF	STACK_12
$0292	$0870			MOVF	STACK_0, W
$0293	$00FD			MOVWF	STACK_13
$0294	$17F8			BSF	STACK_8, 7
$0295	$17F6			BSF	STACK_6, 7
$0296	$1003			BCF	STATUS, C
$0297	$01F2			CLRF	STACK_2
$0298	$01F1			CLRF	STACK_1
$0299	$01F0			CLRF	STACK_0
$029A	$3018			MOVLW	24
$029B	$00A0			MOVWF	__math_tempbD
$029C	$	MLOOP32:
$029C	$1C7D			BTFSS	STACK_13, 0
$029D	$2AA8			GOTO	MNOADD32
$029E	$	MADD32:
$029E	$0874			MOVF	STACK_4, W
$029F	$07F0			ADDWF	STACK_0, F
$02A0	$0875			MOVF	STACK_5, W
$02A1	$1803			BTFSC	STATUS, C
$02A2	$0F75			INCFSZ	STACK_5, W
$02A3	$07F1			ADDWF	STACK_1, F
$02A4	$0876			MOVF	STACK_6, W
$02A5	$1803			BTFSC	STATUS, C
$02A6	$0F76			INCFSZ	STACK_6, W
$02A7	$07F2			ADDWF	STACK_2, F
$02A8	$	MNOADD32:
$02A8	$0CF2			RRF	STACK_2, F
$02A9	$0CF1			RRF	STACK_1, F
$02AA	$0CF0			RRF	STACK_0, F
$02AB	$0CF8			RRF	STACK_8, F
$02AC	$0CFC			RRF	STACK_12, F
$02AD	$0CFD			RRF	STACK_13, F
$02AE	$1003			BCF	STATUS, C
$02AF	$0BA0			DECFSZ	__math_tempbD, F
$02B0	$2A9C			GOTO	MLOOP32
$02B1	$1BF2			BTFSC	STACK_2, 7
$02B2	$2AB8			GOTO	MROUND32
$02B3	$0DF8			RLF	STACK_8, F
$02B4	$0DF0			RLF	STACK_0, F
$02B5	$0DF1			RLF	STACK_1, F
$02B6	$0DF2			RLF	STACK_2, F
$02B7	$03F3			DECF	STACK_3, F
$02B8	$	MROUND32:
$02B8	$1B7B			BTFSC	STACK_11, 6
$02B9	$1C70			BTFSS	STACK_0, 0
$02BA	$2ACA			GOTO	MUL32OK
$02BB	$1FF8			BTFSS	STACK_8, 7
$02BC	$2ACA			GOTO	MUL32OK
$02BD	$0AF0			INCF	STACK_0, F
$02BE	$1903			BTFSC	STATUS, Z
$02BF	$0AF1			INCF	STACK_1, F
$02C0	$1903			BTFSC	STATUS, Z
$02C1	$0AF2			INCF	STACK_2, F
$02C2	$1D03			BTFSS	STATUS, Z
$02C3	$2ACA			GOTO	MUL32OK
$02C4	$0CF2			RRF	STACK_2, F
$02C5	$0CF1			RRF	STACK_1, F
$02C6	$0CF0			RRF	STACK_0, F
$02C7	$0AF3			INCF	STACK_3, F
$02C8	$1903			BTFSC	STATUS, Z
$02C9	$2AD1			GOTO	JPMSETFOV32
$02CA	$	MUL32OK:
$02CA	$1FFA			BTFSS	STACK_10, 7
$02CB	$13F2			BCF	STACK_2, 7
$02CC	$3000			MOVLW	0x00
$02CD	$2AD6			GOTO	MUL32EEE
$02CE	$	JPMRES032:
$02CE	$3001			MOVLW	0x01
$02CF	$236F			CALL	_RES032
$02D0	$2AD6			GOTO	MUL32EEE
$02D1	$	JPMSETFOV32:
$02D1	$3002			MOVLW	0x02
$02D2	$2353			CALL	_SETFOV32
$02D3	$2AD6			GOTO	MUL32EEE
$02D4	$	JPMSETFUN32:
$02D4	$3004			MOVLW	0x04
$02D5	$2361			CALL	_SETFUN32
$02D6	$	MUL32EEE:
$02D6	$0000			NOP
$02D7	$0008			RETURN
$0342	$	_Div_8x8_U:
$0342	$1303			BCF	STATUS, RP1
$0343	$1283			BCF	STATUS, RP0
$0344	$01F8			CLRF	STACK_8, F
$0345	$3008			MOVLW	8
$0346	$00FC			MOVWF	STACK_12
$0347	$0D70			RLF	STACK_0, W
$0348	$0DF8			RLF	STACK_8, F
$0349	$0874			MOVF	STACK_4, W
$034A	$02F8			SUBWF	STACK_8, F
$034B	$1803			BTFSC	STATUS, C
$034C	$2B4F			GOTO	$+3
$034D	$07F8			ADDWF	STACK_8, F
$034E	$1003			BCF	STATUS, C
$034F	$0DF0			RLF	STACK_0, F
$0350	$0BFC			DECFSZ	STACK_12, F
$0351	$2B47			GOTO	$-10
$0352	$0008			RETURN
$0004	$	_FloatToStr:
$0004	$304E			MOVLW	78
$0005	$1303			BCF	STATUS, RP1
$0006	$1283			BCF	STATUS, RP0
$0007	$00B8			MOVWF	lstr1_conv+0
$0008	$3061			MOVLW	97
$0009	$00B9			MOVWF	lstr1_conv+1
$000A	$304E			MOVLW	78
$000B	$00BA			MOVWF	lstr1_conv+2
$000C	$01BB			CLRF	lstr1_conv+3
$000D	$3030			MOVLW	48
$000E	$00BC			MOVWF	lstr2_conv+0
$000F	$01BD			CLRF	lstr2_conv+1
$0010	$3049			MOVLW	73
$0011	$00BE			MOVWF	lstr3_conv+0
$0012	$304E			MOVLW	78
$0013	$00BF			MOVWF	lstr3_conv+1
$0014	$3046			MOVLW	70
$0015	$00C0			MOVWF	lstr3_conv+2
$0016	$01C1			CLRF	lstr3_conv+3
$0017	$01C2			CLRF	FloatToStr_bpoint_L0, 1
$0018	$01C5			CLRF	FloatToStr_dexpon_L0, 1
$0019	$0833			MOVF	FARG_FloatToStr+0, 0
$001A	$00C6			MOVWF	FloatToStr_un_L0
$001B	$0834			MOVF	FARG_FloatToStr+1, 0
$001C	$00C7			MOVWF	FloatToStr_un_L0+1
$001D	$0835			MOVF	FARG_FloatToStr+2, 0
$001E	$00C8			MOVWF	FloatToStr_un_L0+2
$001F	$0836			MOVF	FARG_FloatToStr+3, 0
$0020	$00C9			MOVWF	FloatToStr_un_L0+3
$0021	$0849			MOVF	FloatToStr_un_L0+3, 0
$0022	$3AFF			XORLW	255
$0023	$1D03			BTFSS	STATUS, Z
$0024	$282F			GOTO	L_FloatToStr_60
$0025	$0848			MOVF	FloatToStr_un_L0+2, 0
$0026	$3AFF			XORLW	255
$0027	$1D03			BTFSS	STATUS, Z
$0028	$282F			GOTO	L_FloatToStr_60
$0029	$0847			MOVF	FloatToStr_un_L0+1, 0
$002A	$3AFF			XORLW	255
$002B	$1D03			BTFSS	STATUS, Z
$002C	$282F			GOTO	L_FloatToStr_60
$002D	$0846			MOVF	FloatToStr_un_L0, 0
$002E	$3AFF			XORLW	255
$002F	$	L_FloatToStr_60:
$002F	$1D03			BTFSS	STATUS, Z
$0030	$2839			GOTO	L_FloatToStr_29
$0031	$0837			MOVF	FARG_FloatToStr+4, 0
$0032	$00CA			MOVWF	FARG_strcpy+0
$0033	$3038			MOVLW	lstr1_conv
$0034	$00CB			MOVWF	FARG_strcpy+1
$0035	$2328			CALL	_strcpy
$0036	$3003			MOVLW	3
$0037	$00F0			MOVWF	STACK_0
$0038	$0008			RETURN
$0039	$	L_FloatToStr_29:
$0039	$3001			MOVLW	1
$003A	$00C3			MOVWF	FloatToStr_i_L0
$003B	$1FC8			BTFSS	FloatToStr_un_L0+2, 7
$003C	$2845			GOTO	L_FloatToStr_30
$003D	$3080			MOVLW	128
$003E	$06C8			XORWF	FloatToStr_un_L0+2, 1
$003F	$0AC3			INCF	FloatToStr_i_L0, 1
$0040	$0837			MOVF	FARG_FloatToStr+4, 0
$0041	$0084			MOVWF	FSR
$0042	$302D			MOVLW	45
$0043	$0080			MOVWF	INDF
$0044	$0AB7			INCF	FARG_FloatToStr+4, 1
$0045	$	L_FloatToStr_30:
$0045	$3000			MOVLW	0
$0046	$00F0			MOVWF	STACK_0
$0047	$0649			XORWF	FloatToStr_un_L0+3, 0
$0048	$1D03			BTFSS	STATUS, Z
$0049	$2854			GOTO	L_FloatToStr_61
$004A	$0870			MOVF	STACK_0, 0
$004B	$0648			XORWF	FloatToStr_un_L0+2, 0
$004C	$1D03			BTFSS	STATUS, Z
$004D	$2854			GOTO	L_FloatToStr_61
$004E	$0870			MOVF	STACK_0, 0
$004F	$0647			XORWF	FloatToStr_un_L0+1, 0
$0050	$1D03			BTFSS	STATUS, Z
$0051	$2854			GOTO	L_FloatToStr_61
$0052	$0846			MOVF	FloatToStr_un_L0, 0
$0053	$3A00			XORLW	0
$0054	$	L_FloatToStr_61:
$0054	$1D03			BTFSS	STATUS, Z
$0055	$285D			GOTO	L_FloatToStr_31
$0056	$0837			MOVF	FARG_FloatToStr+4, 0
$0057	$00CA			MOVWF	FARG_strcpy+0
$0058	$303C			MOVLW	lstr2_conv
$0059	$00CB			MOVWF	FARG_strcpy+1
$005A	$2328			CALL	_strcpy
$005B	$01F0			CLRF	STACK_0, 1
$005C	$0008			RETURN
$005D	$	L_FloatToStr_31:
$005D	$0849			MOVF	FloatToStr_un_L0+3, 0
$005E	$3A7F			XORLW	127
$005F	$1D03			BTFSS	STATUS, Z
$0060	$286B			GOTO	L_FloatToStr_62
$0061	$0848			MOVF	FloatToStr_un_L0+2, 0
$0062	$3A80			XORLW	128
$0063	$1D03			BTFSS	STATUS, Z
$0064	$286B			GOTO	L_FloatToStr_62
$0065	$0847			MOVF	FloatToStr_un_L0+1, 0
$0066	$3A00			XORLW	0
$0067	$1D03			BTFSS	STATUS, Z
$0068	$286B			GOTO	L_FloatToStr_62
$0069	$0846			MOVF	FloatToStr_un_L0, 0
$006A	$3A00			XORLW	0
$006B	$	L_FloatToStr_62:
$006B	$1D03			BTFSS	STATUS, Z
$006C	$2875			GOTO	L_FloatToStr_32
$006D	$0837			MOVF	FARG_FloatToStr+4, 0
$006E	$00CA			MOVWF	FARG_strcpy+0
$006F	$303E			MOVLW	lstr3_conv
$0070	$00CB			MOVWF	FARG_strcpy+1
$0071	$2328			CALL	_strcpy
$0072	$0843			MOVF	FloatToStr_i_L0, 0
$0073	$00F0			MOVWF	STACK_0
$0074	$0008			RETURN
$0075	$	L_FloatToStr_32:
$0075	$	L_FloatToStr_33:
$0075	$3000			MOVLW	0
$0076	$00F4			MOVWF	STACK_4
$0077	$3000			MOVLW	0
$0078	$00F5			MOVWF	STACK_4+1
$0079	$3000			MOVLW	0
$007A	$00F6			MOVWF	STACK_4+2
$007B	$307F			MOVLW	127
$007C	$00F7			MOVWF	STACK_4+3
$007D	$0846			MOVF	FloatToStr_un_L0, 0
$007E	$00F0			MOVWF	STACK_0
$007F	$0847			MOVF	FloatToStr_un_L0+1, 0
$0080	$00F1			MOVWF	STACK_0+1
$0081	$0848			MOVF	FloatToStr_un_L0+2, 0
$0082	$00F2			MOVWF	STACK_0+2
$0083	$0849			MOVF	FloatToStr_un_L0+3, 0
$0084	$00F3			MOVWF	STACK_0+3
$0085	$22D8			CALL	_compare_double
$0086	$3001			MOVLW	1
$0087	$1803			BTFSC	STATUS, C
$0088	$3000			MOVLW	0
$0089	$00F0			MOVWF	STACK_0
$008A	$0870			MOVF	STACK_0, 0
$008B	$1903			BTFSC	STATUS, Z
$008C	$28A8			GOTO	L_FloatToStr_34
$008D	$0846			MOVF	FloatToStr_un_L0, 0
$008E	$00F0			MOVWF	STACK_0
$008F	$0847			MOVF	FloatToStr_un_L0+1, 0
$0090	$00F1			MOVWF	STACK_0+1
$0091	$0848			MOVF	FloatToStr_un_L0+2, 0
$0092	$00F2			MOVWF	STACK_0+2
$0093	$0849			MOVF	FloatToStr_un_L0+3, 0
$0094	$00F3			MOVWF	STACK_0+3
$0095	$3000			MOVLW	0
$0096	$00F4			MOVWF	STACK_4
$0097	$3000			MOVLW	0
$0098	$00F5			MOVWF	STACK_4+1
$0099	$3020			MOVLW	32
$009A	$00F6			MOVWF	STACK_4+2
$009B	$3082			MOVLW	130
$009C	$00F7			MOVWF	STACK_4+3
$009D	$2277			CALL	_mul_32x32_fp
$009E	$0870			MOVF	STACK_0, 0
$009F	$00C6			MOVWF	FloatToStr_un_L0
$00A0	$0871			MOVF	STACK_0+1, 0
$00A1	$00C7			MOVWF	FloatToStr_un_L0+1
$00A2	$0872			MOVF	STACK_0+2, 0
$00A3	$00C8			MOVWF	FloatToStr_un_L0+2
$00A4	$0873			MOVF	STACK_0+3, 0
$00A5	$00C9			MOVWF	FloatToStr_un_L0+3
$00A6	$03C5			DECF	FloatToStr_dexpon_L0, 1
$00A7	$2875			GOTO	L_FloatToStr_33
$00A8	$	L_FloatToStr_34:
$00A8	$	L_FloatToStr_35:
$00A8	$3000			MOVLW	0
$00A9	$00F4			MOVWF	STACK_4
$00AA	$3000			MOVLW	0
$00AB	$00F5			MOVWF	STACK_4+1
$00AC	$3020			MOVLW	32
$00AD	$00F6			MOVWF	STACK_4+2
$00AE	$3082			MOVLW	130
$00AF	$00F7			MOVWF	STACK_4+3
$00B0	$0846			MOVF	FloatToStr_un_L0, 0
$00B1	$00F0			MOVWF	STACK_0
$00B2	$0847			MOVF	FloatToStr_un_L0+1, 0
$00B3	$00F1			MOVWF	STACK_0+1
$00B4	$0848			MOVF	FloatToStr_un_L0+2, 0
$00B5	$00F2			MOVWF	STACK_0+2
$00B6	$0849			MOVF	FloatToStr_un_L0+3, 0
$00B7	$00F3			MOVWF	STACK_0+3
$00B8	$22D8			CALL	_compare_double
$00B9	$3001			MOVLW	1
$00BA	$1C03			BTFSS	STATUS, C
$00BB	$3000			MOVLW	0
$00BC	$00F0			MOVWF	STACK_0
$00BD	$0870			MOVF	STACK_0, 0
$00BE	$1903			BTFSC	STATUS, Z
$00BF	$28DB			GOTO	L_FloatToStr_36
$00C0	$0846			MOVF	FloatToStr_un_L0, 0
$00C1	$00F0			MOVWF	STACK_0
$00C2	$0847			MOVF	FloatToStr_un_L0+1, 0
$00C3	$00F1			MOVWF	STACK_0+1
$00C4	$0848			MOVF	FloatToStr_un_L0+2, 0
$00C5	$00F2			MOVWF	STACK_0+2
$00C6	$0849			MOVF	FloatToStr_un_L0+3, 0
$00C7	$00F3			MOVWF	STACK_0+3
$00C8	$30CD			MOVLW	205
$00C9	$00F4			MOVWF	STACK_4
$00CA	$30CC			MOVLW	204
$00CB	$00F5			MOVWF	STACK_4+1
$00CC	$304C			MOVLW	76
$00CD	$00F6			MOVWF	STACK_4+2
$00CE	$307B			MOVLW	123
$00CF	$00F7			MOVWF	STACK_4+3
$00D0	$2277			CALL	_mul_32x32_fp
$00D1	$0870			MOVF	STACK_0, 0
$00D2	$00C6			MOVWF	FloatToStr_un_L0
$00D3	$0871			MOVF	STACK_0+1, 0
$00D4	$00C7			MOVWF	FloatToStr_un_L0+1
$00D5	$0872			MOVF	STACK_0+2, 0
$00D6	$00C8			MOVWF	FloatToStr_un_L0+2
$00D7	$0873			MOVF	STACK_0+3, 0
$00D8	$00C9			MOVWF	FloatToStr_un_L0+3
$00D9	$0AC5			INCF	FloatToStr_dexpon_L0, 1
$00DA	$28A8			GOTO	L_FloatToStr_35
$00DB	$	L_FloatToStr_36:
$00DB	$30FF			MOVLW	255
$00DC	$0546			ANDWF	FloatToStr_un_L0, 0
$00DD	$00F5			MOVWF	STACK_5
$00DE	$30FF			MOVLW	255
$00DF	$0547			ANDWF	FloatToStr_un_L0+1, 0
$00E0	$00F6			MOVWF	STACK_5+1
$00E1	$307F			MOVLW	127
$00E2	$0548			ANDWF	FloatToStr_un_L0+2, 0
$00E3	$00F7			MOVWF	STACK_5+2
$00E4	$3000			MOVLW	0
$00E5	$0549			ANDWF	FloatToStr_un_L0+3, 0
$00E6	$00F8			MOVWF	STACK_5+3
$00E7	$0875			MOVF	STACK_5, 0
$00E8	$00F0			MOVWF	STACK_0
$00E9	$0876			MOVF	STACK_5+1, 0
$00EA	$00F1			MOVWF	STACK_0+1
$00EB	$0877			MOVF	STACK_5+2, 0
$00EC	$00F2			MOVWF	STACK_0+2
$00ED	$0878			MOVF	STACK_5+3, 0
$00EE	$00F3			MOVWF	STACK_0+3
$00EF	$0DF0			RLF	STACK_0, 1
$00F0	$0DF1			RLF	STACK_0+1, 1
$00F1	$0DF2			RLF	STACK_0+2, 1
$00F2	$0DF3			RLF	STACK_0+3, 1
$00F3	$1070			BCF	STACK_0, 0
$00F4	$3000			MOVLW	0
$00F5	$05C6			ANDWF	FloatToStr_un_L0, 1
$00F6	$3000			MOVLW	0
$00F7	$05C7			ANDWF	FloatToStr_un_L0+1, 1
$00F8	$3000			MOVLW	0
$00F9	$05C8			ANDWF	FloatToStr_un_L0+2, 1
$00FA	$30FF			MOVLW	255
$00FB	$05C9			ANDWF	FloatToStr_un_L0+3, 1
$00FC	$0870			MOVF	STACK_0, 0
$00FD	$04C6			IORWF	FloatToStr_un_L0, 1
$00FE	$0871			MOVF	STACK_0+1, 0
$00FF	$04C7			IORWF	FloatToStr_un_L0+1, 1
$0100	$0872			MOVF	STACK_0+2, 0
$0101	$04C8			IORWF	FloatToStr_un_L0+2, 1
$0102	$0873			MOVF	STACK_0+3, 0
$0103	$04C9			IORWF	FloatToStr_un_L0+3, 1
$0104	$307F			MOVLW	127
$0105	$0249			SUBWF	FloatToStr_un_L0+3, 0
$0106	$00F0			MOVWF	STACK_0
$0107	$0870			MOVF	STACK_0, 0
$0108	$00C4			MOVWF	FloatToStr_d_L0
$0109	$3001			MOVLW	1
$010A	$00C9			MOVWF	FloatToStr_un_L0+3
$010B	$0870			MOVF	STACK_0, 0
$010C	$	L_FloatToStr_63:
$010C	$1903			BTFSC	STATUS, Z
$010D	$2915			GOTO	L_FloatToStr_64
$010E	$0DC6			RLF	FloatToStr_un_L0, 1
$010F	$0DC7			RLF	FloatToStr_un_L0+1, 1
$0110	$0DC8			RLF	FloatToStr_un_L0+2, 1
$0111	$0DC9			RLF	FloatToStr_un_L0+3, 1
$0112	$1046			BCF	FloatToStr_un_L0, 0
$0113	$3FFF			ADDLW	255
$0114	$290C			GOTO	L_FloatToStr_63
$0115	$	L_FloatToStr_64:
$0115	$0849			MOVF	FloatToStr_un_L0+3, 0
$0116	$3F30			ADDLW	48
$0117	$00F0			MOVWF	STACK_0
$0118	$0837			MOVF	FARG_FloatToStr+4, 0
$0119	$0084			MOVWF	FSR
$011A	$0870			MOVF	STACK_0, 0
$011B	$0080			MOVWF	INDF
$011C	$0AB7			INCF	FARG_FloatToStr+4, 1
$011D	$3080			MOVLW	128
$011E	$0645			XORWF	FloatToStr_dexpon_L0, 0
$011F	$00F0			MOVWF	STACK_0
$0120	$3080			MOVLW	128
$0121	$3A01			XORLW	1
$0122	$0270			SUBWF	STACK_0, 0
$0123	$1C03			BTFSS	STATUS, C
$0124	$292D			GOTO	L374_ex_L_FloatToStr_39
$0125	$3080			MOVLW	128
$0126	$3A06			XORLW	6
$0127	$00F0			MOVWF	STACK_0
$0128	$3080			MOVLW	128
$0129	$0645			XORWF	FloatToStr_dexpon_L0, 0
$012A	$0270			SUBWF	STACK_0, 0
$012B	$1803			BTFSC	STATUS, C
$012C	$2934			GOTO	L_FloatToStr_39
$012D	$	L374_ex_L_FloatToStr_39:
$012D	$0837			MOVF	FARG_FloatToStr+4, 0
$012E	$0084			MOVWF	FSR
$012F	$302E			MOVLW	46
$0130	$0080			MOVWF	INDF
$0131	$0AB7			INCF	FARG_FloatToStr+4, 1
$0132	$3001			MOVLW	1
$0133	$00C2			MOVWF	FloatToStr_bpoint_L0
$0134	$	L_FloatToStr_39:
$0134	$3006			MOVLW	6
$0135	$00C4			MOVWF	FloatToStr_d_L0
$0136	$	L_FloatToStr_40:
$0136	$0844			MOVF	FloatToStr_d_L0, 0
$0137	$3A00			XORLW	0
$0138	$1903			BTFSC	STATUS, Z
$0139	$297A			GOTO	L_FloatToStr_41
$013A	$01C9			CLRF	FloatToStr_un_L0+3, 1
$013B	$0846			MOVF	FloatToStr_un_L0, 0
$013C	$00F0			MOVWF	STACK_0
$013D	$0847			MOVF	FloatToStr_un_L0+1, 0
$013E	$00F1			MOVWF	STACK_0+1
$013F	$0848			MOVF	FloatToStr_un_L0+2, 0
$0140	$00F2			MOVWF	STACK_0+2
$0141	$0849			MOVF	FloatToStr_un_L0+3, 0
$0142	$00F3			MOVWF	STACK_0+3
$0143	$0DF0			RLF	STACK_0, 1
$0144	$0DF1			RLF	STACK_0+1, 1
$0145	$0DF2			RLF	STACK_0+2, 1
$0146	$0DF3			RLF	STACK_0+3, 1
$0147	$1070			BCF	STACK_0, 0
$0148	$0DF0			RLF	STACK_0, 1
$0149	$0DF1			RLF	STACK_0+1, 1
$014A	$0DF2			RLF	STACK_0+2, 1
$014B	$0DF3			RLF	STACK_0+3, 1
$014C	$1070			BCF	STACK_0, 0
$014D	$0870			MOVF	STACK_0, 0
$014E	$07C6			ADDWF	FloatToStr_un_L0, 1
$014F	$0871			MOVF	STACK_0+1, 0
$0150	$1803			BTFSC	STATUS, C
$0151	$0F71			INCFSZ	STACK_0+1, 0
$0152	$07C7			ADDWF	FloatToStr_un_L0+1, 1
$0153	$0872			MOVF	STACK_0+2, 0
$0154	$1803			BTFSC	STATUS, C
$0155	$0F72			INCFSZ	STACK_0+2, 0
$0156	$07C8			ADDWF	FloatToStr_un_L0+2, 1
$0157	$0873			MOVF	STACK_0+3, 0
$0158	$1803			BTFSC	STATUS, C
$0159	$0F73			INCFSZ	STACK_0+3, 0
$015A	$07C9			ADDWF	FloatToStr_un_L0+3, 1
$015B	$0DC6			RLF	FloatToStr_un_L0, 1
$015C	$0DC7			RLF	FloatToStr_un_L0+1, 1
$015D	$0DC8			RLF	FloatToStr_un_L0+2, 1
$015E	$0DC9			RLF	FloatToStr_un_L0+3, 1
$015F	$1046			BCF	FloatToStr_un_L0, 0
$0160	$0849			MOVF	FloatToStr_un_L0+3, 0
$0161	$3F30			ADDLW	48
$0162	$00F0			MOVWF	STACK_0
$0163	$0837			MOVF	FARG_FloatToStr+4, 0
$0164	$0084			MOVWF	FSR
$0165	$0870			MOVF	STACK_0, 0
$0166	$0080			MOVWF	INDF
$0167	$0AB7			INCF	FARG_FloatToStr+4, 1
$0168	$0842			MOVF	FloatToStr_bpoint_L0, 0
$0169	$3A00			XORLW	0
$016A	$1D03			BTFSS	STATUS, Z
$016B	$2978			GOTO	L_FloatToStr_43
$016C	$03C5			DECF	FloatToStr_dexpon_L0, 1
$016D	$0845			MOVF	FloatToStr_dexpon_L0, 0
$016E	$3A00			XORLW	0
$016F	$1D03			BTFSS	STATUS, Z
$0170	$2978			GOTO	L_FloatToStr_44
$0171	$0837			MOVF	FARG_FloatToStr+4, 0
$0172	$0084			MOVWF	FSR
$0173	$302E			MOVLW	46
$0174	$0080			MOVWF	INDF
$0175	$0AB7			INCF	FARG_FloatToStr+4, 1
$0176	$3001			MOVLW	1
$0177	$00C2			MOVWF	FloatToStr_bpoint_L0
$0178	$	L_FloatToStr_44:
$0178	$	L_FloatToStr_43:
$0178	$	L_FloatToStr_42:
$0178	$03C4			DECF	FloatToStr_d_L0, 1
$0179	$2936			GOTO	L_FloatToStr_40
$017A	$	L_FloatToStr_41:
$017A	$	L_FloatToStr_45:
$017A	$30FF			MOVLW	255
$017B	$0737			ADDWF	FARG_FloatToStr+4, 0
$017C	$0084			MOVWF	FSR
$017D	$0800			MOVF	INDF, 0
$017E	$00F4			MOVWF	STACK_4
$017F	$0874			MOVF	STACK_4, 0
$0180	$3A30			XORLW	48
$0181	$1D03			BTFSS	STATUS, Z
$0182	$2985			GOTO	L_FloatToStr_46
$0183	$03B7			DECF	FARG_FloatToStr+4, 1
$0184	$297A			GOTO	L_FloatToStr_45
$0185	$	L_FloatToStr_46:
$0185	$30FF			MOVLW	255
$0186	$0737			ADDWF	FARG_FloatToStr+4, 0
$0187	$0084			MOVWF	FSR
$0188	$0800			MOVF	INDF, 0
$0189	$00F4			MOVWF	STACK_4
$018A	$0874			MOVF	STACK_4, 0
$018B	$3A2E			XORLW	46
$018C	$1D03			BTFSS	STATUS, Z
$018D	$298F			GOTO	L_FloatToStr_47
$018E	$03B7			DECF	FARG_FloatToStr+4, 1
$018F	$	L_FloatToStr_47:
$018F	$0845			MOVF	FloatToStr_dexpon_L0, 0
$0190	$3A00			XORLW	0
$0191	$1903			BTFSC	STATUS, Z
$0192	$29C8			GOTO	L_FloatToStr_48
$0193	$0837			MOVF	FARG_FloatToStr+4, 0
$0194	$0084			MOVWF	FSR
$0195	$3065			MOVLW	101
$0196	$0080			MOVWF	INDF
$0197	$0AB7			INCF	FARG_FloatToStr+4, 1
$0198	$3080			MOVLW	128
$0199	$0645			XORWF	FloatToStr_dexpon_L0, 0
$019A	$00F0			MOVWF	STACK_0
$019B	$3080			MOVLW	128
$019C	$3A00			XORLW	0
$019D	$0270			SUBWF	STACK_0, 0
$019E	$1803			BTFSC	STATUS, C
$019F	$29A8			GOTO	L_FloatToStr_49
$01A0	$0837			MOVF	FARG_FloatToStr+4, 0
$01A1	$0084			MOVWF	FSR
$01A2	$302D			MOVLW	45
$01A3	$0080			MOVWF	INDF
$01A4	$0AB7			INCF	FARG_FloatToStr+4, 1
$01A5	$0845			MOVF	FloatToStr_dexpon_L0, 0
$01A6	$3C00			SUBLW	0
$01A7	$00C5			MOVWF	FloatToStr_dexpon_L0
$01A8	$	L_FloatToStr_49:
$01A8	$0845			MOVF	FloatToStr_dexpon_L0, 0
$01A9	$00C4			MOVWF	FloatToStr_d_L0
$01AA	$0845			MOVF	FloatToStr_dexpon_L0, 0
$01AB	$3C09			SUBLW	9
$01AC	$1803			BTFSC	STATUS, C
$01AD	$29BA			GOTO	L_FloatToStr_50
$01AE	$300A			MOVLW	10
$01AF	$00F4			MOVWF	STACK_4
$01B0	$0844			MOVF	FloatToStr_d_L0, 0
$01B1	$00F0			MOVWF	STACK_0
$01B2	$2342			CALL	_div_8x8_u
$01B3	$3030			MOVLW	48
$01B4	$07F0			ADDWF	STACK_0, 1
$01B5	$0837			MOVF	FARG_FloatToStr+4, 0
$01B6	$0084			MOVWF	FSR
$01B7	$0870			MOVF	STACK_0, 0
$01B8	$0080			MOVWF	INDF
$01B9	$0AB7			INCF	FARG_FloatToStr+4, 1
$01BA	$	L_FloatToStr_50:
$01BA	$300A			MOVLW	10
$01BB	$00F4			MOVWF	STACK_4
$01BC	$0844			MOVF	FloatToStr_d_L0, 0
$01BD	$00F0			MOVWF	STACK_0
$01BE	$2342			CALL	_div_8x8_u
$01BF	$0878			MOVF	STACK_8, 0
$01C0	$00F0			MOVWF	STACK_0
$01C1	$3030			MOVLW	48
$01C2	$07F0			ADDWF	STACK_0, 1
$01C3	$0837			MOVF	FARG_FloatToStr+4, 0
$01C4	$0084			MOVWF	FSR
$01C5	$0870			MOVF	STACK_0, 0
$01C6	$0080			MOVWF	INDF
$01C7	$0AB7			INCF	FARG_FloatToStr+4, 1
$01C8	$	L_FloatToStr_48:
$01C8	$0837			MOVF	FARG_FloatToStr+4, 0
$01C9	$0084			MOVWF	FSR
$01CA	$0180			CLRF	INDF, 1
$01CB	$01F0			CLRF	STACK_0, 1
$01CC	$0008			RETURN
$0378	$	_Get_Fosc_kHz:
;delays.c,1 :: 		unsigned long Get_Fosc_kHz(){
;delays.c,3 :: 		return Clock_kHz();
$0378	$3020			MOVLW	32
$0379	$1303			BCF	STATUS, RP1
$037A	$1283			BCF	STATUS, RP0
$037B	$00F0			MOVWF	STACK_0
$037C	$304E			MOVLW	78
$037D	$00F1			MOVWF	STACK_0+1
$037E	$01F2			CLRF	STACK_0+2
$037F	$01F3			CLRF	STACK_0+3
;delays.c,5 :: 		}
$0380	$0008			RETURN
$01CD	$	_main:
;PortasLogicas.c,26 :: 		void main ()
;PortasLogicas.c,35 :: 		TRISA = 0b00011111;
$01CD	$301F			MOVLW	31
$01CE	$1303			BCF	STATUS, RP1
$01CF	$1683			BSF	STATUS, RP0
$01D0	$0085			MOVWF	TRISA
;PortasLogicas.c,36 :: 		TRISB = 0x00;
$01D1	$0186			CLRF	TRISB, 1
;PortasLogicas.c,37 :: 		TRISC = 0x00;
$01D2	$0187			CLRF	TRISC, 1
;PortasLogicas.c,38 :: 		TRISD = 0x00;
$01D3	$0188			CLRF	TRISD, 1
;PortasLogicas.c,39 :: 		TRISE = 0x00;
$01D4	$0189			CLRF	TRISE, 1
;PortasLogicas.c,40 :: 		ADCON1 = 0x07;
$01D5	$3007			MOVLW	7
$01D6	$009F			MOVWF	ADCON1
;PortasLogicas.c,41 :: 		FloatToStr(b, fr);
$01D7	$1283			BCF	STATUS, RP0
$01D8	$082D			MOVF	main_b_L0, 0
$01D9	$00B3			MOVWF	FARG_FloatToStr+0
$01DA	$082E			MOVF	main_b_L0+1, 0
$01DB	$00B4			MOVWF	FARG_FloatToStr+1
$01DC	$082F			MOVF	main_b_L0+2, 0
$01DD	$00B5			MOVWF	FARG_FloatToStr+2
$01DE	$0830			MOVF	main_b_L0+3, 0
$01DF	$00B6			MOVWF	FARG_FloatToStr+3
$01E0	$3021			MOVLW	main_fr_L0
$01E1	$00B7			MOVWF	FARG_FloatToStr+4
$01E2	$2004			CALL	_FloatToStr
;PortasLogicas.c,44 :: 		b = 12.34;
$01E3	$30A4			MOVLW	164
$01E4	$00AD			MOVWF	main_b_L0
$01E5	$3070			MOVLW	112
$01E6	$00AE			MOVWF	main_b_L0+1
$01E7	$3045			MOVLW	69
$01E8	$00AF			MOVWF	main_b_L0+2
$01E9	$3082			MOVLW	130
$01EA	$00B0			MOVWF	main_b_L0+3
;PortasLogicas.c,46 :: 		porta.f0 ^ porta.f1;
$01EB	$3001			MOVLW	1
$01EC	$00F0			MOVWF	STACK_0
;PortasLogicas.c,47 :: 		porta.f0 & porta.f1;
$01ED	$3001			MOVLW	1
$01EE	$00F0			MOVWF	STACK_0
;PortasLogicas.c,48 :: 		porta.f0 | porta.f1;
$01EF	$3001			MOVLW	1
$01F0	$00F0			MOVWF	STACK_0
;PortasLogicas.c,51 :: 		Get_Fosc_kHz();
$01F1	$2378			CALL	_Get_Fosc_kHz
;PortasLogicas.c,54 :: 		setbit(flags,7);
$01F2	$3080			MOVLW	128
$01F3	$0431			IORWF	main_flags_L0, 0
$01F4	$00F5			MOVWF	STACK_5
$01F5	$0875			MOVF	STACK_5, 0
$01F6	$00B1			MOVWF	main_flags_L0
;PortasLogicas.c,55 :: 		if(getbit(flags,6));
$01F7	$3006			MOVLW	6
$01F8	$00F4			MOVWF	STACK_4
$01F9	$0875			MOVF	STACK_5, 0
$01FA	$00F0			MOVWF	STACK_0
$01FB	$0874			MOVF	STACK_4, 0
$01FC	$	L_main_30:
$01FC	$1903			BTFSC	STATUS, Z
$01FD	$2A02			GOTO	L_main_31
$01FE	$0CF0			RRF	STACK_0, 1
$01FF	$13F0			BCF	STACK_0, 7
$0200	$3FFF			ADDLW	255
$0201	$29FC			GOTO	L_main_30
$0202	$	L_main_31:
$0202	$0870			MOVF	STACK_0, 0
$0203	$3901			ANDLW	1
$0204	$00F0			MOVWF	STACK_0
$0205	$3000			MOVLW	0
$0206	$00F1			MOVWF	STACK_0+1
$0207	$3000			MOVLW	0
$0208	$00F2			MOVWF	STACK_0+2
$0209	$3000			MOVLW	0
$020A	$00F3			MOVWF	STACK_0+3
$020B	$3000			MOVLW	0
$020C	$05F1			ANDWF	STACK_0+1, 1
$020D	$05F2			ANDWF	STACK_0+2, 1
$020E	$05F3			ANDWF	STACK_0+3, 1
$020F	$0870			MOVF	STACK_0, 0
$0210	$0471			IORWF	STACK_0+1, 0
$0211	$0472			IORWF	STACK_0+2, 0
$0212	$0473			IORWF	STACK_0+3, 0
$0213	$1903			BTFSC	STATUS, Z
$0214	$2A15			GOTO	L_main_0
$0215	$	L_main_0:
;PortasLogicas.c,59 :: 		while(true)
$0215	$	L_main_1:
;PortasLogicas.c,62 :: 		porta_logica = PORTA >> 2;
$0215	$0805			MOVF	PORTA, 0
$0216	$00B2			MOVWF	main_porta_logica_L0
$0217	$0CB2			RRF	main_porta_logica_L0, 1
$0218	$13B2			BCF	main_porta_logica_L0, 7
$0219	$0CB2			RRF	main_porta_logica_L0, 1
$021A	$13B2			BCF	main_porta_logica_L0, 7
;PortasLogicas.c,63 :: 		switch (porta_logica)
$021B	$2A64			GOTO	L_main_3
;PortasLogicas.c,66 :: 		case 1 :   if (PORTA.F0 && PORTA.F1) PORTB.F0 = 1;
$021C	$	L_main_5:
$021C	$3001			MOVLW	1
$021D	$0505			ANDWF	PORTA, 0
$021E	$00F0			MOVWF	STACK_0
$021F	$1903			BTFSC	STATUS, Z
$0220	$2A2A			GOTO	L_main_8
$0221	$3000			MOVLW	0
$0222	$1885			BTFSC	PORTA, 1
$0223	$3001			MOVLW	1
$0224	$00F4			MOVWF	STACK_4
$0225	$0874			MOVF	STACK_4, 0
$0226	$1903			BTFSC	STATUS, Z
$0227	$2A2A			GOTO	L_main_8
$0228	$	L42_ex_L_main_8:
$0228	$1406			BSF	PORTB, 0
$0229	$2A2B			GOTO	L_main_9
$022A	$	L_main_8:
;PortasLogicas.c,67 :: 		else  PORTB.F0 = 0;
$022A	$1006			BCF	PORTB, 0
$022B	$	L_main_9:
;PortasLogicas.c,68 :: 		break;
$022B	$2A75			GOTO	L_main_4
;PortasLogicas.c,71 :: 		case 2 :   if (PORTA.F0 || PORTA.F1) PORTB.F0 = 1;
$022C	$	L_main_10:
$022C	$3001			MOVLW	1
$022D	$0505			ANDWF	PORTA, 0
$022E	$00F0			MOVWF	STACK_0
$022F	$1D03			BTFSS	STATUS, Z
$0230	$2A38			GOTO	L64_ex_L_main_13
$0231	$3000			MOVLW	0
$0232	$1885			BTFSC	PORTA, 1
$0233	$3001			MOVLW	1
$0234	$00F4			MOVWF	STACK_4
$0235	$0874			MOVF	STACK_4, 0
$0236	$1903			BTFSC	STATUS, Z
$0237	$2A3A			GOTO	L_main_13
$0238	$	L64_ex_L_main_13:
$0238	$1406			BSF	PORTB, 0
$0239	$2A3B			GOTO	L_main_14
$023A	$	L_main_13:
;PortasLogicas.c,72 :: 		else  PORTB.F0 = 0;
$023A	$1006			BCF	PORTB, 0
$023B	$	L_main_14:
;PortasLogicas.c,73 :: 		break;
$023B	$2A75			GOTO	L_main_4
;PortasLogicas.c,76 :: 		case 3 :   if ((PORTA.F0&&!PORTA.F1)||(!PORTA.F0&&PORTA.F1)) PORTB.F0 = 1;
$023C	$	L_main_15:
$023C	$3001			MOVLW	1
$023D	$0505			ANDWF	PORTA, 0
$023E	$00F0			MOVWF	STACK_0
$023F	$1903			BTFSC	STATUS, Z
$0240	$2A43			GOTO	L83_ex_L104_ex_L_main_22
$0241	$1C85			BTFSS	PORTA, 1
$0242	$2A4D			GOTO	L104_ex_L_main_22
$0243	$	L83_ex_L104_ex_L_main_22:
$0243	$1805			BTFSC	PORTA, 0
$0244	$2A4C			GOTO	L97_ex_L104_ex_L_main_22
$0245	$3000			MOVLW	0
$0246	$1885			BTFSC	PORTA, 1
$0247	$3001			MOVLW	1
$0248	$00F4			MOVWF	STACK_4
$0249	$0874			MOVF	STACK_4, 0
$024A	$1D03			BTFSS	STATUS, Z
$024B	$2A4D			GOTO	L104_ex_L_main_22
$024C	$	L97_ex_L104_ex_L_main_22:
$024C	$2A4F			GOTO	L_main_22
$024D	$	L104_ex_L_main_22:
$024D	$1406			BSF	PORTB, 0
$024E	$2A50			GOTO	L_main_23
$024F	$	L_main_22:
;PortasLogicas.c,77 :: 		else  PORTB.F0 = 0;
$024F	$1006			BCF	PORTB, 0
$0250	$	L_main_23:
;PortasLogicas.c,78 :: 		break;
$0250	$2A75			GOTO	L_main_4
;PortasLogicas.c,81 :: 		case 4 :   if (PORTA.F0 && PORTA.F1) PORTB.F0 = 0;
$0251	$	L_main_24:
$0251	$3001			MOVLW	1
$0252	$0505			ANDWF	PORTA, 0
$0253	$00F0			MOVWF	STACK_0
$0254	$1903			BTFSC	STATUS, Z
$0255	$2A5F			GOTO	L_main_27
$0256	$3000			MOVLW	0
$0257	$1885			BTFSC	PORTA, 1
$0258	$3001			MOVLW	1
$0259	$00F4			MOVWF	STACK_4
$025A	$0874			MOVF	STACK_4, 0
$025B	$1903			BTFSC	STATUS, Z
$025C	$2A5F			GOTO	L_main_27
$025D	$	L126_ex_L_main_27:
$025D	$1006			BCF	PORTB, 0
$025E	$2A60			GOTO	L_main_28
$025F	$	L_main_27:
;PortasLogicas.c,82 :: 		else  PORTB.F0 = 1;
$025F	$1406			BSF	PORTB, 0
$0260	$	L_main_28:
;PortasLogicas.c,83 :: 		break;
$0260	$2A75			GOTO	L_main_4
;PortasLogicas.c,85 :: 		default :
$0261	$	L_main_29:
;PortasLogicas.c,86 :: 		PORTB = 0xFF;
$0261	$30FF			MOVLW	255
$0262	$0086			MOVWF	PORTB
;PortasLogicas.c,88 :: 		}
$0263	$2A75			GOTO	L_main_4
$0264	$	L_main_3:
$0264	$0832			MOVF	main_porta_logica_L0, 0
$0265	$3A01			XORLW	1
$0266	$1903			BTFSC	STATUS, Z
$0267	$2A1C			GOTO	L_main_5
$0268	$0832			MOVF	main_porta_logica_L0, 0
$0269	$3A02			XORLW	2
$026A	$1903			BTFSC	STATUS, Z
$026B	$2A2C			GOTO	L_main_10
$026C	$0832			MOVF	main_porta_logica_L0, 0
$026D	$3A03			XORLW	3
$026E	$1903			BTFSC	STATUS, Z
$026F	$2A3C			GOTO	L_main_15
$0270	$0832			MOVF	main_porta_logica_L0, 0
$0271	$3A04			XORLW	4
$0272	$1903			BTFSC	STATUS, Z
$0273	$2A51			GOTO	L_main_24
$0274	$2A61			GOTO	L_main_29
$0275	$	L_main_4:
;PortasLogicas.c,91 :: 		}
$0275	$2A15			GOTO	L_main_1
;PortasLogicas.c,94 :: 		}
$0276	$2A76			GOTO	$
