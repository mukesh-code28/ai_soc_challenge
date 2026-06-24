module classifier(
    input signed [31:0] out1,
    input signed [31:0] out2,
    input signed [31:0] out3,

    output reg [1:0] class
);

always @(*)
begin
    if(out1 >= out2 && out1 >= out3)
        class = 2'd0;

    else if(out2 >= out1 && out2 >= out3)
        class = 2'd1;

    else
        class = 2'd2;
end

endmodule