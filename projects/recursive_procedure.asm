# int fact(int n)
# {
# 	if (n < 1) return 1;
# 	else return (n * fact(n - 1));
# }

.text
.globl fact

fact:	addi	$sp, $sp, -8
	sw	$ra, 4($sp) #save return address in sp + 4
	sw	$a0, 0($sp) #save argument in sp + 0

	slti	$t0, $a0, 1 #test n < 1, if n < 1, t0 = 1
	beq	$t0, $zero, L1 #if n >= 1, go to L1

	addi	$v0, $zero, 1 #if n < 1, return 1
	addi	$sp, $sp, 8   #pop 2 items off stack
	#sp는 다시 원복됨. 2 아이템은 그냥 버려짐
	jr	$ra			  #return to caller

# n >= 1
L1:
	addi	$a0, $a0, -1	#next argument is n - 1
	jal	fact			# call fact(n - 1)

	lw	$a0, 0($sp)
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8

	mul	$v0, $a0, $v0
	jr	$ra


.main:
	li	$a0, 5
	jal	fact