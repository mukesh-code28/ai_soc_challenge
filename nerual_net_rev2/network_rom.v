module network_rom
(
    input signed [15:0] x1,
    input signed [15:0] x2,
    input signed [15:0] x3,
    output signed [31:0] out1,
    output signed [31:0] out2
);
wire signed [15:0] mem [0:19];
genvar i;
generate
    for(i=0;i<20;i=i+1)
    begin: ROMS
        weight_rom rom
        (
            .addr(i),
            .data(mem[i])
        );
    end
endgenerate
wire signed [15:0] y1;
wire signed [15:0] y2;
wire signed [15:0] y3;
wire signed [15:0] y4;
layer1 L1
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w11(mem[0]),
    .w12(mem[1]),
    .w13(mem[2]),
    .w21(mem[3]),
    .w22(mem[4]),
    .w23(mem[5]),
    .w31(mem[6]),
    .w32(mem[7]),
    .w33(mem[8]),
    .w41(mem[9]),
    .w42(mem[10]),
    .w43(mem[11]),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4)
);
layer2 L2
(
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .w11(mem[12]),
    .w12(mem[13]),
    .w13(mem[14]),
    .w14(mem[15]),
    .w21(mem[16]),
    .w22(mem[17]),
    .w23(mem[18]),
    .w24(mem[19]),
    .out1(out1),
    .out2(out2)
);

endmodule