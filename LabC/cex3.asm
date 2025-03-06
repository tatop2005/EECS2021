str1:	DC	"sampled text"
s1:	DC	"Enter text: "
s2:	DC	"Enter a lower-cased letter: "
s3:	DC	"Insert(0) "
s4:	DC	" or delete a character(1): "
	addi	x5,	x0,	s1
	addi	x6,	x0,	s2
	addi	x7,	x0,	s3
	addi	x8,	x0,	s4
	ecall	x9,	x5,	4
	ecall	x9,	x0,	9
	ecall	x10,	x6,	4
	ecall	x10,	x0,	9
	ecall	x11,	x7,	4
	ecall	x11,	x10,	4
	ecall	x11,	x8,	4
	ecall	x11,	x0,	5
	
	beq	x11,	x0,	insch
	jal	x1,	del
	ebreak	x0,	x0,	0

del:	addi	a3,	x0,	str1+6;	chaddr
	addi	a4,	x0,	1;	#ch
	jal	x2,	delch
	addi	x6,	x0,	str1;	output
	ecall	x0,	x6,	4
	ebreak	x0,	x0,	0;	finish

delch:	jal	x1,	delch1
	addi	a4,	a4,	-1
	bne	a4,	x0,	delch
	jalr	x0,	0(x2);		return

delch1:	lb	x5,	0(a4)
loop1:	beq	x5,	x0,	end1
	lb	x5,	1(a3)
	sb	x5,	0(a3)
	addi	a3,	a3,	1
	jal	x0,	loop1
end1:	jalr	x0,	0(x1)

str2:	DC	"r"
addi	a5,	x0,	str1+5;	chaddr
addi	a6,	x0,	1;	#ch
addi	x7,	x0,	str2

insch:	addi 	s0, 	a5, 	0
	addi 	s1, 	a6, 	0
loop3: 	lb 	a6,	0(s1)
	beq 	a6, 	x0, 	end3
	jal 	x1, 	insch1
	addi 	s0, 	s0, 	1
	addi 	a5, 	s0, 	0
	addi 	s1, 	s1, 	1
	beq 	x0, 	x0, 	loop3
end3: 	jalr 	x0, 	0(x1);		return

insch1:	lb	x5,	0(a5)
	sb	a5,	0(a5)
	addi	a6,	x5,	0
	addi	a5,	a5,	1
	bne	a6,	x0,	insch1
	sb	a6,	0(a5)
	jalr	x0,	0(x1)