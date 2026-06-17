module layer1
(
    input signed [7:0] x1,
    input signed [7:0] x2,
    input signed [7:0] x3,
    input signed [7:0] w11,w12,w13,
    input signed [7:0] w21,w22,w23,
    input signed [7:0] w31,w32,w33,
    input signed [7:0] w41,w42,w43,
    output signed [15:0] y1,
    output signed [15:0] y2,
    output signed [15:0] y3,
    output signed [15:0] y4
);
neuron n1
(
    .x1(x1),	
    .x2(x2),
    .x3(x3),
    .w1(w11),
    .w2(w12),
    .w3(w13),
    .y(y1)
);

neuron n2
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w1(w21), 
    .w2(w22),
    .w3(w23),
    .y(y2)
);

neuron n3
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w1(w31),
    .w2(w32),
    .w3(w33),
    .y(y3)
);

neuron n4
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w1(w41),
    .w2(w42),
    .w3(w43),
    .y(y4)
);
endmodule