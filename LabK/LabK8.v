module labK;                // TWO-TO-ONE MULTIPLEXER CIRCUIT
reg a, b, c, expect;   
wire z, not_c, upper_and_output, lower_and_output, upper_or_input, lower_and_input;
integer i, j, k;

not my_not(not_output, c);
assign lower_and_input = not_output;

and my_and1(upper_and_output, a, lower_and_input);
assign upper_or_input = upper_and_output;

and my_and2(lower_and_output, c, b);
assign lower_or_input = lower_and_output;

or my_or(or_output, upper_or_input, lower_or_input);
assign z = or_output;

initial
begin
    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin
            for (k = 0; k < 2; k = k + 1)
            begin
                a = i; b = j; c = k;
                expect = (a & ~c) | (c & b);
                #1; // wait for 1 time unit
                if (expect === z)
                    $display("PASS: a=%b b=%b c=%b expect=%b z=%b", a, b, c, expect, z);
                else   
                    $display("FAIL: a=%b b=%b c=%b expect=%b z=%b", a, b, c, expect, z);
            end
        end
    end
    $finish;
end

endmodule