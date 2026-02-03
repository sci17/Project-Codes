.data

value1: .asciiz "Enter your first number:"
value2: .asciiz "Enter your second number:"
rslt_gcf: .asciiz "GCF:"
rslt_lcm: .asciiz "LCM:"
newline: .asciiz "\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, value1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, value2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	move $t2, $t0
	move $t3, $t1
	
gcf:
	beq $t3, $zero, done
	
	div $t2, $t3
	mfhi $t4
	
	move $t2, $t3
	move $t3, $t4
	
	j gcf
	
done:
	move $t5, $t2
	
	li $v0, 4
	la $a0, rslt_gcf
	syscall
	move $a0,$t5
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	mul $t6, $t0, $t1
	div $t5, $t6
	mflo $t7
	
	li $v0, 4
	la $a0, rslt_lcm
	syscall
	move $a0, $t7
	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 10
	syscall