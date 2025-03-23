module labL;
reg [31:0] a, b, expect;
reg ctrl1;
wire [31:0] z;
wire cout;

yArith my_arith(z, cout, a, b, ctrl1);

initial
begin
    // use random test
    repeat (10)
    begin
        a = $random; b = $random; ctrl1 = $random % 2;
        if (ctrl1 === 0) expect = a + b;
        else expect = a + ~b + 1;
        #1; // wait for 1 time unit

        if (expect === z)
            $display("PASS: a=%d b=%d ctrl1=%d cout=%d z=%d expect=%d", a, b, ctrl1, cout, z, expect);
        else
            $display("FAIL: a=%d b=%d ctrl1=%d cout=%d z=%d expect=%d", a, b, ctrl1, cout, z, expect);
    end
    $finish;
end
endmodule