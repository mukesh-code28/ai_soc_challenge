module neuron4
(
    input signed [15:0] x1,
    input signed [15:0] x2,
    input signed [15:0] x3,
    input signed [15:0] x4,
    input signed [15:0] w1,
    input signed [15:0] w2,
    input signed [15:0] w3,
    input signed [15:0] w4,
    output signed [31:0] y
);
wire signed [31:0] mac_out;
assign mac_out=(x1*w1)+(x2*w2)+(x3*w3)+(x4*w4);
assign y=mac_out;

endmodule