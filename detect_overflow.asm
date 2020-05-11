# Two operands are stored in register $s1 and $s2, the sum is stored in register $s3.
# If overflow occur, $t0 register is set to 1, and clear to 0 otherwise

.data
X: .word 1000000
Y: .word 1

.text

la $t7, X # load address of X to $t7
la $t8, Y # load address of Y to $t8
lw $s1, 0($t7) # load value of X to $s1
lw $s2, 0($t8) # load value of Y to $s2

start:
	li $t0, 0		# No Overflow is default status
	add $s3, $s1, $s2 	
	xor $t1, $s1, $s2	# Test if $s1 and $s2 have the same sign 
	
	bltz $t1, EXIT		# If not, exit
	slt $t2, $s3, $s1
	bltz $s1, NEGATIVE	# Test if $s1 and $s2 is negative?
	beq $t2, $zero, EXIT	# $s1 and $s2 are positive
	# if $s3 > $s1 then the result is not overflow
	b OVERFLOW

NEGATIVE:
	bne $t2, $zero, EXIT 	# $s1, $s2 are negative
	# if $s3 < $s1 then the result is not overflow

OVERFLOW:
	li $t0, 1	# the result is overflow
EXIT: