			;PRACTICA 2
			.MODEL SMALL
			.STACK 100H
			.DATA
MAESTRA		DB 9 DUP (?), 20 DUP(?), 20 DUP(?), 2 DUP(?), 1 DUP(?), 1 DUP(?)
			DB 9 DUP (?), 20 DUP(?), 20 DUP(?), 2 DUP(?), 1 DUP(?), 1 DUP(?)
SALIDA		DB 53 DUP(?)
			.CODE
INICIO		MOV AX,SEG MAESTRA
			MOV DS,AX
			MOV BX,00080H
			MOV AL,ES:[BX]
			CMP AL,03H
			JE UNP
			CMP AL,06H
			JE DOSP
			CMP AL,09H
			JE TRESP
			JNE MALO
UNP:	MOV CX,40						;LLENAR LA TABLA EN FUNCION DE LA ELECCION
		MOV DX,00H
		MOV BX,0082H
		MOV AX,ES:[BX]			
		CMP AX,"F/"
		JE NO_F
		CMP AX,"f/"
		JE NO_F
		CMP AX,"H/"
		JE NO_H
		CMP AX,"h/"
		JE NO_H
		CMP AX,"I/"
		JE NO_I
		CMP AX,"i/"
		JE NO_I
		CMP AX,"S/"
		JE NO_S
		CMP AX,"s/"
		JE NO_S
		CMP AX,"M/"
		JE NO_M
		CMP AX,"m/"
		JE NO_M
		JMP MALO 
NO_F:	MOV SI,OFFSET MAESTRA+52		;COMPROBAMOS SI LA FILA ES "F", PARA EN ESE CASO LLENAR 
		MOV AL,DS:[SI]
		CMP AL,"F"
		JE LAZO1
		CMP AL,"f"
		JE LAZO1
		JMP NOES
		LOOP NO_F	
LAZO1:	MOV SI,OFFSET MAESTRA+DX
		MOV DI,OFFSET SALIDA+DX
		MOV CX,53		
LLENAR:	MOV AL,DS:[SI] 		
		MOV DS:[DI],AL
		INC SI,
		INC DI
		LOOP LLENAR
		
