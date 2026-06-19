module network_rom_tb;
reg signed [15:0] x1,x2,x3;
wire signed [31:0] out1,out2;
network_rom uut
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .out1(out1),
    .out2(out2)
);
initial begin
    x1=0;
    x2=0;
    x3=0;
    #10;
    x1=16'd1;
    x2=16'd2;
    x3=16'd3;
    #20;
    $display("out1=%d",out1);
    $display("out2=%d",out2);
    #10;
    $finish;
end
endmodule