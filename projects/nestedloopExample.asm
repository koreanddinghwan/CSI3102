# recursive loop example

.data
	promptMessage:	.asciiz "Enter number to find its factorial: "
	resultMessage:	.ascii "\n The Factorial of number is "
	theNumber:	.word 0
	theAnswer:	.word 0
	
.text
	.globl main
	main: 
		# Read number from user
		li	$v0, 4 #syscall number 4(output)
		la	$a0, promptMessage #the text to print
		syscall #call syscall
		
		li	$v0, 5 # syscall number 5(output from user)
		syscall
		
		sw	$v0, theNumber
		
		#call factorial function using v0
		lw	$a0, theNumber
		jal	findFactorial
		sw	$v0, theAnswer #returned in v0
		
		# Display result
		li	$v0, 4
		la $a0, resultMessage
		syscall
		
		# Display number
		li $v0, 1
		la $a0, theAnswer
		syscall
		
		# Tell os that this is end of program
		li $v0, 10
		syscall
		

		
#-----------------------
# find factorial
.globl findFactorial
findFactorial:
			subu 	$sp, $sp, 8
			sw		$ra, ($sp)
			sw		$s0, 4($sp)	
			
			# Base case
			li $v0, 1
			beq $a0, 0, factorialDone
			
			
			# resursion step
			move $s0, $a0 # copy a0 value in s0
			sub  $a0, $a0, 1 #a0 = a0 - 1
			jal findFactorial
			
			mul $v0, $s0, $v0
			
			factorialDone:
			  			  lw $ra, ($sp)
						  lw $s0, 4($sp)	
						  addu $sp, $sp, 8
						  jr $ra
						   
						    
						   
						   


		
		
		
		