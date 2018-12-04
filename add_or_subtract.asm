li $a0, 2
li $a1, 4
li $t0, 3
beq $a1 $t0 add
sub $t1 $a1 $a0
j end

add: add $t1 $a0 $a1
end: 