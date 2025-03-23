module labL;
reg a, b, cin;
wire z, cout;
integer i, j, k;

yAdder1 my_adder1(z, cout, a, b, cin);

initial
begin
    // use exhaustive test
    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin
            for (k = 0; k < 2; k = k + 1)
            begin
                a = i; b = j; cin = k;
                #1; // wait for 1 time unit
                $display("a=%b b=%b cin=%b cout=%b z=%b", a, b, cin, cout, z);
            end
        end
    end
    $finish;
end
endmodule