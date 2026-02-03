.data

	input: .asciiz "Enter a number: "
	result: .asciiz "The Fibonacci Sequence is: "
	space: .asciiz " "

.text
.globl main

main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0
	li $t2, 1
	li $t3, 0
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
	
calculate_sequence:
	add $t4, $t1, $t2
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	move $t1, $t2
	move $t2, $t4
	addi $t3, $t3, 1
	
	bne $t3, $t0 calculate_sequence
	
	li $v0, 10
	syscall