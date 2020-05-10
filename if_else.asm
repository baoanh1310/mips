# if (i <= j) 
#	x = x + 1;
#	z = 1;
# else
#	y = y - 1;
# 	z = 2 * z;

.data

X: .word 10
Y: .word 20
Z: .word 30

.text
	
	# init i, j
	addi $t1, $zero, 1	# i = 1
	addi $t2, $zero, 2 	# j = 2
	
	# load X, Y, Z to registers
	la $t5, X	# load address of X
	la $t6, Y	# load address of Y
	la $t7, Z 	# load address of Z
	lw $t1, 0($t5) 	# $t1 = value of X
	lw $t2, 0($t6) 	# $t2 = value of Y
	lw $t3, 0($t7)  # $t3 = value of Z
	
	start:
		slt $t0, $t2, $t1	# j < i
		bne $t0, $zero, else	# branch to else if j < i
		addi $t1, $t1, 1	# 	then part: x = x + 1
		addi $t3, $zero, 1	# 	z = 1
		j endif 		# skip "else" part
		
	else:
		addi $t2, $t2, -1	# begin else part: y = y - 1
		add $t3, $t3, $t3	# z = 2 * z
	
	endif: