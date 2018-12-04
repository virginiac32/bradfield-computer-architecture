li $v0 5
syscall
add $a0, $v0, $zero #$a0 is N
addi $a0 $a0 1
li $t0 1 #$t0 = counter
li $t1 0 #$t1 = sum

loop:
beq $t1 $a0 print
add $t1 $t0 $t1
addi $t0 $t0 1
j loop

print: 
li $v0 1
add $a0, $t1, $zero
syscall