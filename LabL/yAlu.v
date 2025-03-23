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