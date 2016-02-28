# HW2
# Takes an input string and prints the consonant
# James Sturges 2/4/2016
#Read in and store a series of characters from the user (syscall 12) until they enter 'x'
#Store the entire string as entered
#Print out the original string backwards – skipping any uppercase letters.  i.e. print out only lowercase letters


.text
	.globl __start


__start:                # begin assembly program
la $s0, test						#load address for test
or $a0, $s0, $zero			#get test string ready for procedures
jal length
move $a0, $v0						#load length of string
ori $v0, $zero, 1
syscall									#print string length

or $a0, $s0, $zero			#get test string ready for charAt test
ori $a1, $zero, 5
jal charAt
move $a0, $v0
ori $v0, $zero, 11
syscall




ori $v0, $zero, 10
syscall

length:												#takes string address and finds length of it
			move 	$t0, $a0					#store argument in a temp register
			or		$v0, $zero, $zero	#initialize return value
len10:												#iterate through string
			lb		$t1, 0($t0)				#load the next letter
			beq		$t1, $zero, len20	#if 0 is read, end procedure
			addi	$v0, $v0, 1				#otherwise, add 1 to our counter
			addi	$t0, $t0, 1				#and increment address of next letter
			j			len10							#reiterate
len20:
			jr $ra									#end procedure


charAt:												#takes string address and index to find char there
			addi 	$sp, $sp, -4 			#make room to store ra
			sw		$ra, 0($sp)				#push ra to stack

			jal length							#find length of input string

			lw		$ra, 0($sp)				#pop ra from stack
			addi	$sp, $sp, 4				#return stack pointer to how it was before

			move 	$t0, $v0					#store returned length to t0
			or		$v0, $zero, $zero	#initialize return value
			blt		$t0, $a1, char10	#if length of string < input index, end procedure
			add 	$t0, $a0, $a1			#offlet string address by character index
			lb		$v0, 0($t0)				#load character at index asked for into v0
char10:
			jr $ra


indexOf:
			move 	$t0, $a0					#move input string to temp register
			ori		$v0, $zero, -1		#initialize index as -1
index10:
			lb		$t1, 0($t0)				#load next letter into register
			
			bne		$t1, $a0, index10




.data
test:
.asciiz "test"
