module final_shape_detector
(
    input clk,
    input rst
);

wire out_valid;
wire [7:0] edge_pixel;
wire done;

wire [15:0] feature1;
wire [15:0] feature2;
wire [15:0] feature3;

wire signed [31:0] out1;
wire signed [31:0] out2;
wire signed [31:0] out3;

wire [1:0] class_id;

image_pipeline IMG
(
    .clk(clk),
    .rst(rst),
    .out_valid(out_valid),
    .edge_pixel(edge_pixel),
    .done(done)
);

feature_extractor FE
(
    .clk(clk),
    .rst(rst),

    .out_valid(out_valid),
    .edge_pixel(edge_pixel),

    .feature1(feature1),
    .feature2(feature2),
    .feature3(feature3)
);

network_rom NN
(
    .x1(feature1),
    .x2(feature2),
    .x3(feature3),

    .out1(out1),
    .out2(out2),
    .out3(out3)
);

classifier CLS
(
    .out1(out1),
    .out2(out2),
    .out3(out3),

    .class(class_id)
);

shape_decoder DEC
(
    .class(class_id)
);

always @(posedge done)
begin
    $display(" ");
    $display("Final Features");
    $display("Feature1 = %d",feature1);
    $display("Feature2 = %d",feature2);
    $display("Feature3 = %d",feature3);

    $display(" ");

    $display("NN Outputs");
    $display("Out1 = %d",out1);
    $display("Out2 = %d",out2);
    $display("Out3 = %d",out3);

    $display(" ");

    case(class_id)

        2'd0:
            $display("Detected Shape = TRIANGLE");

        2'd1:
            $display("Detected Shape = SQUARE");

        2'd2:
            $display("Detected Shape = CIRCLE");

    endcase

end

endmodule