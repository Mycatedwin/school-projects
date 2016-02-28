# HW2
# Takes an input string and prints the consonant
# James Sturges 2/4/2016

.text
	.globl __start

__start:                # begin assembly program
	la $s0, con			#load address of consonants
	la $s1, string1 #load address of string

	ori $v0, $zero, 11 #load the print character syscall

	nextletter:or $t1, $s0, $zero #reset place in cons array
		lb $a0, ($s1) #load next letter
		beq $a0, $zero, done #if current letter is zero, end program
			nextcons: lb $t0, ($t1) #go to next letter in cons
			bne $t0, $zero, compare #next letter if at end of cons
				addi $s1, $s1, 1
				j nextletter
			compare: beq $a0, $t0, print #compare if the letters are equal
				addi $t1, $t1, 1
				j nextcons
			print:syscall
				addi $s1, $s1, 1	#load the next letter in string
				j nextletter #go to next letter
	done: #exit program
	ori $v0, $zero, 10
	syscall

.data
con:
	.asciiz "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz"
string1:
	.asciiz "now is a time for all good men"
string2:
	.asciiz  "THIS should not print!!!"
