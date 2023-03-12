.data
x: .word 10
y: .word 5
z: .word 5
a: .half 1
b: .byte 5

.align 2
c: .byte 10

.text
lw $t2, x
lb $t3, y

add $t1, $t2, $t3
lui $t1, 100
