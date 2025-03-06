s1:	DC	"Enter x: "
s2:	DC	"Result: "
c0:	DF	0.0
a:	DF	3.0
b:	DF	5.0
	fld	f0,	c0(x0)
	fld	f1,	a(x0)
	fld	f2,	b(x0)
loop:	addi	x5,	x0,	s1
	ecall	x1,	x5,	4;	output info, stay on this line
	ecall	f3,	x0,	6;	input x as float and put in f3
	flt.d	x1,	f3,	f1
	beq	x1,	x0,	cont
	fadd.d	f3,	f0,	f2
	beq	x0,	x0,	done
cont:	fle.d	x1,	f2,	f3
	beq	x1,	x0,	done
	fadd.d	f3,	f0,	f1
done:	addi	x5,	x0,	s2
	ecall	x1,	x5,	4;	output x, stay on this line
	ecall	x0,	f3,	1;	output result
	beq	x0,	x0,	loop	