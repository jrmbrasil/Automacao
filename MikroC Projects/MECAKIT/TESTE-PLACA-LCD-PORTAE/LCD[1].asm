
_main:

;LCD.c,42 :: 		void main(void)
;LCD.c,44 :: 		int numero = 0;
;LCD.c,46 :: 		char i=0;
	CLRF       main_i_L0+0
;LCD.c,47 :: 		TRISA=0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;LCD.c,48 :: 		TRISB=0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;LCD.c,49 :: 		TRISC=0X00;
	CLRF       TRISC+0
;LCD.c,50 :: 		TRISD=0x00;
	CLRF       TRISD+0
;LCD.c,53 :: 		ADCON1 = 0B00001110;//HABILITA SÓ RA0 COMO ANAL
	MOVLW      14
	MOVWF      ADCON1+0
;LCD.c,54 :: 		NOT_RBPU_bit = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;LCD.c,58 :: 		while(1)
L_main0:
;LCD.c,61 :: 		lcd_init();
	CALL       _Lcd_Init+0
;LCD.c,62 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,63 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,64 :: 		lcd_cmd(_LCD_FIRST_ROW);
	MOVLW      128
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,65 :: 		delay_ms(2);          // aguardando tempo exigido pelo lcd 1602
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;LCD.c,67 :: 		lcd_out(1,2,"SENAI *2015*");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,68 :: 		lcd_out(2,9,string1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,74 :: 		PORTD = 0X80;
	MOVLW      128
	MOVWF      PORTD+0
;LCD.c,75 :: 		for(i=1;i<8;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main3:
	MOVLW      8
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;LCD.c,76 :: 		PORTD=PORTD>>1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;LCD.c,77 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;LCD.c,75 :: 		for(i=1;i<8;i++){
	INCF       main_i_L0+0, 1
;LCD.c,78 :: 		}
	GOTO       L_main3
L_main4:
;LCD.c,79 :: 		for(i=1;i<8;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main7:
	MOVLW      8
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;LCD.c,80 :: 		PORTD=PORTD<<1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;LCD.c,81 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;LCD.c,79 :: 		for(i=1;i<8;i++){
	INCF       main_i_L0+0, 1
;LCD.c,82 :: 		}
	GOTO       L_main7
L_main8:
;LCD.c,83 :: 		for(i=1;i<8;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main11:
	MOVLW      8
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;LCD.c,84 :: 		PORTD=PORTD>>1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;LCD.c,85 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;LCD.c,83 :: 		for(i=1;i<8;i++){
	INCF       main_i_L0+0, 1
;LCD.c,86 :: 		}
	GOTO       L_main11
L_main12:
;LCD.c,87 :: 		for(i=1;i<8;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main15:
	MOVLW      8
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;LCD.c,88 :: 		PORTD=PORTD<<1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;LCD.c,89 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;LCD.c,87 :: 		for(i=1;i<8;i++){
	INCF       main_i_L0+0, 1
;LCD.c,90 :: 		}
	GOTO       L_main15
L_main16:
;LCD.c,91 :: 		PORTD=0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;LCD.c,92 :: 		for(i=1;i<30;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main19:
	MOVLW      30
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;LCD.c,93 :: 		PORTD=~PORTD;
	COMF       PORTD+0, 1
;LCD.c,94 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;LCD.c,92 :: 		for(i=1;i<30;i++){
	INCF       main_i_L0+0, 1
;LCD.c,95 :: 		}
	GOTO       L_main19
L_main20:
;LCD.c,96 :: 		for(i=1;i<14;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main23:
	MOVLW      14
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;LCD.c,97 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,98 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	NOP
;LCD.c,96 :: 		for(i=1;i<14;i++){
	INCF       main_i_L0+0, 1
;LCD.c,99 :: 		}
	GOTO       L_main23
L_main24:
;LCD.c,100 :: 		for(i=1;i<21;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main27:
	MOVLW      21
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;LCD.c,101 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,102 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
	NOP
;LCD.c,100 :: 		for(i=1;i<21;i++){
	INCF       main_i_L0+0, 1
;LCD.c,103 :: 		}
	GOTO       L_main27
L_main28:
;LCD.c,104 :: 		for(i=1;i<21;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main31:
	MOVLW      21
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main32
;LCD.c,105 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,106 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;LCD.c,104 :: 		for(i=1;i<21;i++){
	INCF       main_i_L0+0, 1
;LCD.c,107 :: 		}
	GOTO       L_main31
L_main32:
;LCD.c,108 :: 		for(i=1;i<20;i++){
	MOVLW      1
	MOVWF      main_i_L0+0
L_main35:
	MOVLW      20
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main36
;LCD.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,110 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;LCD.c,111 :: 		lcd_out(1,2,"TESTE OS BOTOES AGORA!!!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,112 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
	NOP
;LCD.c,108 :: 		for(i=1;i<20;i++){
	INCF       main_i_L0+0, 1
;LCD.c,113 :: 		}
	GOTO       L_main35
L_main36:
;LCD.c,116 :: 		TRISD=0x00;
	CLRF       TRISD+0
;LCD.c,117 :: 		PORTD=0x00;
	CLRF       PORTD+0
;LCD.c,118 :: 		while(1)
L_main40:
;LCD.c,120 :: 		if(!S1)D6=1;
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main42
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
L_main42:
;LCD.c,121 :: 		if(S1)D6=0;
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main43
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
L_main43:
;LCD.c,122 :: 		if(!S2)D7=1;
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main44
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
L_main44:
;LCD.c,123 :: 		if(S2)D7=0;
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main45
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
L_main45:
;LCD.c,124 :: 		if(!S3)D8=1;
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main46
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
L_main46:
;LCD.c,125 :: 		if(S3)D8=0;
	BTFSS      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_main47
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
L_main47:
;LCD.c,126 :: 		if(!S4)D9=1;
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main48
	BSF        RD3_bit+0, BitPos(RD3_bit+0)
L_main48:
;LCD.c,127 :: 		if(S4)D9=0;
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main49
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
L_main49:
;LCD.c,128 :: 		if(!S5)D10=1;
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main50
	BSF        RD4_bit+0, BitPos(RD4_bit+0)
L_main50:
;LCD.c,129 :: 		if(S5)D10=0;
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main51
	BCF        RD4_bit+0, BitPos(RD4_bit+0)
L_main51:
;LCD.c,130 :: 		if(!S6)D11=1;
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main52
	BSF        RD5_bit+0, BitPos(RD5_bit+0)
L_main52:
;LCD.c,131 :: 		if(S6)D11=0;
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main53
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
L_main53:
;LCD.c,132 :: 		if(!S1 && !S6)break;
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main56
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main56
L__main57:
	GOTO       L_main41
L_main56:
;LCD.c,133 :: 		}
	GOTO       L_main40
L_main41:
;LCD.c,134 :: 		}
	GOTO       L_main0
;LCD.c,135 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
