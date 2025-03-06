s0:	DC	"Rectangle area calculation.\0"
s1:	DC	"Enter a:\0"
s2:	DC	"enter b:\0"
s3:	DC	"Rectangle area = "
	addi	x5,	x0,	s0
	ecall	x0,	x5,	4;	out info, go to next line
	addi	x5,	x0,	s1
	ecall	x1,	x5,	4;	prompt a, stay on this line
	ecall	x6,	x0,	5;	input a and put in x6
	addi	x5,	x0,	s2
	ecall	x1,	x5,	4;	prompt b, stay on this line
	ecall	x7,	x0,	5;	input b and put in x7
	mul	x6,	x6,	x7;	area = a*b 
	addi	x5,	x0,	s3
	ecall	x1,	x5,	4;	out area, stay on this line
	ecall	x1,	x6,	9;	out result