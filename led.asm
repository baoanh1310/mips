.eqv SEVENSEG_RIGHT 0xFFFF0010	# Dia chi cua den led 7 doan phai.

.eqv SEVENSEG_LEFT 0xFFFF0011  # Dia chi cua den led 7 doan trai

.text

# 0x11,0x21,0x41,0x81,0x12,0x22,0x42,0x82,0x14,0x24,0x44,0x84,0x18,0x28,0x48,0x88

main:

	li	$a0, 0x7F	# set value for segments
	jal	SHOW_7SEG_LEFT	# show
	li	$a0, 0x5B	# set value for segments
	jal	SHOW_7SEG_RIGHT	# show

exit:	li	$v0, 10
	syscall

endmain:

SHOW_7SEG_LEFT:	li	$t0, SEVENSEG_LEFT	# assign port's address
		sb	$a0, 0($t0)		# assign new value
		jr	$ra
		
SHOW_7SEG_RIGHT: li	$t0, SEVENSEG_RIGHT	# assign port's address
		 sb	$a0, 0($t0)		# assign new value
		 jr	$ra  