;**********************************************************************
;    Arquivo-fonte:	    FirstProg.asm
;    Data: 21/01/2011                                                           
;    Versão do arquivo: 1                                              

;    Autor: Profº Engº José Roberto Marques                          
;    Empresa: Senai                                                  

;**********************************************************************
;    Notas: Este programa lê o conteúdo do PORTA e o escreve no PORTB 

;**********************************************************************


	list		p=16f628A	; diretiva para definir o processador
	#include	<p16f628A.inc>	; definições de variáveis específicas para o processador
	
	__CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON & _HS_OSC & _LVP_OFF & _CPD_OFF

;**********************************************************************

	CBLOCK	0x20
		temp  ;esta variável não é utilizada no programa. É apenas para exemplo.
	ENDC

;**********************************************************************
	ORG     0x000             ; vetor de reset do processador

	
	;MOVLW	0x07
    ;MOVWF	CMCON 		;Configura os pinos <RA0:RA3 , RA5 , RE0:RE2> para sinais digitais
	BCF 	STATUS,RP1	 
	BSF 	STATUS,RP0	 ;Seleciona banco 1    
    MOVLW   0x06
    MOVWF   ADCON1
    MOVLW   0x3F		;Carrega 0FH no acumulador (work register ou WREG)
	MOVWF   TRISA   	;PORTA todo saída (6 bits)
	CLRF    TRISB   	;PORTB todo saida (8 bits)
	;BCF		TRISE,4
    ;CLRF    TRISC
    ;BCF		OPTION_REG,7
    BCF 	STATUS,RP0	;Seleciona banco 0
	CLRF    PORTB		;Limpa PORTB
	;CLRW				;Limpa o acumulador

LOOP1:	
	;BCF		PORTC,2
	MOVLW	B'10101010'
	MOVWF	PORTB
	GOTO 	LOOP1

	END                       ; diretiva 'end of program' ou 'fim do programa'