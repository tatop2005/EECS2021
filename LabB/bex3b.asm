c1:	DC	"Integer:"
c2:	DC	"Address:"
s1:	DC	"Enter an integer value"
s2:	DC	"Enter memory address (multiple of 8)"
	ld	x28,	c1(x0)
	ld	x29,	c2(x0)
	addi	x30,	x0,	s1
	addi	x31,	x0,	s2
loop:	ecall	x0,	x30,	4
	ecall	x6,	x28,	5
	ecall	x0,	x31,	4
	ecall	x7,	x29,	5
	sd	x6,	0(x7)
	
	beq	x0,	x0,	loop