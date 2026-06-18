module weight_rom_tb;
reg [4:0] addr;
wire signed [15:0] data;
weight_rom uut
(
    .addr(addr),
    .data(data)
);
initial begin
    addr=0; #10;
    addr=1; #10;
    addr=2; #10;
    addr=3; #10;
    addr=4; #10;
    addr=5; #10;
    addr=6; #10;
    addr=7; #10;
    $finish;
end
endmodule