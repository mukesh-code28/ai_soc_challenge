module image_classifier_top_tb;

reg clk;
reg rst;

wire signed [31:0] out1;
wire signed [31:0] out2;

image_classifier_top uut
(
    .clk(clk),
    .rst(rst),
    .out1(out1),
    .out2(out2)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #10000;
	$display("Feature1 = %d", uut.feature1);
$display("Feature2 = %d", uut.feature2);
$display("Feature3 = %d", uut.feature3);
    $display("NN Out1 = %d", out1);
    $display("NN Out2 = %d", out2);

    $finish;
end

endmodule