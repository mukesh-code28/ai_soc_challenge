module control_unit
(
    input clk,
    input reset,
    output reg load_inputs,
    output reg compute,
    output reg output_ready
);
reg [1:0] state;
parameter IDLE=2'b00,
          LOAD=2'b01,
          COMPUTE=2'b10,
          OUTPUT=2'b11;
always @(posedge clk or posedge reset)
begin
    if(reset)
        state<=IDLE;
    else
        case(state)
            IDLE:state<=LOAD;
            LOAD:state<=COMPUTE;
            COMPUTE:state<=OUTPUT;
            OUTPUT:state<=IDLE;
        endcase
end
always @(*)
begin
    load_inputs=1'b0;
    compute=1'b0;
    output_ready=1'b0;
    case(state)
        LOAD:load_inputs=1'b1;
        COMPUTE:compute=1'b1;
        OUTPUT:output_ready=1'b1;
    endcase
end
endmodule