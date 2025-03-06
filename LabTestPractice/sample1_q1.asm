s1:	DC	"Enter an unsigned integer: "
	addi	x5,	x0,	s1
	ecall	x5,	x5,	4;	ouput info string
	ecall	x5,	x0,	5;	input integer
loop:	beq	x5,	x0,	output
	andi	x6,	x5,	1;	last bit
	addi	sp,	sp,	-8
	sd	x6,	0(sp);	push
	srli	x5,	x5,	1
	beq	x0,	x0,	loop
output:	beq	sp,	x0,	end
	ld	x5,	0(sp);	pop
	addi	sp,	sp,	8
	ecall	x1,	x5,	0;	output binary digit
	beq	x0,	x0,	output
end:	ebreak x0,		x0,	0
	