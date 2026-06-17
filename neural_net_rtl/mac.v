module mac
(
    input signed [7:0] x1,
    input signed [7:0] x2,
    input signed [7:0] x3,

    input signed [7:0] w1,
    input signed [7:0] w2,
    input signed [7:0] w3,

    output signed [31:0] y
);

assign y=(x1*w1)+(x2*w2)+(x3*w3);

endmodule
