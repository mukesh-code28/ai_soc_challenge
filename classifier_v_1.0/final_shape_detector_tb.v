module final_shape_detector_tb;

reg clk;
reg rst;

final_shape_detector uut
(
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #15000;

    $finish;
end

endmodule