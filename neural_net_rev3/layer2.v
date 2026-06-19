module layer2
(
    input signed [15:0] y1,
    input signed [15:0] y2,
    input signed [15:0] y3,
    input signed [15:0] y4,
    input signed [15:0] w11,
    input signed [15:0] w12,
    input signed [15:0] w13,
    input signed [15:0] w14,
    input signed [15:0] w21,
    input signed [15:0] w22,
    input signed [15:0] w23,
    input signed [15:0] w24,
    input signed [15:0] b1,
    input signed [15:0] b2,
    output signed [31:0] out1,
    output signed [31:0] out2
);
neuron4 n1
(
    .x1(y1),
    .x2(y2),
    .x3(y3),
    .x4(y4),
    .w1(w11),
    .w2(w12),
    .w3(w13),
    .w4(w14),
    .bias(b1),
    .y(out1)
);

neuron4 n2
(
    .x1(y1),
    .x2(y2),
    .x3(y3),
    .x4(y4),
    .w1(w21),
    .w2(w22),
    .w3(w23),
    .w4(w24),
    .bias(b2),
    .y(out2)
);

endmodule