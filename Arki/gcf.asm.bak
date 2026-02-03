.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
lcm_message: .asciiz "LCM: "
gcd_message: .asciiz "GCD: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt user for the first number
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read the first number
    li $v0, 5
    syscall
    move $t0, $v0   # store the first number in $t0

    # Prompt user for the second number
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read the second number
    li $v0, 5
    syscall
    move $t1, $v0   # store the second number in $t1

    # Call the function to find GCD
    move $a0, $t0   # pass first number to argument register $a0
    move $a1, $t1   # pass second number to argument register $a1
    jal gcd         # call the GCD function
    move $s0, $v0   # store GCD in $s0

    # Calculate LCM = (num1 * num2) / GCD
    mul $t2, $t0, $t1  # multiply the two numbers
    div $t2, $s0        # divide the result by GCD
    mflo $s1            # store the LCM in $s1

    # Print GCD
    li $v0, 4
    la $a0, gcd_message
    syscall
    move $a0, $s0
    li $v0, 1
    syscall

    # Print LCM
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 4
    la $a0, lcm_message
    syscall
    move $a0, $s1
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

gcd:
    # Arguments:
    # $a0: first number
    # $a1: second number

    # Base case
    beq $a1, $zero, return_a0

    # Recursive case
    move $t3, $a0   # save $a0 in $t3
    div $t3, $a1
    move $a0, $a1   # set $a0 to $a1
    move $a1, $t3   # set $a1 to $t3 (remainder)

    # Recursive call
    jal gcd

return_a0:
    move $v0, $a0   # return GCD in $v0
    jr $ra          # return

