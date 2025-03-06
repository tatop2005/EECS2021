s1:	DC	"Find all divisors."
i:	DC	"Enter a positive integer i: "
d:	DC	"Divisors:"
	addi	x5,	x0,	s1
	ecall	x0,	x5,	4;	output string s1, go to next line
	addi	x5,	x0,	i
	ecall	x1,	x5,	4;	output string i and stay on this line
	ecall	x5,	x0,	5;	input i and put into x5
	addi	x6,	x0,	1;	Let x6 be possible divisors

	addi	x4,	x0,	d
	ecall	x0,	x4,	4;	output "Divisors:"
loop:	blt	x5,	x6,	end
	rem	x7,	x5,	x6;	find remainder
	beq	x7,	x0,	print;	if (remainder == 0) then print x6 as a divisor
	addi	x6,	x6,	1	
	beq	x0,	x0,	loop	

print:	ecall	x0,	x6,	0;	output divisor, then go to next line
	addi	x6,	x6,	1
	beq	x0,	x0,	loop

end:	ebreak	x0,	x0,	0