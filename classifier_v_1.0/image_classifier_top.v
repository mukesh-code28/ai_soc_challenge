module image_classifier_top
(
    input clk,
    input rst,

    output signed [31:0] out1,
    output signed [31:0] out2
);

wire pixel_valid;
wire [7:0] pixel;

wire window_valid;

wire [7:0] w00,w01,w02;
wire [7:0] w10,w11,w12;
wire [7:0] w20,w21,w22;

wire sobel_valid;
wire [7:0] edge_pixel;

wire [15:0] feature1;
wire [15:0] feature2;
wire [15:0] feature3;

image_streamer STREAM
(
    .clk(clk),
    .rst(rst),
    .pixel_valid(pixel_valid),
    .pixel_out(pixel)
);

window_3x3 #(
    .WIDTH(28)
)
WIN
(
    .clk(clk),
    .rst(rst),
    .pixel_valid(pixel_valid),
    .pixel_in(pixel),

    .window_valid(window_valid),

    .w00(w00), .w01(w01), .w02(w02),
    .w10(w10), .w11(w11), .w12(w12),
    .w20(w20), .w21(w21), .w22(w22)
);

sobel_filter SOBEL
(
    .clk(clk),
    .window_valid(window_valid),

    .w00(w00), .w01(w01), .w02(w02),
    .w10(w10), .w11(w11), .w12(w12),
    .w20(w20), .w21(w21), .w22(w22),

    .out_valid(sobel_valid),
    .edge_pixel(edge_pixel)
);

feature_extractor FE
(
    .clk(clk),
    .rst(rst),

    .out_valid(sobel_valid),
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
    .out2(out2)
);

endmodule