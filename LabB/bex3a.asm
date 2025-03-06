q1:	DC	"What is "
q2:	DC	"your nam"
q3:	DC	"e?\n"
r1:	DC	"Hello "
r2:	DC	"!"
	ld	x27,	q1(x0)
	ld	x28,	q2(x0)
	ld	x29,	q3(x0)
	ld	x30,	r1(x0)
	ld	x31,	r2(x0)
	ecall	x6,	x27,	3
	ecall	x7,	x28,	3
	ecall	x8,	x29,	8
	ecall	x6,	x30,	3
	ecall	x7,	x8,	3
	ecall	x9,	x31,	3	