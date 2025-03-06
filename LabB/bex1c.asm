a:	DD	0xAAAABBBBCCCCDDDD
b:	DD	0x4444333322221111
d:	DM	8
	ld	x5,	a(x0)
	ld	x6,	b(x0)
add	x7,	x5,	x6
sd	x7,	d(x0)
sub	x7,	x5,	x6
sd	x7,	d+8(x0)
sub	x7,	x6,	x5
sd	x7,	d+16(x0)
and	x7,	x5,	x6
sd	x7,	d+24(x0)
or	x7,	x5,	x6
sd	x7,	d+32(x0)
xor	x7,	x5,	x6
sd	x7,	d+40(x0)
xori	x7,	x5,	-1
sd	x7,	d+48(x0)
xori	x7,	x6,	-1
sd	x7,	d+56(x0)