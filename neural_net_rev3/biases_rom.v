module bias_rom
(
    input [2:0] addr,
    output reg signed [15:0] data
);

reg signed [15:0] mem [0:5];

initial begin
    $readmemh("biases.mem",mem);
end

always @(*) begin
    data=mem[addr];
end

endmodule