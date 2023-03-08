#in data, global var
.data
input: .asciiz "input an integer: "

.text
.main:
	#load address of input string
	la $a0, input
	
	#load immediate value 0 print string in $a0
	li $v0, 4
	syscall
	
	#load input integer to $v0
	#li $v0, 
	
	
	
	