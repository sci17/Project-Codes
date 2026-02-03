.data
prompt: .asciiz "Enter your number: "
retry: .asciiz "Try again? [1]-Yes [2]-No"
input_prime: .asciiz "The number is prime."
input_composite: .asciiz "The number is composite."


.text
.globl main

main:
    
	li $v0, 4
    la $a0, prompt
    syscall

   
    li $v0, 5
    syscall
    move $s0, $v0 
	
	li $t0, 2  
	beq $s0, 1, try
	beq $s0, 0, try
	

	
try:
	move $t2, $s0
	
	li $v0, 4
	la $a0, retry
	syscall
	
	li $v0, 5
	syscall
	
	jr $ra 
	

loop:
    bge $t0, $s0, print_prime  
    div $s0, $t0      
    mfhi $t1         
    beq $t1, $zero, print_composite 
    addi $t0, $t0, 1  
    j loop

print_prime:
    
    li $v0, 4
    la $a0, input_prime
    syscall
    j exit

print_composite:
   
    li $v0, 4
    la $a0, input_composite
    syscall
    j exit

exit:
 
    li $v0, 10
    syscall
