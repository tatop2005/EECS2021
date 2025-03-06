c0:	DF	0.0;	constant 0.0
c1:	DF	1.0;	constant 1.0
c2:	DF	2.0;	constant 2.0
eps:	DF	1.0e-14;	precision
a:	DF	10.0;	change to test sqrt(a)
fld	f0,	c0(x0)
fld	f1,	c1(x0)
fld	f2,	c2(x0)
fld	f8,	eps(x0)
fld	f9,	a(x0);	set the interval

fld	f3,	c1(x0);	lo
fld	f4,	a(x0);	hi
flt.d	x1,	f4,	f3
beq	x1,	x0,	loop
fld	f3,	a(x0);	lo
fld	f4,	c1(x0);	hi

loop:	fadd.d	f5,	f3,	f4
	fdiv.d	f5,	f5,	f2;	mid = (f3+f4)/2.0
	fmul.d	f6,	f5,	f5;	mid * mid
	flt.d	x1,	f6,	f9;	mid * mid < a ???
	beq	x1,	x0,	lo1
	fadd.d	f3,	f0,	f5;	update hi
	jal	x0,	lo2
lo1:	fadd.d	f4,	f0,	f5;	update lo
lo2:	fsub.d	f7,	f4,	f3;	f4 - f3
	fle.d	x1,	f7,	f8;	(f4-f3) <= eps ???
	beq	x1,	x0,	loop
