v1:	DD	1024,	2048,	4096,	8192
	ld	x6,	v1(x0)
	ld	x7,	v1+8(x0)
	add	x6,	x6,	x7
	ld	x7,	v1+16(x0)
	add	x6,	x6,	x7
	ld	x7,	v1+24(x0)
	add	x6,	x6,	x7
	srli	x5,	x6,	2
	sd	x5,	v2(x0)
v2:	DM	1