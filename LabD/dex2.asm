v1:	DF	1.21,	5.85,	-7.3,	23.1,	-5.55;	sample vector 1
v2:	DF	3.14,	-2.1,	44.2,	11.0,	-7.77;	sample vector 2
dp:	DM	1
	add	x6,	x0,	x0
	addi	x11,	x0,	40
loop:	bge	x6,	x11,	end
	fld	f1,	v1(x6)
	fld	f2,	v2(x6)
	fmul.d	f3,	f1,	f2
	fadd.d	f4,	f4,	f3
	addi	x6,	x6,	8
	beq	x0,	x0,	loop
end:	fsd	f4,	dp(x0)