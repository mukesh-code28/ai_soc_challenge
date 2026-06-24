module network_top_tb;

reg signed [15:0] feature1;
reg signed [15:0] feature2;
reg signed [15:0] feature3;

network_top uut(
    .feature1(feature1),
    .feature2(feature2),
    .feature3(feature3)
);

initial
begin

    feature1 = 168;
    feature2 = 42840;
    feature3 = 255;

    #20;

    $finish;

end

endmodule