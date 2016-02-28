# HW3
# Takes an input string char by char until an x is typed
# Prints out the original string backwards – skipping any uppercase letters.  i.e. print out only lowercase letters
# James Sturges 2/8/2016

.text
	.globl __start

__start:                			# begin assembly program
	la 			$t0, inputstack 	# t0 stores the address of our string
	read: ori	 $v0, $zero, 12 	# read in letters
	syscall
	beq 		$v0, 0x78, print	# if the letter is x, we are done
	addi 		$t1, $t1, 1 		# count how many operations we are doing
	add 		$t2, $t0, $t1 		# increment stack
	sb 			$v0, 0($t2)
	j read							# reiterate

	print:
			lb 		$a0, 0($t2) 		# load letter from stack
			addi 	$t1, $t1, -1 		# decrement counter
			add 	$t2, $t0, $t1 		# decrement stack
			and		$t3, $zero, $zero	# reset $t3
			slt 	$t3, $a0, 0x61 		# if the char inputted is less than 'a', it is not a lowercase letter
			bne		$t3, $zero, isDone
			ori 	$v0, $zero, 11 		# print character
			syscall
			isDone:						# if our counter isn't at zero, iterate through again
			beq 	$t1, $zero, done 	
			j print						
	
	done: #exit program
			ori $v0, $zero, 10
			syscall

.data
inputstack: .space 100 #we want to allocate 100 bytes in data for our input
