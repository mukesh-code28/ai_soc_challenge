module relu
(
    input  signed [15:0] data_in,
    output signed [15:0] data_out
);
assign data_out=(data_in>0)?data_in:16'd0;
endmodule