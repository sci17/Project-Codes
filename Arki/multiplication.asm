.data
	start: .asciiz "*"
	user: .asciiz "Enter a number: "
	spaced: .asciiz "            "
	nw: .asciiz "\n"
	
.text
.globl main

main: 
	la $a0, user
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $a0, start
	li $v0, 4
	syscall
	
	li $t1, 1
	li $t2, 1
	
	j loop_print
	
	
	
loop_print:
	la $a0, spaced
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	addi $t1, $t1, 1
	
	bgt $t1, $t0, reset
	
	j loop_print
	
reset:
	li $t1, 1
	
	la $a0, nw
	li $v0, 4
	syscall
	
	j count
	
count:
	move $a0, $t1
	li $v0, 1
	syscall
	
	j multi1

multi1:
	mul $t3, $t1, $t2
	
	la $a0, spaced
	li $v0, 4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	addi $t2, $t2, 1
	
	bgt $t2, $t0, multi2
	
	j multi1
	
multi2:
	li $t2, 1
	
	addi $t1, $t1, 1
	
	la $a0, nw
	li $v0, 4
	syscall
	
	bgt $t1, $t0, end_loop
	
	j count
	
end_loop:
	li $v0, 10
	syscall