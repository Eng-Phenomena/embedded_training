
_main:

;MyProject.c,3 :: 		void main(void)
;MyProject.c,5 :: 		trisb = 0x00;
	CLRF       TRISB+0
;MyProject.c,6 :: 		trisc = 0x00;
	CLRF       TRISC+0
;MyProject.c,7 :: 		trisd = 0x60;
	MOVLW      96
	MOVWF      TRISD+0
;MyProject.c,8 :: 		portb = 0x00;
	CLRF       PORTB+0
;MyProject.c,9 :: 		portc = 0x00;
	CLRF       PORTC+0
;MyProject.c,10 :: 		portd.B7 = 1;
	BSF        PORTD+0, 7
;MyProject.c,12 :: 		while(1)
L_main0:
;MyProject.c,14 :: 		portb = arr[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,15 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,16 :: 		while(portd.B7){
L_main3:
	BTFSS      PORTD+0, 7
	GOTO       L_main4
;MyProject.c,17 :: 		if(portd.B6 == 0)
	BTFSC      PORTD+0, 6
	GOTO       L_main5
;MyProject.c,18 :: 		portd.B7 = 0;
	BCF        PORTD+0, 7
L_main5:
;MyProject.c,19 :: 		if(i == 0){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      0
	XORWF      _i+0, 0
L__main25:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MyProject.c,20 :: 		portc = 0x21;
	MOVLW      33
	MOVWF      PORTC+0
;MyProject.c,21 :: 		if(portb <= 0x03){
	MOVF       PORTB+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,22 :: 		portc = 0x11;
	MOVLW      17
	MOVWF      PORTC+0
;MyProject.c,23 :: 		}
L_main7:
;MyProject.c,24 :: 		}
	GOTO       L_main8
L_main6:
;MyProject.c,26 :: 		portc = 0x0c;
	MOVLW      12
	MOVWF      PORTC+0
;MyProject.c,27 :: 		if(portb <= 0x03){
	MOVF       PORTB+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;MyProject.c,28 :: 		portc = 0x0a;
	MOVLW      10
	MOVWF      PORTC+0
;MyProject.c,29 :: 		}
L_main9:
;MyProject.c,30 :: 		}
L_main8:
;MyProject.c,32 :: 		portb--;
	DECF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,33 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;MyProject.c,34 :: 		if(portb == 0x00){
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;MyProject.c,35 :: 		break;
	GOTO       L_main4
;MyProject.c,36 :: 		}
L_main11:
;MyProject.c,37 :: 		if(!(portb & 0x0f)){
	MOVLW      15
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;MyProject.c,38 :: 		portb -= 0x10;
	MOVLW      16
	SUBWF      PORTB+0, 1
;MyProject.c,39 :: 		portb.B0 = portb.B3 = 1;
	BSF        PORTB+0, 3
	BTFSC      PORTB+0, 3
	GOTO       L__main26
	BCF        PORTB+0, 0
	GOTO       L__main27
L__main26:
	BSF        PORTB+0, 0
L__main27:
;MyProject.c,40 :: 		portb.B1 = portb.B2 = 0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__main28
	BCF        PORTB+0, 1
	GOTO       L__main29
L__main28:
	BSF        PORTB+0, 1
L__main29:
;MyProject.c,41 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;MyProject.c,42 :: 		}
L_main12:
;MyProject.c,44 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,45 :: 		if(portd.B6 == 0){
	BTFSC      PORTD+0, 6
	GOTO       L_main14
;MyProject.c,46 :: 		portd.B7 = 0;
	BCF        PORTD+0, 7
;MyProject.c,47 :: 		if(portd.B5 != 0){
	BTFSS      PORTD+0, 5
	GOTO       L_main15
;MyProject.c,48 :: 		if(tmp == 1){
	MOVLW      0
	XORWF      _tmp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      1
	XORWF      _tmp+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;MyProject.c,49 :: 		portc = 0x12;
	MOVLW      18
	MOVWF      PORTC+0
;MyProject.c,50 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;MyProject.c,51 :: 		tmp--;
	MOVLW      1
	SUBWF      _tmp+0, 1
	BTFSS      STATUS+0, 0
	DECF       _tmp+1, 1
;MyProject.c,52 :: 		}
L_main16:
;MyProject.c,53 :: 		portc = 0x21;
	MOVLW      33
	MOVWF      PORTC+0
;MyProject.c,54 :: 		}
	GOTO       L_main18
L_main15:
;MyProject.c,56 :: 		if(tmp == 0){
	MOVLW      0
	XORWF      _tmp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      0
	XORWF      _tmp+0, 0
L__main31:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;MyProject.c,57 :: 		portc = 0x12;
	MOVLW      18
	MOVWF      PORTC+0
;MyProject.c,58 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,59 :: 		tmp++;
	INCF       _tmp+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tmp+1, 1
;MyProject.c,60 :: 		}
L_main19:
;MyProject.c,61 :: 		portc = 0x0c;
	MOVLW      12
	MOVWF      PORTC+0
;MyProject.c,62 :: 		}
L_main18:
;MyProject.c,63 :: 		}
	GOTO       L_main21
L_main14:
;MyProject.c,65 :: 		portd.B7 = 1;
	BSF        PORTD+0, 7
L_main21:
;MyProject.c,66 :: 		if(i == 0)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      0
	XORWF      _i+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MyProject.c,67 :: 		i = 1;
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
	GOTO       L_main23
L_main22:
;MyProject.c,69 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
L_main23:
;MyProject.c,70 :: 		}
	GOTO       L_main0
;MyProject.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
