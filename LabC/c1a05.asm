STACK:	EQU	0x100000
	lui	sp,	STACK>>12

	// PUSHing the value of 1 in the stack 
	addi	x5,	x0,	1
	sd	x5,	0(sp)
	addi	sp,	sp,	-8

	// PUSHing the value of 2 in the stack
	addi	x5,	x0,	2
	sd	x5,	0(sp)
	addi	sp,	sp,	-8

	// POP the top element of the stack 
	addi	sp,	sp,	8
	ld	x5,	0(sp)