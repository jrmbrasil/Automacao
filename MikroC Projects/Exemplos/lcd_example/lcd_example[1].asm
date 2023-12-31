;  ASM code generated by mikroVirtualMachine for PIC - V. 8.1.0.0
;  Date/Time: 11/06/2010 20:31:22
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$29A5			GOTO	_main
$0327	$	_Delay_1us:
;delays.c,7 :: 		void Delay_1us() {
;delays.c,8 :: 		Delay_us(1);
$0327	$3001			MOVLW	1
$0328	$1303			BCF	STATUS, RP1
$0329	$1283			BCF	STATUS, RP0
$032A	$00FA			MOVWF	STACK_10
$032B	$0BFA			DECFSZ	STACK_10, F
$032C	$2B2B			GOTO	$-1
$032D	$0000			NOP
;delays.c,9 :: 		}
$032E	$0008			RETURN
$02FC	$	_Delay_5500us:
;delays.c,31 :: 		void Delay_5500us() {
;delays.c,32 :: 		Delay_us(5500);
$02FC	$3024			MOVLW	36
$02FD	$1303			BCF	STATUS, RP1
$02FE	$1283			BCF	STATUS, RP0
$02FF	$00FB			MOVWF	STACK_11
$0300	$30FF			MOVLW	255
$0301	$00FA			MOVWF	STACK_10
$0302	$0BFB			DECFSZ	STACK_11, F
$0303	$2B05			GOTO	$+2
$0304	$2B08			GOTO	$+4
$0305	$0BFA			DECFSZ	STACK_10, F
$0306	$2B05			GOTO	$-1
$0307	$2B02			GOTO	$-5
$0308	$309E			MOVLW	158
$0309	$00FA			MOVWF	STACK_10
$030A	$0BFA			DECFSZ	STACK_10, F
$030B	$2B0A			GOTO	$-1
;delays.c,33 :: 		}
$030C	$0008			RETURN
$032F	$	_Delay_50us:
;delays.c,19 :: 		void Delay_50us() {
;delays.c,20 :: 		Delay_us(50);
$032F	$3053			MOVLW	83
$0330	$1303			BCF	STATUS, RP1
$0331	$1283			BCF	STATUS, RP0
$0332	$00FA			MOVWF	STACK_10
$0333	$0BFA			DECFSZ	STACK_10, F
$0334	$2B33			GOTO	$-1
;delays.c,21 :: 		}
$0335	$0008			RETURN
$02CE	$	_Div_16x16_S_L:
$02CE	$1303			BCF	STATUS, RP1
$02CF	$1283			BCF	STATUS, RP0
$02D0	$0D71			RLF	STACK_1, W
$02D1	$0DF8			RLF	STACK_8, F
$02D2	$0DF9			RLF	STACK_9, F
$02D3	$0874			MOVF	STACK_4, W
$02D4	$02F8			SUBWF	STACK_8, F
$02D5	$0875			MOVF	STACK_5, W
$02D6	$1C03			BTFSS	STATUS, C
$02D7	$0F75			INCFSZ	STACK_5, W
$02D8	$02F9			SUBWF	STACK_9, F
$02D9	$0DF0			RLF	STACK_0, F
$02DA	$0DF1			RLF	STACK_1, F
$02DB	$300F			MOVLW	15
$02DC	$00FC			MOVWF	STACK_12
$02DD	$0D71			RLF	STACK_1, W
$02DE	$0DF8			RLF	STACK_8, F
$02DF	$0DF9			RLF	STACK_9, F
$02E0	$0874			MOVF	STACK_4, W
$02E1	$1C70			BTFSS	STACK_0, 0
$02E2	$2AE9			GOTO	$+7
$02E3	$02F8			SUBWF	STACK_8, F
$02E4	$0875			MOVF	STACK_5, W
$02E5	$1C03			BTFSS	STATUS, C
$02E6	$0F75			INCFSZ	STACK_5, W
$02E7	$02F9			SUBWF	STACK_9, F
$02E8	$2AEE			GOTO	$+6
$02E9	$07F8			ADDWF	STACK_8, F
$02EA	$0875			MOVF	STACK_5, W
$02EB	$1803			BTFSC	STATUS, C
$02EC	$0F75			INCFSZ	STACK_5, W
$02ED	$07F9			ADDWF	STACK_9, F
$02EE	$0DF0			RLF	STACK_0, F
$02EF	$0DF1			RLF	STACK_1, F
$02F0	$0BFC			DECFSZ	STACK_12, F
$02F1	$2ADD			GOTO	$-20
$02F2	$1870			BTFSC	STACK_0, 0
$02F3	$2AFA			GOTO	$+7
$02F4	$0874			MOVF	STACK_4, W
$02F5	$07F8			ADDWF	STACK_8, F
$02F6	$0875			MOVF	STACK_5, W
$02F7	$1803			BTFSC	STATUS, C
$02F8	$0F75			INCFSZ	STACK_5, W
$02F9	$07F9			ADDWF	STACK_9, F
$02FA	$0000			NOP
$02FB	$0008			RETURN
$0130	$	_Lcd_Custom_Cmd:
$0130	$1303			BCF	STATUS, RP1
$0131	$1283			BCF	STATUS, RP0
$0132	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$0133	$0084			MOVWF	FSR
$0134	$0921			COMF	Lcd_Custom____mENABLE, W
$0135	$00F0			MOVWF	STACK_0
$0136	$0870			MOVF	STACK_0, 0
$0137	$0580			ANDWF	INDF, 1
$0138	$0922			COMF	Lcd_Custom____mRS, W
$0139	$00F0			MOVWF	STACK_0
$013A	$0870			MOVF	STACK_0, 0
$013B	$0580			ANDWF	INDF, 1
$013C	$0823			MOVF	Lcd_Custom_dataport_address, 0
$013D	$0084			MOVWF	FSR
$013E	$0825			MOVF	Lcd_Custom____mDB6, 0
$013F	$0424			IORWF	Lcd_Custom____mDB7, 0
$0140	$00F0			MOVWF	STACK_0
$0141	$0826			MOVF	Lcd_Custom____mDB5, 0
$0142	$04F0			IORWF	STACK_0, 1
$0143	$0827			MOVF	Lcd_Custom____mDB4, 0
$0144	$04F0			IORWF	STACK_0, 1
$0145	$09F0			COMF	STACK_0, F
$0146	$0870			MOVF	STACK_0, 0
$0147	$0580			ANDWF	INDF, 1
$0148	$1FBF			BTFSS	FARG_Lcd_Custom_Cmd+0, 7
$0149	$294C			GOTO	L_Lcd_Custom_Cmd_0
$014A	$0824			MOVF	Lcd_Custom____mDB7, 0
$014B	$0480			IORWF	INDF, 1
$014C	$	L_Lcd_Custom_Cmd_0:
$014C	$1F3F			BTFSS	FARG_Lcd_Custom_Cmd+0, 6
$014D	$2950			GOTO	L_Lcd_Custom_Cmd_1
$014E	$0825			MOVF	Lcd_Custom____mDB6, 0
$014F	$0480			IORWF	INDF, 1
$0150	$	L_Lcd_Custom_Cmd_1:
$0150	$1EBF			BTFSS	FARG_Lcd_Custom_Cmd+0, 5
$0151	$2954			GOTO	L_Lcd_Custom_Cmd_2
$0152	$0826			MOVF	Lcd_Custom____mDB5, 0
$0153	$0480			IORWF	INDF, 1
$0154	$	L_Lcd_Custom_Cmd_2:
$0154	$1E3F			BTFSS	FARG_Lcd_Custom_Cmd+0, 4
$0155	$2958			GOTO	L_Lcd_Custom_Cmd_3
$0156	$0827			MOVF	Lcd_Custom____mDB4, 0
$0157	$0480			IORWF	INDF, 1
$0158	$	L_Lcd_Custom_Cmd_3:
$0158	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$0159	$0084			MOVWF	FSR
$015A	$0828			MOVF	Lcd_Custom_lcdcmd_status, 0
$015B	$1903			BTFSC	STATUS, Z
$015C	$2962			GOTO	L_Lcd_Custom_Cmd_4
$015D	$0922			COMF	Lcd_Custom____mRS, W
$015E	$00F0			MOVWF	STACK_0
$015F	$0870			MOVF	STACK_0, 0
$0160	$0580			ANDWF	INDF, 1
$0161	$2964			GOTO	L_Lcd_Custom_Cmd_5
$0162	$	L_Lcd_Custom_Cmd_4:
$0162	$0822			MOVF	Lcd_Custom____mRS, 0
$0163	$0480			IORWF	INDF, 1
$0164	$	L_Lcd_Custom_Cmd_5:
$0164	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0165	$0480			IORWF	INDF, 1
$0166	$2327			CALL	_Delay_1us
$0167	$0921			COMF	Lcd_Custom____mENABLE, W
$0168	$00F0			MOVWF	STACK_0
$0169	$0870			MOVF	STACK_0, 0
$016A	$0580			ANDWF	INDF, 1
$016B	$0922			COMF	Lcd_Custom____mRS, W
$016C	$00F0			MOVWF	STACK_0
$016D	$0870			MOVF	STACK_0, 0
$016E	$0580			ANDWF	INDF, 1
$016F	$0823			MOVF	Lcd_Custom_dataport_address, 0
$0170	$0084			MOVWF	FSR
$0171	$0825			MOVF	Lcd_Custom____mDB6, 0
$0172	$0424			IORWF	Lcd_Custom____mDB7, 0
$0173	$00F0			MOVWF	STACK_0
$0174	$0826			MOVF	Lcd_Custom____mDB5, 0
$0175	$04F0			IORWF	STACK_0, 1
$0176	$0827			MOVF	Lcd_Custom____mDB4, 0
$0177	$04F0			IORWF	STACK_0, 1
$0178	$09F0			COMF	STACK_0, F
$0179	$0870			MOVF	STACK_0, 0
$017A	$0580			ANDWF	INDF, 1
$017B	$1DBF			BTFSS	FARG_Lcd_Custom_Cmd+0, 3
$017C	$297F			GOTO	L_Lcd_Custom_Cmd_6
$017D	$0824			MOVF	Lcd_Custom____mDB7, 0
$017E	$0480			IORWF	INDF, 1
$017F	$	L_Lcd_Custom_Cmd_6:
$017F	$1D3F			BTFSS	FARG_Lcd_Custom_Cmd+0, 2
$0180	$2983			GOTO	L_Lcd_Custom_Cmd_7
$0181	$0825			MOVF	Lcd_Custom____mDB6, 0
$0182	$0480			IORWF	INDF, 1
$0183	$	L_Lcd_Custom_Cmd_7:
$0183	$1CBF			BTFSS	FARG_Lcd_Custom_Cmd+0, 1
$0184	$2987			GOTO	L_Lcd_Custom_Cmd_8
$0185	$0826			MOVF	Lcd_Custom____mDB5, 0
$0186	$0480			IORWF	INDF, 1
$0187	$	L_Lcd_Custom_Cmd_8:
$0187	$1C3F			BTFSS	FARG_Lcd_Custom_Cmd+0, 0
$0188	$298B			GOTO	L_Lcd_Custom_Cmd_9
$0189	$0827			MOVF	Lcd_Custom____mDB4, 0
$018A	$0480			IORWF	INDF, 1
$018B	$	L_Lcd_Custom_Cmd_9:
$018B	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$018C	$0084			MOVWF	FSR
$018D	$0828			MOVF	Lcd_Custom_lcdcmd_status, 0
$018E	$1903			BTFSC	STATUS, Z
$018F	$2995			GOTO	L_Lcd_Custom_Cmd_10
$0190	$0922			COMF	Lcd_Custom____mRS, W
$0191	$00F0			MOVWF	STACK_0
$0192	$0870			MOVF	STACK_0, 0
$0193	$0580			ANDWF	INDF, 1
$0194	$2997			GOTO	L_Lcd_Custom_Cmd_11
$0195	$	L_Lcd_Custom_Cmd_10:
$0195	$0822			MOVF	Lcd_Custom____mRS, 0
$0196	$0480			IORWF	INDF, 1
$0197	$	L_Lcd_Custom_Cmd_11:
$0197	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0198	$0480			IORWF	INDF, 1
$0199	$2327			CALL	_Delay_1us
$019A	$0921			COMF	Lcd_Custom____mENABLE, W
$019B	$00F0			MOVWF	STACK_0
$019C	$0870			MOVF	STACK_0, 0
$019D	$0580			ANDWF	INDF, 1
$019E	$0828			MOVF	Lcd_Custom_lcdcmd_status, 0
$019F	$1903			BTFSC	STATUS, Z
$01A0	$29A3			GOTO	L_Lcd_Custom_Cmd_12
$01A1	$22FC			CALL	_Delay_5500us
$01A2	$29A4			GOTO	L_Lcd_Custom_Cmd_13
$01A3	$	L_Lcd_Custom_Cmd_12:
$01A3	$232F			CALL	_Delay_50us
$01A4	$	L_Lcd_Custom_Cmd_13:
$01A4	$0008			RETURN
$030D	$	_Div_8x8_U:
$030D	$1303			BCF	STATUS, RP1
$030E	$1283			BCF	STATUS, RP0
$030F	$01F8			CLRF	STACK_8, F
$0310	$3008			MOVLW	8
$0311	$00FC			MOVWF	STACK_12
$0312	$0D70			RLF	STACK_0, W
$0313	$0DF8			RLF	STACK_8, F
$0314	$0874			MOVF	STACK_4, W
$0315	$02F8			SUBWF	STACK_8, F
$0316	$1803			BTFSC	STATUS, C
$0317	$2B1A			GOTO	$+3
$0318	$07F8			ADDWF	STACK_8, F
$0319	$1003			BCF	STATUS, C
$031A	$0DF0			RLF	STACK_0, F
$031B	$0BFC			DECFSZ	STACK_12, F
$031C	$2B12			GOTO	$-10
$031D	$0008			RETURN
$01F4	$	_Div_16x16_S:
$01F4	$1303			BCF	STATUS, RP1
$01F5	$1283			BCF	STATUS, RP0
$01F6	$01FD			CLRF	STACK_13
$01F7	$01F9			CLRF	STACK_9
$01F8	$01F8			CLRF	STACK_8
$01F9	$0871			MOVF	STACK_1, W
$01FA	$0470			IORWF	STACK_0, W
$01FB	$1903			BTFSC	STATUS, Z
$01FC	$3400			RETLW	0
$01FD	$0871			MOVF	STACK_1, W
$01FE	$0675			XORWF	STACK_5, W
$01FF	$00FA			MOVWF	STACK_10
$0200	$1BFA			BTFSC	STACK_10, 7
$0201	$09FD			COMF	STACK_13, F
$0202	$01FB			CLRF	STACK_11
$0203	$1FF5			BTFSS	STACK_5, 7
$0204	$2A0A			GOTO	$+6
$0205	$09F4			COMF	STACK_4, F
$0206	$09F5			COMF	STACK_5, F
$0207	$0AF4			INCF	STACK_4, F
$0208	$1903			BTFSC	STATUS, Z
$0209	$0AF5			INCF	STACK_5, F
$020A	$1FF1			BTFSS	STACK_1, 7
$020B	$2A11			GOTO	$+6
$020C	$09F0			COMF	STACK_0, F
$020D	$09F1			COMF	STACK_1, F
$020E	$0AF0			INCF	STACK_0, F
$020F	$1903			BTFSC	STATUS, Z
$0210	$0AF1			INCF	STACK_1, F
$0211	$0871			MOVF	STACK_1, W
$0212	$0475			IORWF	STACK_5, W
$0213	$00FA			MOVWF	STACK_10
$0214	$1BFA			BTFSC	STACK_10, 7
$0215	$2A26			GOTO	$+17
$0216	$22CE			CALL	_Div_16x16_S_L
$0217	$187B			BTFSC	STACK_11, 0
$0218	$2A39			GOTO	$+33
$0219	$1FFD			BTFSS	STACK_13, 7
$021A	$3400			RETLW	0
$021B	$09F0			COMF	STACK_0, F
$021C	$09F1			COMF	STACK_1, F
$021D	$0AF0			INCF	STACK_0, F
$021E	$1903			BTFSC	STATUS, Z
$021F	$0AF1			INCF	STACK_1, F
$0220	$09F8			COMF	STACK_8, F
$0221	$09F9			COMF	STACK_9, F
$0222	$0AF8			INCF	STACK_8, F
$0223	$1903			BTFSC	STATUS, Z
$0224	$0AF9			INCF	STACK_9, F
$0225	$3400			RETLW	0
$0226	$1FF5			BTFSS	STACK_5, 7
$0227	$2A35			GOTO	$+14
$0228	$1BF1			BTFSC	STACK_1, 7
$0229	$2A31			GOTO	$+8
$022A	$0871			MOVF	STACK_1, W
$022B	$00F9			MOVWF	STACK_9
$022C	$0870			MOVF	STACK_0, W
$022D	$00F8			MOVWF	STACK_8
$022E	$01F1			CLRF	STACK_1
$022F	$01F0			CLRF	STACK_0
$0230	$2A19			GOTO	$-23
$0231	$01F1			CLRF	STACK_1
$0232	$01F0			CLRF	STACK_0
$0233	$0AF0			INCF	STACK_0, F
$0234	$3400			RETLW	0
$0235	$09F1			COMF	STACK_1, F
$0236	$09F0			COMF	STACK_0, F
$0237	$0AFB			INCF	STACK_11, F
$0238	$2A16			GOTO	$-34
$0239	$0AF8			INCF	STACK_8, F
$023A	$1903			BTFSC	STATUS, Z
$023B	$0AF9			INCF	STACK_9, F
$023C	$0874			MOVF	STACK_4, W
$023D	$0278			SUBWF	STACK_8, W
$023E	$1D03			BTFSS	STATUS, Z
$023F	$2A19			GOTO	$-38
$0240	$0875			MOVF	STACK_5, W
$0241	$0279			SUBWF	STACK_9, W
$0242	$1D03			BTFSS	STATUS, Z
$0243	$2A19			GOTO	$-42
$0244	$01F9			CLRF	STACK_9
$0245	$01F8			CLRF	STACK_8
$0246	$0AF0			INCF	STACK_0, F
$0247	$1903			BTFSC	STATUS, Z
$0248	$0AF1			INCF	STACK_1, F
$0249	$1FF1			BTFSS	STACK_1, 7
$024A	$2A19			GOTO	$-49
$024B	$0000			NOP
$024C	$34FF			RETLW	255
$024D	$0008			RETURN
$031E	$	_Lcd_Custom_Chr_CP:
$031E	$1303			BCF	STATUS, RP1
$031F	$1283			BCF	STATUS, RP0
$0320	$01A8			CLRF	Lcd_Custom_lcdcmd_status, 1
$0321	$083E			MOVF	FARG_Lcd_Custom_Chr_CP+0, 0
$0322	$00BF			MOVWF	FARG_Lcd_Custom_Cmd+0
$0323	$2130			CALL	_Lcd_Custom_Cmd
$0324	$3001			MOVLW	1
$0325	$00A8			MOVWF	Lcd_Custom_lcdcmd_status
$0326	$0008			RETURN
$0004	$	_Lcd_Custom_Config:
$0004	$22FC			CALL	_Delay_5500us
$0005	$22FC			CALL	_Delay_5500us
$0006	$22FC			CALL	_Delay_5500us
$0007	$0836			MOVF	FARG_Lcd_Custom_Config+1, 0
$0008	$00F0			MOVWF	STACK_0
$0009	$3001			MOVLW	1
$000A	$00F7			MOVWF	STACK_7
$000B	$0870			MOVF	STACK_0, 0
$000C	$	L_Lcd_Custom_Config_32:
$000C	$1903			BTFSC	STATUS, Z
$000D	$2812			GOTO	L_Lcd_Custom_Config_33
$000E	$0DF7			RLF	STACK_7, 1
$000F	$1077			BCF	STACK_7, 0
$0010	$3FFF			ADDLW	255
$0011	$280C			GOTO	L_Lcd_Custom_Config_32
$0012	$	L_Lcd_Custom_Config_33:
$0012	$0877			MOVF	STACK_7, 0
$0013	$00A4			MOVWF	Lcd_Custom____mDB7
$0014	$0837			MOVF	FARG_Lcd_Custom_Config+2, 0
$0015	$00F0			MOVWF	STACK_0
$0016	$3001			MOVLW	1
$0017	$00F1			MOVWF	STACK_1
$0018	$0870			MOVF	STACK_0, 0
$0019	$	L_Lcd_Custom_Config_34:
$0019	$1903			BTFSC	STATUS, Z
$001A	$281F			GOTO	L_Lcd_Custom_Config_35
$001B	$0DF1			RLF	STACK_1, 1
$001C	$1071			BCF	STACK_1, 0
$001D	$3FFF			ADDLW	255
$001E	$2819			GOTO	L_Lcd_Custom_Config_34
$001F	$	L_Lcd_Custom_Config_35:
$001F	$0871			MOVF	STACK_1, 0
$0020	$00A5			MOVWF	Lcd_Custom____mDB6
$0021	$0838			MOVF	FARG_Lcd_Custom_Config+3, 0
$0022	$00F0			MOVWF	STACK_0
$0023	$3001			MOVLW	1
$0024	$00F6			MOVWF	STACK_6
$0025	$0870			MOVF	STACK_0, 0
$0026	$	L_Lcd_Custom_Config_36:
$0026	$1903			BTFSC	STATUS, Z
$0027	$282C			GOTO	L_Lcd_Custom_Config_37
$0028	$0DF6			RLF	STACK_6, 1
$0029	$1076			BCF	STACK_6, 0
$002A	$3FFF			ADDLW	255
$002B	$2826			GOTO	L_Lcd_Custom_Config_36
$002C	$	L_Lcd_Custom_Config_37:
$002C	$0876			MOVF	STACK_6, 0
$002D	$00A6			MOVWF	Lcd_Custom____mDB5
$002E	$0839			MOVF	FARG_Lcd_Custom_Config+4, 0
$002F	$00F0			MOVWF	STACK_0
$0030	$3001			MOVLW	1
$0031	$00F5			MOVWF	STACK_5
$0032	$0870			MOVF	STACK_0, 0
$0033	$	L_Lcd_Custom_Config_38:
$0033	$1903			BTFSC	STATUS, Z
$0034	$2839			GOTO	L_Lcd_Custom_Config_39
$0035	$0DF5			RLF	STACK_5, 1
$0036	$1075			BCF	STACK_5, 0
$0037	$3FFF			ADDLW	255
$0038	$2833			GOTO	L_Lcd_Custom_Config_38
$0039	$	L_Lcd_Custom_Config_39:
$0039	$0875			MOVF	STACK_5, 0
$003A	$00A7			MOVWF	Lcd_Custom____mDB4
$003B	$083B			MOVF	FARG_Lcd_Custom_Config+6, 0
$003C	$00F0			MOVWF	STACK_0
$003D	$3001			MOVLW	1
$003E	$00F4			MOVWF	STACK_4
$003F	$0870			MOVF	STACK_0, 0
$0040	$	L_Lcd_Custom_Config_40:
$0040	$1903			BTFSC	STATUS, Z
$0041	$2846			GOTO	L_Lcd_Custom_Config_41
$0042	$0DF4			RLF	STACK_4, 1
$0043	$1074			BCF	STACK_4, 0
$0044	$3FFF			ADDLW	255
$0045	$2840			GOTO	L_Lcd_Custom_Config_40
$0046	$	L_Lcd_Custom_Config_41:
$0046	$0874			MOVF	STACK_4, 0
$0047	$00A2			MOVWF	Lcd_Custom____mRS
$0048	$083C			MOVF	FARG_Lcd_Custom_Config+7, 0
$0049	$00F0			MOVWF	STACK_0
$004A	$3001			MOVLW	1
$004B	$00F3			MOVWF	STACK_3
$004C	$0870			MOVF	STACK_0, 0
$004D	$	L_Lcd_Custom_Config_42:
$004D	$1903			BTFSC	STATUS, Z
$004E	$2853			GOTO	L_Lcd_Custom_Config_43
$004F	$0DF3			RLF	STACK_3, 1
$0050	$1073			BCF	STACK_3, 0
$0051	$3FFF			ADDLW	255
$0052	$284D			GOTO	L_Lcd_Custom_Config_42
$0053	$	L_Lcd_Custom_Config_43:
$0053	$0873			MOVF	STACK_3, 0
$0054	$00A9			MOVWF	Lcd_Custom____mRW
$0055	$083D			MOVF	FARG_Lcd_Custom_Config+8, 0
$0056	$00F0			MOVWF	STACK_0
$0057	$3001			MOVLW	1
$0058	$00F2			MOVWF	STACK_2
$0059	$0870			MOVF	STACK_0, 0
$005A	$	L_Lcd_Custom_Config_44:
$005A	$1903			BTFSC	STATUS, Z
$005B	$2860			GOTO	L_Lcd_Custom_Config_45
$005C	$0DF2			RLF	STACK_2, 1
$005D	$1072			BCF	STACK_2, 0
$005E	$3FFF			ADDLW	255
$005F	$285A			GOTO	L_Lcd_Custom_Config_44
$0060	$	L_Lcd_Custom_Config_45:
$0060	$0872			MOVF	STACK_2, 0
$0061	$00A1			MOVWF	Lcd_Custom____mENABLE
$0062	$0835			MOVF	FARG_Lcd_Custom_Config+0, 0
$0063	$00A3			MOVWF	Lcd_Custom_dataport_address
$0064	$083A			MOVF	FARG_Lcd_Custom_Config+5, 0
$0065	$00A0			MOVWF	Lcd_Custom_ctrlport_address
$0066	$0835			MOVF	FARG_Lcd_Custom_Config+0, 0
$0067	$0084			MOVWF	FSR
$0068	$0871			MOVF	STACK_1, 0
$0069	$0477			IORWF	STACK_7, 0
$006A	$00F0			MOVWF	STACK_0
$006B	$0876			MOVF	STACK_6, 0
$006C	$04F0			IORWF	STACK_0, 1
$006D	$0875			MOVF	STACK_5, 0
$006E	$0470			IORWF	STACK_0, 0
$006F	$00F1			MOVWF	STACK_1
$0070	$0971			COMF	STACK_1, W
$0071	$00F0			MOVWF	STACK_0
$0072	$0870			MOVF	STACK_0, 0
$0073	$0580			ANDWF	INDF, 1
$0074	$1784			BSF	FSR, 7
$0075	$0871			MOVF	STACK_1, 0
$0076	$00F0			MOVWF	STACK_0
$0077	$09F0			COMF	STACK_0, F
$0078	$0870			MOVF	STACK_0, 0
$0079	$0580			ANDWF	INDF, 1
$007A	$083A			MOVF	FARG_Lcd_Custom_Config+5, 0
$007B	$0084			MOVWF	FSR
$007C	$0873			MOVF	STACK_3, 0
$007D	$0474			IORWF	STACK_4, 0
$007E	$00F0			MOVWF	STACK_0
$007F	$0872			MOVF	STACK_2, 0
$0080	$04F0			IORWF	STACK_0, 1
$0081	$09F0			COMF	STACK_0, F
$0082	$0870			MOVF	STACK_0, 0
$0083	$0580			ANDWF	INDF, 1
$0084	$1784			BSF	FSR, 7
$0085	$0870			MOVF	STACK_0, 0
$0086	$0580			ANDWF	INDF, 1
$0087	$0835			MOVF	FARG_Lcd_Custom_Config+0, 0
$0088	$0084			MOVWF	FSR
$0089	$0875			MOVF	STACK_5, 0
$008A	$0476			IORWF	STACK_6, 0
$008B	$00F0			MOVWF	STACK_0
$008C	$0870			MOVF	STACK_0, 0
$008D	$0480			IORWF	INDF, 1
$008E	$083A			MOVF	FARG_Lcd_Custom_Config+5, 0
$008F	$0084			MOVWF	FSR
$0090	$0872			MOVF	STACK_2, 0
$0091	$0480			IORWF	INDF, 1
$0092	$2327			CALL	_Delay_1us
$0093	$0921			COMF	Lcd_Custom____mENABLE, W
$0094	$00F0			MOVWF	STACK_0
$0095	$0870			MOVF	STACK_0, 0
$0096	$0580			ANDWF	INDF, 1
$0097	$22FC			CALL	_Delay_5500us
$0098	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0099	$0480			IORWF	INDF, 1
$009A	$2327			CALL	_Delay_1us
$009B	$0921			COMF	Lcd_Custom____mENABLE, W
$009C	$00F0			MOVWF	STACK_0
$009D	$0870			MOVF	STACK_0, 0
$009E	$0580			ANDWF	INDF, 1
$009F	$22FC			CALL	_Delay_5500us
$00A0	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00A1	$0480			IORWF	INDF, 1
$00A2	$2327			CALL	_Delay_1us
$00A3	$0921			COMF	Lcd_Custom____mENABLE, W
$00A4	$00F0			MOVWF	STACK_0
$00A5	$0870			MOVF	STACK_0, 0
$00A6	$0580			ANDWF	INDF, 1
$00A7	$22FC			CALL	_Delay_5500us
$00A8	$0823			MOVF	Lcd_Custom_dataport_address, 0
$00A9	$0084			MOVWF	FSR
$00AA	$0826			MOVF	Lcd_Custom____mDB5, 0
$00AB	$0480			IORWF	INDF, 1
$00AC	$0927			COMF	Lcd_Custom____mDB4, W
$00AD	$00F0			MOVWF	STACK_0
$00AE	$0870			MOVF	STACK_0, 0
$00AF	$0580			ANDWF	INDF, 1
$00B0	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$00B1	$0084			MOVWF	FSR
$00B2	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00B3	$0480			IORWF	INDF, 1
$00B4	$2327			CALL	_Delay_1us
$00B5	$0921			COMF	Lcd_Custom____mENABLE, W
$00B6	$00F0			MOVWF	STACK_0
$00B7	$0870			MOVF	STACK_0, 0
$00B8	$0580			ANDWF	INDF, 1
$00B9	$22FC			CALL	_Delay_5500us
$00BA	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00BB	$0480			IORWF	INDF, 1
$00BC	$2327			CALL	_Delay_1us
$00BD	$0921			COMF	Lcd_Custom____mENABLE, W
$00BE	$00F0			MOVWF	STACK_0
$00BF	$0870			MOVF	STACK_0, 0
$00C0	$0580			ANDWF	INDF, 1
$00C1	$0823			MOVF	Lcd_Custom_dataport_address, 0
$00C2	$0084			MOVWF	FSR
$00C3	$0926			COMF	Lcd_Custom____mDB5, W
$00C4	$00F0			MOVWF	STACK_0
$00C5	$0870			MOVF	STACK_0, 0
$00C6	$0580			ANDWF	INDF, 1
$00C7	$0824			MOVF	Lcd_Custom____mDB7, 0
$00C8	$0480			IORWF	INDF, 1
$00C9	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$00CA	$0084			MOVWF	FSR
$00CB	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00CC	$0480			IORWF	INDF, 1
$00CD	$2327			CALL	_Delay_1us
$00CE	$0921			COMF	Lcd_Custom____mENABLE, W
$00CF	$00F0			MOVWF	STACK_0
$00D0	$0870			MOVF	STACK_0, 0
$00D1	$0580			ANDWF	INDF, 1
$00D2	$22FC			CALL	_Delay_5500us
$00D3	$0823			MOVF	Lcd_Custom_dataport_address, 0
$00D4	$0084			MOVWF	FSR
$00D5	$0924			COMF	Lcd_Custom____mDB7, W
$00D6	$00F0			MOVWF	STACK_0
$00D7	$0870			MOVF	STACK_0, 0
$00D8	$0580			ANDWF	INDF, 1
$00D9	$0827			MOVF	Lcd_Custom____mDB4, 0
$00DA	$0480			IORWF	INDF, 1
$00DB	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$00DC	$0084			MOVWF	FSR
$00DD	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00DE	$0480			IORWF	INDF, 1
$00DF	$2327			CALL	_Delay_1us
$00E0	$0921			COMF	Lcd_Custom____mENABLE, W
$00E1	$00F0			MOVWF	STACK_0
$00E2	$0870			MOVF	STACK_0, 0
$00E3	$0580			ANDWF	INDF, 1
$00E4	$0823			MOVF	Lcd_Custom_dataport_address, 0
$00E5	$0084			MOVWF	FSR
$00E6	$0927			COMF	Lcd_Custom____mDB4, W
$00E7	$00F0			MOVWF	STACK_0
$00E8	$0870			MOVF	STACK_0, 0
$00E9	$0580			ANDWF	INDF, 1
$00EA	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$00EB	$0084			MOVWF	FSR
$00EC	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00ED	$0480			IORWF	INDF, 1
$00EE	$2327			CALL	_Delay_1us
$00EF	$0921			COMF	Lcd_Custom____mENABLE, W
$00F0	$00F0			MOVWF	STACK_0
$00F1	$0870			MOVF	STACK_0, 0
$00F2	$0580			ANDWF	INDF, 1
$00F3	$22FC			CALL	_Delay_5500us
$00F4	$0821			MOVF	Lcd_Custom____mENABLE, 0
$00F5	$0480			IORWF	INDF, 1
$00F6	$2327			CALL	_Delay_1us
$00F7	$0921			COMF	Lcd_Custom____mENABLE, W
$00F8	$00F0			MOVWF	STACK_0
$00F9	$0870			MOVF	STACK_0, 0
$00FA	$0580			ANDWF	INDF, 1
$00FB	$0823			MOVF	Lcd_Custom_dataport_address, 0
$00FC	$0084			MOVWF	FSR
$00FD	$0827			MOVF	Lcd_Custom____mDB4, 0
$00FE	$0480			IORWF	INDF, 1
$00FF	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$0100	$0084			MOVWF	FSR
$0101	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0102	$0480			IORWF	INDF, 1
$0103	$2327			CALL	_Delay_1us
$0104	$0921			COMF	Lcd_Custom____mENABLE, W
$0105	$00F0			MOVWF	STACK_0
$0106	$0870			MOVF	STACK_0, 0
$0107	$0580			ANDWF	INDF, 1
$0108	$22FC			CALL	_Delay_5500us
$0109	$0823			MOVF	Lcd_Custom_dataport_address, 0
$010A	$0084			MOVWF	FSR
$010B	$0927			COMF	Lcd_Custom____mDB4, W
$010C	$00F0			MOVWF	STACK_0
$010D	$0870			MOVF	STACK_0, 0
$010E	$0580			ANDWF	INDF, 1
$010F	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$0110	$0084			MOVWF	FSR
$0111	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0112	$0480			IORWF	INDF, 1
$0113	$2327			CALL	_Delay_1us
$0114	$0921			COMF	Lcd_Custom____mENABLE, W
$0115	$00F0			MOVWF	STACK_0
$0116	$0870			MOVF	STACK_0, 0
$0117	$0580			ANDWF	INDF, 1
$0118	$0823			MOVF	Lcd_Custom_dataport_address, 0
$0119	$0084			MOVWF	FSR
$011A	$0826			MOVF	Lcd_Custom____mDB5, 0
$011B	$0427			IORWF	Lcd_Custom____mDB4, 0
$011C	$00F0			MOVWF	STACK_0
$011D	$0825			MOVF	Lcd_Custom____mDB6, 0
$011E	$04F0			IORWF	STACK_0, 1
$011F	$0824			MOVF	Lcd_Custom____mDB7, 0
$0120	$04F0			IORWF	STACK_0, 1
$0121	$0870			MOVF	STACK_0, 0
$0122	$0480			IORWF	INDF, 1
$0123	$0820			MOVF	Lcd_Custom_ctrlport_address, 0
$0124	$0084			MOVWF	FSR
$0125	$0821			MOVF	Lcd_Custom____mENABLE, 0
$0126	$0480			IORWF	INDF, 1
$0127	$2327			CALL	_Delay_1us
$0128	$0921			COMF	Lcd_Custom____mENABLE, W
$0129	$00F0			MOVWF	STACK_0
$012A	$0870			MOVF	STACK_0, 0
$012B	$0580			ANDWF	INDF, 1
$012C	$22FC			CALL	_Delay_5500us
$012D	$3001			MOVLW	1
$012E	$00A8			MOVWF	Lcd_Custom_lcdcmd_status
$012F	$0008			RETURN
$0291	$	_ByteToStr:
$0291	$1303			BCF	STATUS, RP1
$0292	$1283			BCF	STATUS, RP0
$0293	$0836			MOVF	FARG_ByteToStr+1, 0
$0294	$0084			MOVWF	FSR
$0295	$3020			MOVLW	32
$0296	$0080			MOVWF	INDF
$0297	$3020			MOVLW	32
$0298	$0A84			INCF	FSR, F
$0299	$0080			MOVWF	INDF
$029A	$0A84			INCF	FSR, F
$029B	$0080			MOVWF	INDF
$029C	$3001			MOVLW	1
$029D	$00B7			MOVWF	ByteToStr_len_L0
$029E	$0835			MOVF	FARG_ByteToStr+0, 0
$029F	$3C09			SUBLW	9
$02A0	$1803			BTFSC	STATUS, C
$02A1	$2AA3			GOTO	L_ByteToStr_0
$02A2	$0AB7			INCF	ByteToStr_len_L0, 1
$02A3	$	L_ByteToStr_0:
$02A3	$0835			MOVF	FARG_ByteToStr+0, 0
$02A4	$3C63			SUBLW	99
$02A5	$1803			BTFSC	STATUS, C
$02A6	$2AA8			GOTO	L_ByteToStr_1
$02A7	$0AB7			INCF	ByteToStr_len_L0, 1
$02A8	$	L_ByteToStr_1:
$02A8	$3003			MOVLW	3
$02A9	$0736			ADDWF	FARG_ByteToStr+1, 0
$02AA	$00F0			MOVWF	STACK_0
$02AB	$0870			MOVF	STACK_0, 0
$02AC	$0084			MOVWF	FSR
$02AD	$0180			CLRF	INDF, 1
$02AE	$0384			DECF	FSR, 1
$02AF	$	L_ByteToStr_2:
$02AF	$0837			MOVF	ByteToStr_len_L0, 0
$02B0	$3C00			SUBLW	0
$02B1	$1803			BTFSC	STATUS, C
$02B2	$2ACD			GOTO	L_ByteToStr_3
$02B3	$300A			MOVLW	10
$02B4	$00F4			MOVWF	STACK_4
$02B5	$0835			MOVF	FARG_ByteToStr+0, 0
$02B6	$00F0			MOVWF	STACK_0
$02B7	$230D			CALL	_div_8x8_u
$02B8	$0878			MOVF	STACK_8, 0
$02B9	$00F0			MOVWF	STACK_0
$02BA	$0870			MOVF	STACK_0, 0
$02BB	$0080			MOVWF	INDF
$02BC	$0800			MOVF	INDF, 0
$02BD	$0235			SUBWF	FARG_ByteToStr+0, 0
$02BE	$00F0			MOVWF	STACK_0
$02BF	$01F1			CLRF	STACK_0+1
$02C0	$1C03			BTFSS	STATUS, C
$02C1	$03F1			DECF	STACK_0+1, 1
$02C2	$300A			MOVLW	10
$02C3	$00F4			MOVWF	STACK_4
$02C4	$01F5			CLRF	STACK_4+1
$02C5	$21F4			CALL	_div_16x16_s
$02C6	$0870			MOVF	STACK_0, 0
$02C7	$00B5			MOVWF	FARG_ByteToStr+0
$02C8	$3030			MOVLW	48
$02C9	$0780			ADDWF	INDF, 1
$02CA	$0384			DECF	FSR, 1
$02CB	$03B7			DECF	ByteToStr_len_L0, 1
$02CC	$2AAF			GOTO	L_ByteToStr_2
$02CD	$	L_ByteToStr_3:
$02CD	$0008			RETURN
$024E	$	_Lcd_Custom_Out:
$024E	$2A60			GOTO	L_Lcd_Custom_Out_23
$024F	$	L_Lcd_Custom_Out_25:
$024F	$3080			MOVLW	128
$0250	$1303			BCF	STATUS, RP1
$0251	$1283			BCF	STATUS, RP0
$0252	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$0253	$2A73			GOTO	L_Lcd_Custom_Out_24
$0254	$	L_Lcd_Custom_Out_26:
$0254	$30C0			MOVLW	192
$0255	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$0256	$2A73			GOTO	L_Lcd_Custom_Out_24
$0257	$	L_Lcd_Custom_Out_27:
$0257	$3094			MOVLW	148
$0258	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$0259	$2A73			GOTO	L_Lcd_Custom_Out_24
$025A	$	L_Lcd_Custom_Out_28:
$025A	$30D4			MOVLW	212
$025B	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$025C	$2A73			GOTO	L_Lcd_Custom_Out_24
$025D	$	L_Lcd_Custom_Out_29:
$025D	$3080			MOVLW	128
$025E	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$025F	$2A73			GOTO	L_Lcd_Custom_Out_24
$0260	$	L_Lcd_Custom_Out_23:
$0260	$1303			BCF	STATUS, RP1
$0261	$1283			BCF	STATUS, RP0
$0262	$0835			MOVF	FARG_Lcd_Custom_Out+0, 0
$0263	$3A01			XORLW	1
$0264	$1903			BTFSC	STATUS, Z
$0265	$2A4F			GOTO	L_Lcd_Custom_Out_25
$0266	$0835			MOVF	FARG_Lcd_Custom_Out+0, 0
$0267	$3A02			XORLW	2
$0268	$1903			BTFSC	STATUS, Z
$0269	$2A54			GOTO	L_Lcd_Custom_Out_26
$026A	$0835			MOVF	FARG_Lcd_Custom_Out+0, 0
$026B	$3A03			XORLW	3
$026C	$1903			BTFSC	STATUS, Z
$026D	$2A57			GOTO	L_Lcd_Custom_Out_27
$026E	$0835			MOVF	FARG_Lcd_Custom_Out+0, 0
$026F	$3A04			XORLW	4
$0270	$1903			BTFSC	STATUS, Z
$0271	$2A5A			GOTO	L_Lcd_Custom_Out_28
$0272	$2A5D			GOTO	L_Lcd_Custom_Out_29
$0273	$	L_Lcd_Custom_Out_24:
$0273	$0336			DECF	FARG_Lcd_Custom_Out+1, 0
$0274	$00F0			MOVWF	STACK_0
$0275	$0835			MOVF	FARG_Lcd_Custom_Out+0, 0
$0276	$07F0			ADDWF	STACK_0, 1
$0277	$0870			MOVF	STACK_0, 0
$0278	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$0279	$0870			MOVF	STACK_0, 0
$027A	$00BF			MOVWF	FARG_Lcd_Custom_Cmd+0
$027B	$2130			CALL	_Lcd_Custom_Cmd
$027C	$01A8			CLRF	Lcd_Custom_lcdcmd_status, 1
$027D	$01B8			CLRF	Lcd_Custom_Out_i_L0, 1
$027E	$	L_Lcd_Custom_Out_30:
$027E	$0838			MOVF	Lcd_Custom_Out_i_L0, 0
$027F	$0737			ADDWF	FARG_Lcd_Custom_Out+2, 0
$0280	$0084			MOVWF	FSR
$0281	$0800			MOVF	INDF, 0
$0282	$00F0			MOVWF	STACK_0
$0283	$0870			MOVF	STACK_0, 0
$0284	$1903			BTFSC	STATUS, Z
$0285	$2A8E			GOTO	L_Lcd_Custom_Out_31
$0286	$0838			MOVF	Lcd_Custom_Out_i_L0, 0
$0287	$0737			ADDWF	FARG_Lcd_Custom_Out+2, 0
$0288	$0084			MOVWF	FSR
$0289	$0800			MOVF	INDF, 0
$028A	$00BE			MOVWF	FARG_Lcd_Custom_Chr_CP+0
$028B	$231E			CALL	_Lcd_Custom_Chr_CP
$028C	$0AB8			INCF	Lcd_Custom_Out_i_L0, 1
$028D	$2A7E			GOTO	L_Lcd_Custom_Out_30
$028E	$	L_Lcd_Custom_Out_31:
$028E	$3001			MOVLW	1
$028F	$00A8			MOVWF	Lcd_Custom_lcdcmd_status
$0290	$0008			RETURN
$01A5	$	_main:
$01A5	$306E			MOVLW	110
$01A6	$1303			BCF	STATUS, RP1
$01A7	$1283			BCF	STATUS, RP0
$01A8	$00AA			MOVWF	lstr1_lcd_example+0
$01A9	$3075			MOVLW	117
$01AA	$00AB			MOVWF	lstr1_lcd_example+1
$01AB	$306C			MOVLW	108
$01AC	$00AC			MOVWF	lstr1_lcd_example+2
$01AD	$306C			MOVLW	108
$01AE	$00AD			MOVWF	lstr1_lcd_example+3
$01AF	$01AE			CLRF	lstr1_lcd_example+4
;lcd_example.c,11 :: 		void main ()
;lcd_example.c,13 :: 		int q = 123;
$01B0	$307B			MOVLW	123
$01B1	$00AF			MOVWF	main_q_L0
$01B2	$3000			MOVLW	0
$01B3	$00B0			MOVWF	main_q_L0+1
;lcd_example.c,16 :: 		TRISA = 0x00;
$01B4	$1683			BSF	STATUS, RP0
$01B5	$0185			CLRF	TRISA, 1
;lcd_example.c,17 :: 		TRISB = 0x00;
$01B6	$0186			CLRF	TRISB, 1
;lcd_example.c,18 :: 		TRISC = 0x00;
$01B7	$0187			CLRF	TRISC, 1
;lcd_example.c,19 :: 		TRISD = 0x00;
$01B8	$0188			CLRF	TRISD, 1
;lcd_example.c,20 :: 		TRISE = 0x00;
$01B9	$0189			CLRF	TRISE, 1
;lcd_example.c,21 :: 		ADCON1= 0x07;
$01BA	$3007			MOVLW	7
$01BB	$009F			MOVWF	ADCON1
;lcd_example.c,22 :: 		q = q + 1;
$01BC	$307C			MOVLW	124
$01BD	$1283			BCF	STATUS, RP0
$01BE	$00AF			MOVWF	main_q_L0
$01BF	$3000			MOVLW	0
$01C0	$00B0			MOVWF	main_q_L0+1
;lcd_example.c,24 :: 		lcd_custom_config(&PORTD,7,6,5,4,&PORTE,0,"null",1);
$01C1	$3008			MOVLW	PORTD
$01C2	$00B5			MOVWF	FARG_Lcd_Custom_Config+0
$01C3	$3007			MOVLW	7
$01C4	$00B6			MOVWF	FARG_Lcd_Custom_Config+1
$01C5	$3006			MOVLW	6
$01C6	$00B7			MOVWF	FARG_Lcd_Custom_Config+2
$01C7	$3005			MOVLW	5
$01C8	$00B8			MOVWF	FARG_Lcd_Custom_Config+3
$01C9	$3004			MOVLW	4
$01CA	$00B9			MOVWF	FARG_Lcd_Custom_Config+4
$01CB	$3009			MOVLW	PORTE
$01CC	$00BA			MOVWF	FARG_Lcd_Custom_Config+5
$01CD	$01BB			CLRF	FARG_Lcd_Custom_Config+6, 1
$01CE	$302A			MOVLW	lstr1_lcd_example
$01CF	$00BC			MOVWF	FARG_Lcd_Custom_Config+7
$01D0	$3001			MOVLW	1
$01D1	$00BD			MOVWF	FARG_Lcd_Custom_Config+8
$01D2	$2004			CALL	_Lcd_Custom_Config
;lcd_example.c,26 :: 		lcd_custom_cmd(0x01);
$01D3	$3001			MOVLW	1
$01D4	$00BF			MOVWF	FARG_Lcd_Custom_Cmd+0
$01D5	$2130			CALL	_Lcd_Custom_Cmd
;lcd_example.c,27 :: 		delay_ms(3);
$01D6	$3014			MOVLW	20
$01D7	$00FB			MOVWF	STACK_11
$01D8	$30FF			MOVLW	255
$01D9	$00FA			MOVWF	STACK_10
$01DA	$0BFB			DECFSZ	STACK_11, F
$01DB	$29DD			GOTO	$+2
$01DC	$29E0			GOTO	$+4
$01DD	$0BFA			DECFSZ	STACK_10, F
$01DE	$29DD			GOTO	$-1
$01DF	$29DA			GOTO	$-5
$01E0	$306C			MOVLW	108
$01E1	$00FA			MOVWF	STACK_10
$01E2	$0BFA			DECFSZ	STACK_10, F
$01E3	$29E2			GOTO	$-1
$01E4	$0000			NOP
$01E5	$0000			NOP
;lcd_example.c,30 :: 		ByteToStr(q,w1);
$01E6	$082F			MOVF	main_q_L0, 0
$01E7	$00B5			MOVWF	FARG_ByteToStr+0
$01E8	$3031			MOVLW	main_w1_L0
$01E9	$00B6			MOVWF	FARG_ByteToStr+1
$01EA	$2291			CALL	_ByteToStr
;lcd_example.c,31 :: 		lcd_custom_out(2,2,w1);
$01EB	$3002			MOVLW	2
$01EC	$00B5			MOVWF	FARG_Lcd_Custom_Out+0
$01ED	$3002			MOVLW	2
$01EE	$00B6			MOVWF	FARG_Lcd_Custom_Out+1
$01EF	$3031			MOVLW	main_w1_L0
$01F0	$00B7			MOVWF	FARG_Lcd_Custom_Out+2
$01F1	$224E			CALL	_Lcd_Custom_Out
;lcd_example.c,33 :: 		asm { goto $ }
$01F2	$29F2			GOTO	$
;lcd_example.c,36 :: 		}
$01F3	$29F3			GOTO	$
