.data
prompt_op: .asciiz "Enter operation (+, -, *, /, f for fraction solving): "
prompt_num1: .asciiz "Enter the first number: "
prompt_num2: .asciiz "Enter the second number: "
result: .asciiz "Result: "
error_msg: .asciiz "Error: Division by zero\n"

.text
.globl main

main:
    # Prompt user for operation
    li $v0, 4
    la $a0, prompt_op
    syscall
    
    # Read operation
    li $v0, 12
    syscall
    move $s2, $v0  # Store operation in $s2
    
    # Prompt user for first number
    li $v0, 4
    la $a0, prompt_num1
    syscall
    
    # Read first number
    li $v0, 5
    syscall
    move $s0, $v0  # Store first number in $s0
    
    # Prompt user for second number
    li $v0, 4
    la $a0, prompt_num2
    syscall
    
    # Read second number
    li $v0, 5
    syscall
    move $s1, $v0  # Store second number in $s1
    
    # Perform selected operation
    beq $s2, 102, solve_fraction
    beq $s2, 43, add
    beq $s2, 45, subtract
    beq $s2, 42, multiply
    beq $s2, 47, divide
    j invalid_op
    
add:
    add $t0, $s0, $s1
    j print_result

subtract:
    sub $t0, $s0, $s1
    j print_result

multiply:
    mult $s0, $s1
    mflo $t0
    j print_result

divide:
    beq $s1, $zero, divide_by_zero
    div $s0, $s1
    mflo $t0
    j print_result

solve_fraction:
    # Check if denominator is zero
    beq $s1, $zero, divide_by_zero
    
    # Calculate result
    div $s0, $s1
    mflo $t0  # Quotient stored in $t0
    j print_result

divide_by_zero:
    # Print error message
    li $v0, 4
    la $a0, error_msg
    syscall
    
    # Exit program
    li $v0, 10
    syscall

print_result:
    # Print result
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Exit program
    li $v0, 10
    syscall

invalid_op:
    # Print error message
    li $v0, 4
    la $a0, invalid_msg
    syscall
    
    # Exit program
    li $v0, 10
    syscall

.invalid_msg:
    .asciiz "Error: Invalid operation\n"
