src:	DD	121,	33,	-5,	242,	-45,	-12,	0
	add	x6,	x0,	x0
	ld	x5,	src(x6)

loop:	ld	x7,	src+8(x6)
	beq	x7,	x0,	end
	blt	x5,	x7,	switch
	ld	x5,	src+8(x6)

switch:	addi	x6,	x6,	8
	beq	x0,	x0,	loop

end:	ld	x8,	src(x0)
	sd	x5,	src(x0)

add	x6,	x0,	x0
loop2:	ld	x11,	src+8(x6)
	beq	x5,	x11,	end2
	addi	x6,	x6,	8
	beq	x0,	x0,	loop2
end2:	sd	x8,	src+8(x6)
	ebreak	x0,	x0,	0