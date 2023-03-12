# int leaf_example(int g, int h, int i, int j)
# {
#	int f;
#	
#	f = (g + h) - (i + j);
#	return f;
# }


leaf_example: #need 3 register
	#when we need more register, need register spilling before call procedure
	addi $sp, $sp, -12 #stack make 3item
	sw $t1, 8($sp)     #store sp + 8 in t1
	sw $t0, 4($sp)	   #store sp + 4 in t0
	sw $s0, 0($sp)     #store sp in  s0

	add $t0, $a0, $a1 # g + h
	add $t1, $a2, $a3 # i + j
	sub $s0, $t0, $t1 # f = t0 - t1

	add $v0, $s0, $zero # return f
	
	lw $s0, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)	

	jr $ra