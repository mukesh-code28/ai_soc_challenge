module layer1_tb;
reg signed [7:0] x1,x2,x3;
reg signed [7:0] w11,w12,w13;
reg signed [7:0] w21,w22,w23;
reg signed [7:0] w31,w32,w33;
reg signed [7:0] w41,w42,w43;
wire signed [15:0] y1,y2,y3,y4;
layer1 uut
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
initial begin
    x1=8'd1;
    x2=8'd2;
    x3=8'd3;

    w11=8'd1;
    w12=8'd2;
    w13=8'd3;

    w21=8'd2;
    w22=8'd1;
    w23=8'd1;

    w31=8'd1;
    w32=8'd1;
    w33=8'd1;

    w41=8'd3;
    w42=8'd2;
    w43=8'd1;

    #10;

    $finish;

end

endmodule