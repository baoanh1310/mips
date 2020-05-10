.data
test: .word 1

.text

	la $s0, test	# load the address of test variable
	lw $s1, 0($s0) 	# load the value of test to register $s1
	
	# init a, b
	addi $s2, $zero, 10	# a = 10
	addi $s3, $zero, 20	# b = 20
	
	# load value for test case
	li $t0, 0
	li $t1, 1
	li $t2, 2
	
	beq $s1, $t0, case_0
	beq $s1, $t1, case_1
	beq $s1, $t2, case_2
	b   default
	
	case_0:
		addi $s2, $s2, 1	# a = a + 1
		b continue 
	case_1:
		addi $s2, $s2, -1	# a = a - 1
		b continue
	case_2:
		add $s3, $s3, $s3 	# b = 2 * b
		b continue
	default:
	continue:
		
		