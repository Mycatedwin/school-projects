# HW3
# Takes an input string char by char until an x is typed
# Prints out the original string backwards – skipping any uppercase letters.  i.e. print out only lowercase letters
# James Sturges 2/8/2016

.text
	.globl __start

__start:                			# begin assembly program
	
	main:
	ori $v0, $zero, 5
	syscall
	move $a0, $v0
	jal fib
	
	move $a0, $v0
	ori $v0, $zero, 1
	syscall
	j done
	
	
	#t0=a, t1=b, t2=c,t3=i
	fib:
	and $t0, $zero, $zero 	# 'a' in our fib formula
	ori $t1, $zero, 1		# 'b' in our fib formula
	
	slt $t2, $a0, $zero		#if our number is less than zero, we save the original to 'b' and return it
	beq $t2, $zero, start 
	move $t1, $a0			# set 'b' to input
	j return
	start:
	ori $t3, $zero, 2		#for i=2
	iterate:
		slt $t4, $a0, $t3		#i <= n (same as n !< i)
		bne $t4, $zero, return	#if n is less than the argument, i !<=n, so go to return
		add $t2, $t0, $t1		# c = a + b
		or $t0, $t1, $zero		# a = b
		or $t1, $t2, $zero		# b = c
		addi $t3, $t3, 1		# i++
		j iterate				# loop again
	return:
	move $v0, $t1				#return b
	jr $ra						
	
	done: #exit program
			ori $v0, $zero, 10
			syscall

.data
