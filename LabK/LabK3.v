module labK;
reg a, b;               // reg without size means 1-bit
wire notOutput, lowerInput, tmp, z;

not my_not(notOutput, b);     // applies "not" on register b and puts into notOutput
and my_and(z, a, lowerInput);  // applies "and" on register a and lowerInput and puts into z
assign lowerInput = notOutput;

initial
begin
    a = 1; b = 1; 
    #1; // wait for 1 time unit
    $display("a=%b b=%b z=%b", a, b, z);
    $finish;
end

endmodule