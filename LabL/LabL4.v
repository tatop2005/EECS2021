module labL;
reg [31:0] a0, a1, a2, a3, expect;
reg [1:0] c;
wire [31:0] z;

yMux4to1 #(32) my_4to1(z, a0, a1, a2, a2, c);

initial
begin
    // use random test
    repeat (10)
    begin
        a0 = $random;
        a1 = $random;
        a2 = $random;
        a3 = $random;
        c = $random % 4; // generate random 0/1/2/3 values
        expect = (c == 0) ? a0 : (c == 1) ? a1 : (c == 2) ? a2 : a3;
        #1; // wait for 1 time unit
        if (expect === z)
            $display("PASS: a0=%d a1=%d a2=%d a3=%d c=%d z=%d expect=%d", a0, a1, a2, a3, c, z, expect);
        else   
            $display("PASS: a0=%d a1=%d a2=%d a3=%d c=%d z=%d expect=%d", a0, a1, a2, a3, c, z, expect);
    end
    $finish;
end
endmodule