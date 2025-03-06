s1:	DC	"Enter first number: "
s2:	DC	"Enter second number: "
s3:	DC	"GCD is "
	addi	x28,	x0,	s1
	addi	x29,	x0,	s2
	addi	x30,	x0,	s3

	ecall	x5,	x28,	4
	ecall	x5,	x0,	5
	ecall	x6,	x29,	4
	ecall	x6,	x0,	5

	addi	sp,	x0,	0
	jal	x1,	stack
	ebreak	x0,	x0,	0
stack:	sd	x1,	-24(sp)

fact:	bne	x0,	x6,	recu
	jalr	x0,	0(x1)

recu:	sd	x5,	-8(sp)
	sd	x6,	-16(sp)
	rem	x6,	x5,	x6
	ld	x5,	-16(sp)
	jal	x1,	fact
	ld	x1,	-24(sp)
	ld	x7,	-16(sp)
	ecall	x2,	x30,	4
	ecall	x2,	x7,	0
	jalr	x0,	0(x1)
	