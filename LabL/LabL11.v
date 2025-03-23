module labL;
reg signed [31:0] a, b, expect;
reg [2:0] op;
wire ex;
wire signed [31:0] z;
wire signed z1;
reg ok, flag, zero, tmp;

yAlu mine(z, ex, a, b, op);

initial
begin
    repeat (10)
    begin
        a = $random; b = $random; op = $random % 3; 
        tmp = $random % 2;
        if (tmp == 0) b = a;

        flag = $value$plusargs("op=%d", op);
        if (op === 3'b000) expect = a & b;
        if (op === 3'b001) expect = a | b;
        if (op === 3'b010) expect = a + b;
        if (op === 3'b110) expect = a - b;
        if (op === 3'b111) expect = (a < b) ? 1 : 0;

        zero = (expect == 0) ? 1 : 0;
        if (zero === 1)
            $display("PASS: z=%d zero=%d op=%d", z, zero, op);

        #1; // wait for 1 time unit
        if (expect === z)
            $display("PASS: a=%d b=%d op=%d ex=%d z=%d expect=%d", a, b, op, ex, z, expect);
        else   
            $display("FAIL: a=%d b=%d op=%d ex=%d z=%d expect=%d", a, b, op, ex, z, expect);
    end
    $finish;
end
endmodule