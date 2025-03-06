module labK;
reg [31:0] x; // a 32-bit register
reg one;    // a 1-bit wire
reg [1:0] two; // a 2-bit register
reg [2:0] three; // a 3-bit register
initial
begin
    one = &x;   // and reduction 
    two = x[1:0];   // part select
    three = {one, two}; // concatenation
    $display("%5d", $time, " %h", x);
    x = 32'hffff0000;
    $display("%5d", $time, " %h", x);
    x = x + 2;
    $display("%5d", $time, " %h", x);
    $finish;
end

endmodule