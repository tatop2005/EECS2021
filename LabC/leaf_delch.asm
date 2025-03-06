delch:	sd	x1,	0(sp);		push
	sd	s0,	-8(sp);		push
	sd	s1,	-16(sp);		push
	addi	sp,	sp,	-24
	addi	s0,	a2,	0
	addi	s1,	a3,	0
	bge	x0,	s1,	end2
loop2:	jal	x1,	delch1;		j delch1
	addi	s1,	s1,	-1
	bne	s1,	x0,	loop2
end2:	addi	sp,	sp,	24;	pop
	ld	x1,	0(sp);		pop
	ld	s0,	-8(sp);		pop
	ld	s1,	-16(sp);		pop
	jalr	x0,	0(x1);		return