module control_unit_tb;
reg clk,reset;
wire load_inputs;
wire compute;
wire output_ready;
control_unit uut
(
    .clk(clk),
    .reset(reset),
    .load_inputs(load_inputs),
    .compute(compute),
    .output_ready(output_ready)
);
always #5 clk=~clk;
initial
begin
    clk=0;
    reset=1;
    #10;
    reset=0;
    #50;
    $finish;
end
endmodule