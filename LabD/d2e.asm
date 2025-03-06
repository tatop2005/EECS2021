d:	DF	3.0
	fld	f1,	d(x0)
	fadd.d	f2,	f1,	f1;	f2 = 3.0 + 3.0 = 6.0
	fmul.d	f3,	f1,	f1;	f3 = 3.0 * 3.0 = 9.0
	fdiv.d	f4,	f2,	f3;	f4 = f2 / f3 = 6.0 / 9.0 = 0.(6)
	fsd	f4,	m(x9)
m:	DM	1