.data
input: .asciiz "input an integer: "

.text
.main:
	li $v0, 4		# prompt input
	la $a0, input
	syscall
	
	li $v0, 5		# get input
	syscall
	move $a0, v0
	
	jal product