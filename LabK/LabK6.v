module labK;
reg a, b, c;   
wire z, not_c, upper_and_output, lower_and_output, upper_or_input, lower_and_input;

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
    a = 1; b = 0; c = 0;
    #1; // wait for one time unit
    $display("a=%b b=%b c=%b z=%b", a, b, c, z);
    $finish;
end

endmodule
