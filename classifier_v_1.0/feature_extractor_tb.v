module feature_extractor_tb;

reg clk;
reg rst;

reg out_valid;
reg [7:0] edge_pixel;

wire [15:0] feature1;
wire [15:0] feature2;
wire [15:0] feature3;

feature_extractor uut
(
    .clk(clk),
    .rst(rst),

    .out_valid(out_valid),
    .edge_pixel(edge_pixel),

    .feature1(feature1),
    .feature2(feature2),
    .feature3(feature3)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    out_valid = 0;
    edge_pixel = 0;

    #20;
    rst = 0;

    out_valid = 1;

    edge_pixel = 255; #10;
    edge_pixel = 0;   #10;
    edge_pixel = 255; #10;
    edge_pixel = 255; #10;
    edge_pixel = 0;   #10;
    edge_pixel = 255; #10;

    out_valid = 0;

    #20;

    $display("Feature1 (edge count) = %d", feature1);
    $display("Feature2 (edge sum)   = %d", feature2);
    $display("Feature3 (max edge)   = %d", feature3);

    $finish;
end

endmodule