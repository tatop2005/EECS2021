module labL;
reg [31:0] a, b, expect;
reg cin, ok;
wire [31:0] z;
wire cout;

yAdder my_adder(z, cout, a, b, cin);

initial
begin
    // use random test
    repeat (10)
    begin
        a = $random; b = $random; cin = 0;
        expect = a + b + cin;
        ok = 0;
        #1; // wait for 1 time unit
        if (expect === z) ok = 1;
        if (ok === 1)
            $display("PASS: ok=%d a=%d b=%d cin=%d cout=%d z=%d expect=%d", ok, a, b, cin, cout, z, expect);
        else
            $display("FAIL: ok=%d a=%d b=%d cin=%d cout=%d z=%d expect=%d", ok, a, b, cin, cout, z, expect);
    end
    $finish;
end
endmodule