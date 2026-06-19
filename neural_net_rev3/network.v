module network
(
    input signed [15:0] x1,
    input signed [15:0] x2,
    input signed [15:0] x3,
    input signed [15:0] w11,
    input signed [15:0] w12,
    input signed [15:0] w13,
    input signed [15:0] w21,
    input signed [15:0] w22,
    input signed [15:0] w23,
    input signed [15:0] w31,
    input signed [15:0] w32,
    input signed [15:0] w33,
    input signed [15:0] w41,
    input signed [15:0] w42,
    input signed [15:0] w43,
    input signed [15:0] lw11,
    input signed [15:0] lw12,
    input signed [15:0] lw13,
    input signed [15:0] lw14,
    input signed [15:0] lw21,
    input signed [15:0] lw22,
    input signed [15:0] lw23,
    input signed [15:0] lw24,
    output signed [31:0] out1,
    output signed [31:0] out2
);
wire signed [15:0] y1;
wire signed [15:0] y2;
wire signed [15:0] y3;
wire signed [15:0] y4;
layer1 L1
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w11(w11),
    .w12(w12),
    .w13(w13),
    .w21(w21),
    .w22(w22),
    .w23(w23),
    .w31(w31),
    .w32(w32),
    .w33(w33),
    .w41(w41),
    .w42(w42),
    .w43(w43),
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
    .w11(lw11),
    .w12(lw12),
    .w13(lw13),
    .w14(lw14),
    .w21(lw21),
    .w22(lw22),
    .w23(lw23),
    .w24(lw24),
    .out1(out1),
    .out2(out2)
);
endmodule