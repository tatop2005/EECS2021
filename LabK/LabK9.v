module labK;                // FULL ADDER CIRCUIT
reg a, b, cin;
reg [1:0] expect;
wire cout, z, xor1_output, xor1_wire, and1_output, and1_wire, xor2_output, and2_output, and2_wire, or_output;
integer i, j, k;

xor my_xor1(xor1_output, b, a);
assign xor1_wire = xor1_output;

and my_and1(and1_output, b, a);
assign and1_wire = and1_output;

xor my_xor2(xor2_output, cin, xor1_wire);
assign z = xor2_output;

and my_and2(and2_output, cin, xor1_wire);
assign and2_wire = and2_output;

or my_or(or_output, and1_wire, and2_wire);
assign cout = or_output;

initial
begin
    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin  
            for (k = 0; k < 2; k = k + 1)
            begin
                a = i; b = j; cin = k;
                expect = a + b + cin;
                #1; // wait for 1 time unit
                if (expect[0] === z && expect[1] === cout)
                    $display("PASS: a=%b b=%b cin=%b cout=%b z=%b expect=%b", a, b, cin, cout, z, expect);
                else
                    $display("FAIL: a=%b b=%b cin=%b cout=%b z=%b expect=%b", a, b, cin, cout, z, expect);
            end
        end
    end
    $finish;
end

endmodule