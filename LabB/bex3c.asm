dir:	DC	"John"
	DC	"11111"
	DC	"Nick"
	DC	"22222"
	DC	"Sara"
	DC	"11111"
	DC	"Nick"
	DC	"33333"
	DD	0
s1:	DC	"Enter a phone or a name"
s2:	DC	"to search for:"
	addi	x28,	x0,	s1
	addi	x29,	x0,	s2
loop1:	
	add	x5,	x0,	x0
	ecall	x0,	x28,	4
	ecall	x0,	x29,	4
	ecall	x6,	x0,	8
loop2:	
	ld	x7,	dir(x5)
	ld	x8,	dir+8(x5)
	beq	x7,	x0,	end
	beq	x6,	x7,	skip
	addi	x5,	x5,	8
	beq	x0,	x0,	loop2
skip:	
	ecall	x9,	x7,	3
	ecall	x0,	x8,	3
	addi	x5,	x5,	8
	beq	x0,	x0,	loop2
end:
	ebreak	x0,	x0,	0