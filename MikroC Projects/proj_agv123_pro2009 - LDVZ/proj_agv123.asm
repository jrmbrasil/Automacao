
_StrConstCpy:

;proj_agv123.c,54 :: 		void StrConstCpy(char *dest, const char *source) {
;proj_agv123.c,55 :: 		while(*source)
L_StrConstCpy0:
	MOVF       FARG_StrConstCpy_source+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_StrConstCpy_source+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_StrConstCpy1
;proj_agv123.c,56 :: 		*dest++ = *source++ ;
	MOVF       FARG_StrConstCpy_source+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_StrConstCpy_source+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       FARG_StrConstCpy_dest+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FARG_StrConstCpy_dest+0, 1
	INCF       FARG_StrConstCpy_source+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_StrConstCpy_source+1, 1
	GOTO       L_StrConstCpy0
L_StrConstCpy1:
;proj_agv123.c,58 :: 		*dest = 0 ;
	MOVF       FARG_StrConstCpy_dest+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;proj_agv123.c,59 :: 		}
	RETURN
; end of _StrConstCpy

_main:

;proj_agv123.c,64 :: 		void main(void)
;proj_agv123.c,75 :: 		TRISA=0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;proj_agv123.c,76 :: 		TRISB=0x00;
	CLRF       TRISB+0
;proj_agv123.c,77 :: 		TRISC=0x80; //aqui RX - RC7 (pino 26 pic16f877a) é entrada
	MOVLW      128
	MOVWF      TRISC+0
;proj_agv123.c,78 :: 		TRISD=0x00;
	CLRF       TRISD+0
;proj_agv123.c,79 :: 		TRISE=0x00;
	CLRF       TRISE+0
;proj_agv123.c,82 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;proj_agv123.c,85 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;proj_agv123.c,88 :: 		PIE1.RCIE=1;INTCON.PEIE=1;INTCON.GIE=1; // aceitando interrupção
	BSF        PIE1+0, 5
	BSF        INTCON+0, 6
	BSF        INTCON+0, 7
;proj_agv123.c,93 :: 		lcd_init();
	CALL       _Lcd_Init+0
;proj_agv123.c,94 :: 		lcd_cmd(0x0C);        //sem cursor piscante e deslocamento para direita
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proj_agv123.c,95 :: 		lcd_cmd(0x01);        // limpeza do lcd  e posicionando linha 1, coluna 1.
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proj_agv123.c,96 :: 		delay_ms(2);          // aguardando tempo exigido pelo lcd 1602
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;proj_agv123.c,99 :: 		if(PORTA.F2==1){
	BTFSS      PORTA+0, 2
	GOTO       L_main3
;proj_agv123.c,101 :: 		StrConstCpy(text,string1);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string1+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string1+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,102 :: 		lcd_out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,104 :: 		}
	GOTO       L_main4
L_main3:
;proj_agv123.c,105 :: 		else  mostra_ad();
	CALL       _mostra_ad+0
L_main4:
;proj_agv123.c,108 :: 		pwm1_init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;proj_agv123.c,109 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;proj_agv123.c,110 :: 		pwm1_set_duty(150);
	MOVLW      150
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;proj_agv123.c,112 :: 		pwm2_init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;proj_agv123.c,113 :: 		pwm2_start();
	CALL       _PWM2_Start+0
;proj_agv123.c,114 :: 		pwm2_set_duty(150);
	MOVLW      150
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;proj_agv123.c,115 :: 		T2CON.TMR2ON=1;   //é importante após configurar os dois pwms
	BSF        T2CON+0, 2
;proj_agv123.c,126 :: 		while(true)
L_main5:
;proj_agv123.c,128 :: 		switch   (g)
	GOTO       L_main7
;proj_agv123.c,130 :: 		case 'h':
L_main9:
;proj_agv123.c,131 :: 		sentido_horario();
	CALL       _sentido_horario+0
;proj_agv123.c,132 :: 		if(PORTA.F2==1){
	BTFSS      PORTA+0, 2
	GOTO       L_main10
;proj_agv123.c,133 :: 		if(flag !=1) {
	MOVF       _flag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;proj_agv123.c,134 :: 		lcd_cmd(0x01);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proj_agv123.c,135 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;proj_agv123.c,137 :: 		StrConstCpy(text,string1);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string1+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string1+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,138 :: 		lcd_out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,140 :: 		StrConstCpy(text,string3);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string3+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string3+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,141 :: 		lcd_out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,142 :: 		flag = 1;
	MOVLW      1
	MOVWF      _flag+0
;proj_agv123.c,143 :: 		}
L_main11:
;proj_agv123.c,144 :: 		}
	GOTO       L_main13
L_main10:
;proj_agv123.c,145 :: 		else mostra_ad();
	CALL       _mostra_ad+0
L_main13:
;proj_agv123.c,146 :: 		break;
	GOTO       L_main8
;proj_agv123.c,148 :: 		case 'a':
L_main14:
;proj_agv123.c,149 :: 		sentido_antihorario();
	CALL       _sentido_antihorario+0
;proj_agv123.c,150 :: 		if(PORTA.F2==1) {
	BTFSS      PORTA+0, 2
	GOTO       L_main15
;proj_agv123.c,151 :: 		if (flag !=2) {
	MOVF       _flag+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main16
;proj_agv123.c,152 :: 		lcd_cmd(0x01);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proj_agv123.c,153 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
	NOP
;proj_agv123.c,155 :: 		StrConstCpy(text,string1);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string1+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string1+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,156 :: 		lcd_out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,158 :: 		StrConstCpy(text,string2);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string2+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string2+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,159 :: 		lcd_out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,160 :: 		flag = 2;
	MOVLW      2
	MOVWF      _flag+0
;proj_agv123.c,161 :: 		}
L_main16:
;proj_agv123.c,162 :: 		}
	GOTO       L_main18
