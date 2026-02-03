    .data
prompt:     .asciiz "Enter an integer: "
prime_msg:  .asciiz "The number is prime."
composite_msg: .asciiz "The number is composite."
newline:    .asciiz "\n"

    .text
    .globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $s0, $v0    # Store the input in $s0

    # Check if input is less than 2
    ble $s0, 1, print_composite

    # Check if input is divisible by any number other than 1 and itself
    li $t0, 2         # Initialize divisor to 2
loop:
    bge $t0, $s0, print_prime  # If divisor >= input, it's prime
    div $s0, $t0      # Divide input by divisor
    mfhi $t1          # Remainder
    beq $t1, $zero, print_composite # If remainder = 0, it's composite
    addi $t0, $t0, 1  # Increment divisor
    j loop

print_prime:
    # Print prime message
    li $v0, 4
    la $a0, prime_msg
    syscall
    j end

print_composite:
    # Print composite message
    li $v0, 4
    la $a0, composite_msg
    syscall
    j end

end:
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
