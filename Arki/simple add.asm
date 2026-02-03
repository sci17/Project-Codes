.text
.globl main

main:
	li $t1, 0x5 #became decimal 
	li $t2, 0x10
	mul $t0, $t1, $t2
	
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	#addi
	#addu
	#mul
	#mult
	#div 