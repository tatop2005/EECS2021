s1:	DC	"What is your name?"
s2:	DC	"Hello "
s3:	DC	"!"
	addi	x28,	x0,	s1
	addi	x29,	x0,	s2
	addi	x30,	x0,	s3
	jal	x1,	input
	ecall	x2,	x29,	4
	ecall	x2,	x5,	4
	ecall	x2,	x30,	4
	ebreak	x0,	x0,	0

input:	ecall	x0,	x28,	4
	ecall	x5,	x0,	9
	jalr	x0,	0(x1)