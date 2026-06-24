module image_rom
(
    input [9:0] addr,
    output reg [7:0] pixel
);
reg [7:0] mem [0:783];
initial
begin
    $readmemh("image_circle.mem",mem);
end
always @(*)
begin
    pixel=mem[addr];
end
endmodule