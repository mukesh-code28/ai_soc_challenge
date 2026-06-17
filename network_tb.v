module network_tb;

reg signed [15:0] x1,x2,x3;
reg signed [15:0] w11,w12,w13;
reg signed [15:0] w21,w22,w23;
reg signed [15:0] w31,w32,w33;
reg signed [15:0] w41,w42,w43;
reg signed [15:0] lw11,lw12,lw13,lw14;
reg signed [15:0] lw21,lw22,lw23,lw24;

wire signed [31:0] out1,out2;

network uut
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
    .lw11(lw11),
    .lw12(lw12),
    .lw13(lw13),
    .lw14(lw14),
    .lw21(lw21),
    .lw22(lw22),
    .lw23(lw23),
    .lw24(lw24),
    .out1(out1),
    .out2(out2)
);

initial begin
    x1=16'd1;
    x2=16'd2;
    x3=16'd3;

    w11=1;
    w12=2;
    w13=3;
    w21=2;
    w22=1;
    w23=1;
    w31=1;
    w32=1;
    w33=1;
    w41=3;
    w42=2;
    w43=1;

    lw11=1;
    lw12=1;
    lw13=1;
    lw14=1;
    lw21=2;
    lw22=1;
    lw23=2;
    lw24=1;

    #10;
    x1=2;
    x2=1;
    x3=1;

    #10;   
    x1=12;
    x2=-3;
    x3=2;

    #10;
    x1=42;
    x2=67;
    x3=97;
    #10;

    $display("out1=%d",out1);
    $display("out2=%d",out2);
    $finish;
end

endmodule