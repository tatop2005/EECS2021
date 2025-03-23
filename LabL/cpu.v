//////////  yAlu //////////
module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z, sub;
output ex;
wire [31:0] and_out, or_out, arith_out, slt;
wire cout;

wire [15:0] z16;
wire [7:0] z8;
wire [3:0] z4;
wire [1:0] z2;
wire z1;
or or16[15:0] (z16, z[15:0], z[31:16]);
or or8[7:0] (z8, z16[7:0], z16[15:8]);
or or4[3:0] (z4, z8[3:0], z8[7:4]);
or or2[1:0] (z2, z4[1:0], z4[3:2]);
or or1 (z1, z2[0], z2[1]);

assign slt[31:1]  = 0; // upper bits are always 0
xor my_xor(xor_out, a[31], b[31]);
yArith slt_arith(sub, cout, a, b, op[2]);
assign slt = (xor_out) ? a[31] : sub[31];

and my_and[31:0](and_out, a, b);
or my_or[31:0](or_out, a, b);
yArith my_arith(arith_out, cout, a, b, op[2]);
yMux4to1 #(32) my_4to1(z, and_out, or_out, arith_out, slt, op[1:0]);

endmodule

////////// yArith ///////////
module yArith(z, cout, a, b, ctrl1);
// add if ctrl1=0, subtract if ctrl1=1
output [31:0] z;
output cout;
input [31:0] a, b;
input ctrl1;
wire[31:0] notB, tmp;
wire cin;

assign notB = ~b;
yMux #(32) my_mux(tmp, b, notB, ctrl1);
assign cin = ctrl1;
yAdder my_adder(z, cout, a, tmp, cin);

endmodule

////////// yAdder //////////
module yAdder(z, cout, a, b, cin);
output [31:0] z;
output cout;
input [31:0] a, b;
input cin;
wire[31:0] in, out;

yAdder1 mine[31:0](z, out, a, b, in);

assign in[0] = cin;
assign in[31:1] = out[30:0];
assign cout = out[31];

endmodule

/////////// yAdder1 //////////
module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;

xor left_xor(tmp, a, b);
xor right_xor(z, cin, tmp);
and left_and(outL, a, b);
and right_and(outR, tmp, cin);
or my_or(cout, outR, outL);

endmodule

////////// yMux4to1 //////////
module yMux4to1(z, a0, a1, a2, a3, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] zLo, zHi;

yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);

endmodule

////////// yMux //////////
module yMux(z, a, b, c); // 2-to-1 mux
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a, b;
input c;

yMux1 mine[SIZE-1:0](z, a, b, c);
endmodule

////////// yMux1 //////////
module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodule