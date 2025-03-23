module labL;
reg [31:0] a, b, expect;
reg c;
wire [31:0] z;

yMux #(32) my_mux(z, a, b, c);

initial
begin
    // use random test
    repeat (10)
    begin
        a = $random;
        b = $random;
        c = $random % 2; // generate random 0/1 values
        expect = (c == 0) ? a : b;
        #1; // wait for 1 time unit
        if (expect === z)
            $display("PASS: a=%d b=%d c=%d z=%d expect=%d", a, b, c, z, expect);
        else
            $display("FAIL: a=%d b=%d c=%d z=%d expect=%d", a, b, c, z, expect);
    end
    $finish;
end
endmodule