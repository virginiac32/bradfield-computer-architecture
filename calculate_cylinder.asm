li $a0, 2 #height
li $a1, 2 #radius
li $t0, 3 #pi
mult $a1, $a1
mflo $t1
mult $t0, $t1
mflo $t1 #store pi*r^2 into $t1
mult $t1, $a0
mflo $t1
li $v0 1
add $a0, $t1, $zero
syscall