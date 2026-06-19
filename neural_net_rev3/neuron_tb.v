module neuron_tb;
reg signed [7:0] x1,x2,x3;
reg signed [7:0] w1,w2,w3;
wire signed [15:0] y;
neuron uut
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .y(y)
);
initial begin
    x1=8'd2;
    x2=8'd4;
    x3=8'd1;
    w1=8'd3;
    w2=8'd5;
    w3=8'd6;

    #10;

    x1=-8'd2;
    x2=8'd1;
    x3=8'd1;
    w1=8'd3;
    w2=8'd2;
    w3=-8'd1;

    #10;

    $finish;
end
endmodule