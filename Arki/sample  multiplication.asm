.data

newline: .asciiz "\n"
start: .asciiz "*"
value: .asciiz "Enter a number:"
space: .asciiz "		"

.text
.globl main

main:

	li $v0, 4
	la $a0, value
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, start
	syscall

	li $t1, 1
	li $t2, 1

j print_loop

print_loop:

li $v0, 4
la $a0, space
syscall

li $v0, 1
syscall
move $a0,$t1

addi $t1, $t1, 1
bgt $t1, $t0, reset

j print_loop

reset:

li $t1, 1

li $v0, 4
la $a0, newline
syscall

j count 

count:

li $v0,1
syscall
move $a0, $t1

j mult1

mult1:

mul $t3, $t1, $t2

li $v0, 4
la $a0, space
syscall

li $v0, 1
syscall
move $a0, $t3 

addi $t2, $t2, 1
bgt $t2, $t0, mult2

j mult2

mult2:
li $t1, 1

addi $t1, $t1, 1

li $v0, 4
la $a0, newline
syscall

bgt $t1, $t0, exit 

j print_loop

exit:
li $v0 10
syscall




