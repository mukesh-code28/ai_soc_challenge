module neuron
(
    input signed [15:0] x1,x2,x3,
    input signed [15:0] w1,w2,w3,
    input signed [15:0] bias,
    output signed [15:0] y
);
wire signed [31:0] mac_out;
mac u1
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .bias(bias),
    .y(mac_out)
);
relu u2
(
    .data_in(mac_out),
    .data_out(y)
);
endmodule