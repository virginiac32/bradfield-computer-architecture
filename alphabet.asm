.data
pi: .float 3.14
my_string: .asciiz "ABCDEF..."

addi $a0 $zero 26
li $v0 9
syscall
add $t0 $v0 $zero #t0 = heap address

# to know you're at the end of the loop, check to see if you're at a null byte (a zero) because strings
# are all ended with a null byte

lb $t0 my_string


