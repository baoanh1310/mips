# Find the element with the largest absolute value in a list of integers.

.data
A: .word 1, -10, 20, -30, 5

.text

	addi $s0, $zero, 0	# index = 0
	la $s1, A		# load address of A[0]
	addi $s2, $zero, 1	# step = 1
	addi $s3, $zero, 5	# length of array
	
	lw $s4, 0($s1)		# assume result is the first element of A
	abs $s4, $s4		# s4 = abs(s4)
	
	loop:
		add $s0, $s0, $s2	# index = index + step
		add $t1, $s0, $s0	# t1 = 2 * s0
		add $t1, $t1, $t1	# t1 = 4 * s0
		add $t1, $t1, $s1	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		
		abs $t2, $t0		# t3 = abs(t0)
		slt $t3, $s4, $t2	# current max < abs(A[i])
		beq $t3, $zero, endif
		add $s4, $zero, $t2	# update result 
		
	endif:
		bne $s0, $s3, loop
		