s1:	DC	"n! Enter n: "
s2:	DC	"! = "
	addi	x5,	x0,	s1
	ecall	x1,	x5,	4;	output info, stay on this line
	ecall	x5,	x0,	5;	prompt n and put into x5
	add	x7,	x0,	x5;	save n to use later
	add	x4,	x0,	x5;	first number set as n in x7
	addi	x1,	x0,	1
	sub	x3,	x4,	x1;	second number set as n-1 in x3
loop:	beq	x5,	x1,	end;	x5 used as counter and only multiplies till 1
	mul	x4,	x4,	x3;	multiply n * n-1 and to store in x4
	sub	x3,	x3,	x1;	n-1 turns into n-2
	sub	x5,	x5,	x1;	counter decrements by 1 each loop
	beq	x0,	x0,	loop
end:	ecall	x1,	x7,	0;	print n
	addi	x6,	x0,	s2
	ecall	x1,	x6,	4;	print "n! = "
	ecall	x1,	x4,	0;	print factorial