// WAP to add 2 32-bit unsigned nos
.data
a: .word 0x80003281 0x81234528
.text
la x18, a
lw x19, 0x00(x18)
lw x20, 0x04(x18)
add x21, x19, x20
bltu x21, x19, carry
beq x0, x0, nocarry
carry: addi x22, x0, 0x01
nocarry: sw x22, 0x08(x18)
sw x21, 0x0C(x18)
