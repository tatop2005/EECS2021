module labL;
reg [1:0] a, b;
reg c;
wire [1:0] z;
integer i, j, k;

yMux2 my_mux2(z, a, b, c);

initial
begin
    // use exhaustive test
    for (i = 0; i < 4; i = i + 1)
    begin
        for (j = 0; j < 4; j = j + 1)
        begin
            for (k = 0; k < 2; k = k + 1)
            begin
                a = i;
                b = j;
                c = k;
                #1; // wait for 1 time unit
                $display("a = %d b = %d c = %d z = %d", a, b, c, z);
            end
        end
    end
    $finish;
end
endmodule