#Laboratory Exercise 5, Home Assignment 5
.data
	buffer: .space 50
	
.text
	la $s0, buffer 	# ??a ch? l?u tr?
	li $s1, 0  		# index 
	
	li $s2, 20 		# ?? d�i t?i ?a
	li $s3, 10 		# ASCII of enter '\n'
	
	li $s4, 0  		# i = 0

start_read_char:
	li $v0, 12
	syscall
	
	add $s1, $s0, $s4  # index[i]
	addi $s4, $s4, 1   # i++
	
	beq $v0, $s3, end_of_char # k?t th�c n?u enter
	beq $s4, $s2, end_of_char # K?t th�c n?u length > 20
	
	sb $v0, 0($s1)
	j start_read_char

end_of_char:
print_resever:
	lb $a0, 0($s1)
	li $v0, 11
	syscall
	beq $s1, $s0, end
	addi $s1, $s1, -1
	j print_resever

end:
