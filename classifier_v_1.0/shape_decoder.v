module shape_decoder(
    input [1:0] class
);

always @(*)
begin
    case(class)

        2'd0:
            $display("Detected Shape = TRIANGLE");

        2'd1:
            $display("Detected Shape = SQUARE");

        2'd2:
            $display("Detected Shape = CIRCLE");

    endcase
end

endmodule