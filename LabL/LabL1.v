module labL;
reg a, b, c;
wire z;
integer i, j, k;

yMux1 my_mux1(z, a, b, c);

initial
begin
    // use exhaustive test
    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin
            for (k = 0; k < 2; k = k + 1)
            begin
                a = i;
                b = j;
                c = k;
                #1; // wait for 1 time unit
                $display("a = %b b = %b c = %b z = %b", a, b, c, z);
            end
        end
    end
    $finish;
end
endmodule

    