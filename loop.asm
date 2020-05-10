.data
A: .word 1, 2, 3, 4, 5
Z: .word # sum

.text
	addi $s1, $zero, -1 # index = -1
	la   $s2, A	    # $s2 = address of A[0]
	addi $s3, $zero, 1  # step = $s3 = 1
	addi $s4, $zero, 4  # length of array - 1 
	addi $s5, $zero, 0  # init sum = 0
	
	loop:
		add $s1, $s1, $s3 # i = i + step
		add $t1, $s1, $s1 # t1 = 2 * s1
		add $t1, $t1, $t1 # t1 = 4 * s1
		add $t1, $t1, $s2 # t1 store the address of A[i]
		lw $t0, 0($t1)    # load the value of A[i] in $t0
		add $s5, $s5, $t0 # sum = sum + A[i]
		
		bne $s1, $s4, loop # if index != 4, goto loop
	
	la $t7, Z
	sw $s4, 0($t7)