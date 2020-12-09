.data

entrada:	.float 1.0
p1:		.float 0.0
p2:		.float 0.9
erroGlobal:	.float 1.4
taxaAprendizado:.float 0.055
saidaesperada:	.float 0.0
resultado:	.float 0.0

msgA:	.asciiz "\n\nTreino:\n"
msgB:	.asciiz "Erro: "
msgC:	.asciiz "\nPeso 1: "
msgD:	.asciiz "\nPeso 2: "

msgE:	.asciiz "\n\nSaída: "
msgF:	.asciiz " + "
msgG:	.asciiz " = "

.text
main:
	lwc1 $f0, entrada		#load no co-processador 1
	lwc1 $f1, p1
	lwc1 $f2, p2
	lwc1 $f3, erroGlobal
	lwc1 $f4, taxaAprendizado
	lwc1 $f5, saidaesperada
	lwc1 $f6, resultado

	add.s $f5, $f0, $f0
	addi $t0, $zero, 1		#i = 1

FOR1:	slt $t1, $t0, 6			#compara i com 6
	beq $t1, $zero, FimFor1		#salta se for = ou > 6
	mtc1 $t0, $f0
  	cvt.s.w $f0, $f0		#entrada = i
					
	add.s $f5, $f0, $f0
	add.s $f7, $f1, $f2		#f7 = soma p1 e p2
	mul.s $f8, $f7, $f0		#f8 = multip soma por entrada
	sub.s $f3, $f5, $f8
	
	# imprime mensagemA
	li $v0, 4 
	la $a0, msgA
	syscall
	
	# imprime mensagemB
	li $v0, 4 
	la $a0, msgB
	syscall
	
	# imprime float
	li $v0, 2
	mov.s $f12, $f3
	syscall

	# multiplicação feita somente uma vez
	mul.s $f10, $f4, $f0		# f10 = taxa de aprend * entrada
	mul.s $f11, $f10, $f3		# f11 = f10 * erro global
	add.s $f1, $f1, $f11
	add.s $f2, $f2, $f11

	# imprime mensagemC
	li $v0, 4 
	la $a0, msgC
	syscall

	# imprime float
	li $v0, 2
	mov.s $f12, $f1
	syscall

	# imprime mensagemD
	li $v0, 4 
	la $a0, msgD
	syscall

	# imprime float
	li $v0, 2
	mov.s $f12, $f2
	syscall

	# atualização erro global
	sub.s $f9, $f1, $f2
	sub.s $f3, $f5, $f9

	addi $t0, $t0, 1 
	j FOR1

FimFor1:addi $t0, $zero, 1

FOR2:	slt $t1, $t0, 11		#compara i com 11
	beq $t1, $zero, FimFor2		#salta se for = ou > 11
	mtc1 $t0, $f0
  	cvt.s.w $f0, $f0		#entrada = i

	# resultado
	mul.s $f13, $f0, $f1		#f13 = entrada * peso1
	mul.s $f14, $f0, $f2		#f14 = entrada * peso2
	add.s $f6, $f13, $f14		# resultao = f13 + f14

	# imprime mensagemE
	li $v0, 4 
	la $a0, msgE
	syscall

	# imprime float
	li $v0, 2
	mov.s $f12, $f0
	syscall

	# imprime mensagemF
	li $v0, 4 
	la $a0, msgF
	syscall

	# imprime float
	li $v0, 2
	mov.s $f12, $f0
	syscall

	# imprime mensagemG
	li $v0, 4 
	la $a0, msgG
	syscall

	# imprime float
	li $v0, 2
	mov.s $f12, $f6
	syscall

	addi $t0, $t0, 1 
	j FOR2

FimFor2: jr $ra