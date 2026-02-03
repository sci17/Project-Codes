.data
	input1: .asciiz "Input 1:"
	input2: .asciiz "Input 2:"
	
.globl main
.text

main:
	li, $v0, 4
	la, $a0, input1
	syscall
	
	li $v0, 4
	la, $a0, input2
	syscall
	