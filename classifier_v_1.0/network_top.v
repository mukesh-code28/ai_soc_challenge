module network_top(

    input signed [15:0] feature1,
    input signed [15:0] feature2,
    input signed [15:0] feature3

);

wire signed [31:0] out1;
wire signed [31:0] out2;
wire signed [31:0] out3;

wire [1:0] class;

network_rom NN
(
    .x1(feature1),
    .x2(feature2),
    .x3(feature3),

    .out1(out1),
    .out2(out2),
    .out3(out3)
);

classifier CLS
(
    .out1(out1),
    .out2(out2),
    .out3(out3),

    .class(class)
);

shape_decoder DEC
(
    .class(class)
);

endmodule