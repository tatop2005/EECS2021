s1:	DC	"Enter a positive integer n: "
	addi	x5,	x0,	s1
	ecall	x5,	x5,	4;	output info string
	ecall	x5,	x0,	5;	input n
	add	x9,	x0,	x5;	for beq
	addi	x1,	x0,	1;	x1 = 1
	addi	x2,	x0,	2;	x2 = 2
	sub	x6,	x5,	x1;	x6 = n - 1
	sub	x7,	x5,	x2;	x7 = n - 2
	add	x8,	x6,	x7;	x8 = (n-1)+(n-2)
loop:	beq	x7,	x0,	end
	sub	x7,	x7,	x1
	add	x8,	x8,	x7
	beq	x0,	x0,	loop
end:	ecall	x1,	x8,	0;	print sum
	
	
