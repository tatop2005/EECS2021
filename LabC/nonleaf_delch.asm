delch:	jal	x1,	delch1
	addi	a3,	a3,	-1
	bne	a3,	x0,	delch
	jalr	x0	,0(x1)



