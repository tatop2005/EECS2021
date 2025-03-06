module labK;
reg a, b;               // reg without size means 1-bit
wire z;
integer i, j;

not my_not(tmp, b);     // applies "not" on register b and puts into tmp
and my_and(z, a, tmp);  // applies "and" on register a and tmp and puts into z

initial
begin
    // EXHAUSTIVE TESTING (FOR LOOPS)
    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin
            a = i; b = j;
            #1 $display("a=%b b=%b z=%b", a, b, z); 
        end
    end
    $finish;
end

endmodule