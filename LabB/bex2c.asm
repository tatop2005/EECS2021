src1:	DD	1,	5,	-7,	23,	-5
src2:	DD	3,	-1,	4,	11,	-7
sum:	DM	5
	add	x6,	x0,	x0
	addi	x11,	x0,	40

loop:	bge	x6,	x11,	end
	
	ld	x5,	src1(x6)
	ld	x7,	src2(x6)
	add	x10,	x5,	x7
	sd	x10,	sum(x6)
	addi	x6,	x6,	8
	
	beq	x0,	x0,	loop

end:	ebreak	x0,	x0,	0