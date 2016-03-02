# HW4
# Takes an input integer
# James Sturges 3/2/2016
# Proedure to take an input integer and return its hex value, as a character
# Includes main code for testing purposes


.text
	.globl __start


__start:                # begin assembly program
ori $a0, $zero, 9
jal intToHex
move $v0, $a0						#move hex char to print
ori $v0, $zero, 11
syscall									#print char


ori $v0, $zero, 10
syscall

intToHex:												#takes integer and reuturns its hex value
			ori $t0, $t0, 10					#load 11, for comparing input later
			slt $t1, $a0, $t0					#check if input is less than 'A'
			addi $a0, $a0, 48					#add 48 to make our base ASCII 0-9
			bne $t1, $zero, intToHex10#if less than 'A', go to end
			addi $a0, $a0, 	7					#otherwise, convert letters to the A-D range
intToHex10:
jr $ra




.data
