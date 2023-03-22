.data 
	message:	.asciiz	"Insert an integer \n"
	message_1:	.asciiz " is bigger than 10 \n"
	message_2:	.asciiz " is smaller or equals 10 \n"
	
	.text
.globl main

main:
	# Display message
	li $v0, 4
	la $a0, message
	syscall
	
	# Read Integer
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	
	# Display integer
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	
	ble $t0,10,less
	bgt $t0,10,greater
	
	
less:
	li $v0, 4
	la $a0, message_2
	syscall
	j main
greater:
	li $v0, 4
	la $a0, message_1
	syscall
	j main