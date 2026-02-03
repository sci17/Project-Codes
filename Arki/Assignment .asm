.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
result_lcm: .asciiz "The LCM is: "
result_gcf: .asciiz "The GCF is: "
newline: .asciiz "\n"

.text
.globl main

main:
   
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read the first number
    li $v0, 5
    syscall
    move $s0, $v0 # Store the first number in $s0
    
    # Prompt for the second number
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read the second number
    li $v0, 5
    syscall
    move $s1, $v0 # Store the second number in $s1
    
    # Calculate LCM and GCF
    jal lcm
    jal gcf
    
    # Display results
    li $v0, 4
    la $a0, result_lcm
    syscall
    move $a0, $t0 # LCM is stored in $t0
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 4
    la $a0, result_gcf
    syscall
    move $a0, $t1 # GCF is stored in $t1
    li $v0, 1
    syscall
    
    

# Function to calculate LCM
lcm:
    move $t2, $s0 # Load first number to $t2
    move $t3, $s1 # Load second number to $t3
    
    # Find GCF first
    jal gcf
    
    # Compute LCM: (num1 * num2) / GCF
    mul $t0, $t2, $t3
    div $t0, $t0, $t1
    
    jr $ra

# Function to calculate GCF
gcf:
    move $t2, $s0 # Load first number to $t2
    move $t3, $s1 # Load second number to $t3
    
    loop:
        beq $t3, $zero, done # If second number is zero, GCF is found
        
        # Swap numbers if necessary
        move $t4, $t3
        div $t2, $t2, $t3
        move $t2, $t4
        move $t3, $t2
        
        j loop
    
    done:
        move $t1, $t2 # Store GCF in $t1
        jr $ra
		
	# Exit
    li $v0, 10
    syscall
