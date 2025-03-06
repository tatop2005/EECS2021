insch1:	lb	x5,	0(a2)
	sb	a3,	0(a2)
	addi	a3,	x5,	0
	addi	a2,	a2,	1
	bne	a3,	x0,	insch1
	sb	a3,	0(a2)
	jalr	x0,	0(x1)