.data
prompt: .asciiz "Enter an operation (+, -, *, /) or 'q' to quit: "
num1_prompt: .asciiz "Enter the first number: "
num2_prompt: .asciiz "Enter the second number: "
result_prompt: .asciiz "Result: "
invalid_input: .asciiz "Invalid input! Try again.\n"
newline: .asciiz "\n"

    .text
    .globl main

main:
    li $t0, 1 # Flag to keep the program running
    
program_loop:
    # Prompting user to enter an operation
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Reading the operation
    li $v0, 12
    syscall
    move $t4, $v0 # Store operation
	li $v0, 4
	la $a0, newline
	syscall
    
    # Checking if user wants to quit
    li $t5, 113 # ASCII code for 'q'
    beq $t4, $t5, exit_program
    
    # Prompting user to enter the first number
    li $v0, 4
    la $a0, num1_prompt
    syscall
	
    # Reading the first number
    li $v0, 5
    syscall
    move $t6, $v0
	li $v0, 4
	la $a0, newline
	syscall
    
    
    # Prompting user to enter the second number
    li $v0, 4
    la $a0, num2_prompt
    syscall
	
    # Reading the second number
    li $v0, 5
    syscall
    move $t7, $v0
	li $v0, 4
	la $a0, newline
	syscall
    
    
    # Performing the operation
    beq $t4, 43, add_numbers # '+' operation
    beq $t4, 45, sub_numbers # '-' operation
    beq $t4, 42, mul_numbers # '*' operation
    beq $t4, 47, div_numbers # '/' operation
    # If the operation is not recognized
    li $v0, 4
    la $a0, invalid_input
    syscall
    j program_loop
    
add_numbers:
    add $t8, $t6, $t7 # Add
    # Printing the result
    li $v0, 4
    la $a0, result_prompt
    syscall
    move $a0, $t8
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    j program_loop
    
sub_numbers:
    sub $t8, $t6, $t7 # Subtract
    # Printing the result
    li $v0, 4
    la $a0, result_prompt
    syscall
    move $a0, $t8
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    j program_loop
    
mul_numbers:
    mul $t8, $t6, $t7 # Multiply
    # Printing the result
    li $v0, 4
    la $a0, result_prompt
    syscall
    move $a0, $t8
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    j program_loop
    
div_numbers:
    div $t8, $t6, $t7 # Divide
    # Printing the result
    li $v0, 4
    la $a0, result_prompt
    syscall
    move $a0, $t8
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    j program_loop
    
exit_program:
    # Exiting the program
    li $v0, 10
    syscall