L_main15:
;proj_agv123.c,163 :: 		else  mostra_ad();
	CALL       _mostra_ad+0
L_main18:
;proj_agv123.c,164 :: 		break;
	GOTO       L_main8
;proj_agv123.c,167 :: 		default :   mostra_ad();
L_main19:
	CALL       _mostra_ad+0
;proj_agv123.c,168 :: 		}
	GOTO       L_main8
L_main7:
	MOVF       _g+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _g+0, 0
	XORLW      97
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	GOTO       L_main19
L_main8:
;proj_agv123.c,170 :: 		}
	GOTO       L_main5
;proj_agv123.c,172 :: 		}
	GOTO       $+0
; end of _main

_sentido_horario:

;proj_agv123.c,176 :: 		void   sentido_horario()
;proj_agv123.c,179 :: 		PORTB = 0x01;
	MOVLW      1
	MOVWF      PORTB+0
;proj_agv123.c,180 :: 		for (d=0; d<3; d++)
	CLRF       R2+0
L_sentido_horario20:
	MOVLW      3
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sentido_horario21
;proj_agv123.c,182 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_sentido_horario23:
	DECFSZ     R13+0, 1
	GOTO       L_sentido_horario23
	DECFSZ     R12+0, 1
	GOTO       L_sentido_horario23
	NOP
;proj_agv123.c,183 :: 		PORTB <<=1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;proj_agv123.c,180 :: 		for (d=0; d<3; d++)
	INCF       R2+0, 1
;proj_agv123.c,184 :: 		}
	GOTO       L_sentido_horario20
L_sentido_horario21:
;proj_agv123.c,186 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_sentido_horario24:
	DECFSZ     R13+0, 1
	GOTO       L_sentido_horario24
	DECFSZ     R12+0, 1
	GOTO       L_sentido_horario24
	NOP
;proj_agv123.c,187 :: 		}
	RETURN
; end of _sentido_horario

_sentido_antihorario:

;proj_agv123.c,190 :: 		void   sentido_antihorario()
;proj_agv123.c,193 :: 		PORTB = 0x08;
	MOVLW      8
	MOVWF      PORTB+0
;proj_agv123.c,194 :: 		for (d=0; d<3; d++)
	CLRF       R2+0
L_sentido_antihorario25:
	MOVLW      3
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sentido_antihorario26
;proj_agv123.c,196 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_sentido_antihorario28:
	DECFSZ     R13+0, 1
	GOTO       L_sentido_antihorario28
	DECFSZ     R12+0, 1
	GOTO       L_sentido_antihorario28
	NOP
;proj_agv123.c,197 :: 		PORTB >>=1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;proj_agv123.c,194 :: 		for (d=0; d<3; d++)
	INCF       R2+0, 1
;proj_agv123.c,198 :: 		}
	GOTO       L_sentido_antihorario25
L_sentido_antihorario26:
;proj_agv123.c,200 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_sentido_antihorario29:
	DECFSZ     R13+0, 1
	GOTO       L_sentido_antihorario29
	DECFSZ     R12+0, 1
	GOTO       L_sentido_antihorario29
	NOP
;proj_agv123.c,201 :: 		}
	RETURN
; end of _sentido_antihorario

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;proj_agv123.c,205 :: 		void interrupt ()
;proj_agv123.c,207 :: 		if (RCIF) g = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _g+0
;proj_agv123.c,208 :: 		uart1_write(g);
	MOVF       _g+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;proj_agv123.c,210 :: 		}
L__interrupt33:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_mostra_ad:

;proj_agv123.c,213 :: 		void   mostra_ad()
;proj_agv123.c,218 :: 		if(flag!=3) {
	MOVF       _flag+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_mostra_ad31
;proj_agv123.c,219 :: 		lcd_cmd(0x01);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proj_agv123.c,220 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_mostra_ad32:
	DECFSZ     R13+0, 1
	GOTO       L_mostra_ad32
	DECFSZ     R12+0, 1
	GOTO       L_mostra_ad32
	NOP
	NOP
;proj_agv123.c,221 :: 		StrConstCpy(text, string4);
	MOVLW      _text+0
	MOVWF      FARG_StrConstCpy_dest+0
	MOVF       _string4+0, 0
	MOVWF      FARG_StrConstCpy_source+0
	MOVF       _string4+1, 0
	MOVWF      FARG_StrConstCpy_source+1
	CALL       _StrConstCpy+0
;proj_agv123.c,222 :: 		}
L_mostra_ad31:
;proj_agv123.c,224 :: 		dado_adc = adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      mostra_ad_dado_adc_L0+0
	MOVF       R0+1, 0
	MOVWF      mostra_ad_dado_adc_L0+1
;proj_agv123.c,225 :: 		lcd_out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,226 :: 		convert = dado_adc * 5;
	MOVF       mostra_ad_dado_adc_L0+0, 0
	MOVWF      R0+0
	MOVF       mostra_ad_dado_adc_L0+1, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
;proj_agv123.c,227 :: 		convert = convert / 1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;proj_agv123.c,229 :: 		FloatToStr(convert, string_dado);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      mostra_ad_string_dado_L0+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;proj_agv123.c,230 :: 		lcd_out(2,2,string_dado);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      mostra_ad_string_dado_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proj_agv123.c,231 :: 		lcd_out_cp("V");
	MOVLW      ?lstr5_proj_agv123+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;proj_agv123.c,232 :: 		flag = 3;
	MOVLW      3
	MOVWF      _flag+0
;proj_agv123.c,233 :: 		}
	RETURN
; end of _mostra_ad
