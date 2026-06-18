module relu_tb;
reg  signed [15:0] data_in;
wire signed [15:0] data_out;
relu uut
(
    .data_in(data_in),
    .data_out(data_out)
);
initial begin
    data_in = 16'd25;
    #10;
    data_in = -16'd10;
    #10;
    data_in = 16'd0;
    #10;
    data_in = 16'd100;
    #10;
    data_in = -16'd50;
    #10;
    $finish;
end
endmodule