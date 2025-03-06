s0:	DC	"Greatest common divisor.\0"
s1:	DC	"Enter a:\0"
s2:	DC	"Enter b:\0"
s3:	DC	"gcd(a,b)="
	addi	x5,	x0,	s0
	ecall	x0,	x5,	4;	out info, go to next line
	addi	x5,	x0,	s1
	ecall	x1,	x5,	4;	prompt a, stay on this line
	ecall	x6,	x0,	5;	input a and put into x6
	addi	x5,	x0,	s2
	ecall	x1,	x5,	4;	prompt b, stay on this line
	ecall	x7,	x0,	5;	input b and put into x7
loop:	rem	x8,	x6,	x7
	add	x6,	x0,	x7
	add	x7,	x0,	x8
	bne	x8,	x0,	loop
	addi	x5,	x0,	s3
	ecall	x1,	x5,	4;	out gcd, stay on this line
	ecall	x0,	x6,	0;	out result