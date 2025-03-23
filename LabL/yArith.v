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