module image_pipeline
(
	input clk,
	input rst,
	output out_valid,
	output [7:0] edge_pixel,
	output done
);
wire pixel_valid;
wire [7:0] pixel;
wire window_valid;
wire [7:0] w00;
wire [7:0] w01;
wire [7:0] w02;
wire [7:0] w10;
wire [7:0] w11;
wire [7:0] w12;
wire [7:0] w20;
wire [7:0] w21;
wire [7:0] w22;
image_streamer S
(
	.clk(clk),
	.rst(rst),
	.pixel_valid(pixel_valid),
	.pixel_out(pixel),
	.done(done)
);

window_3x3 #(.WIDTH(28)) W
(
	.clk(clk),
	.rst(rst),
	.pixel_valid(pixel_valid),
	.pixel_in(pixel),
	.window_valid(window_valid),
	.w00(w00),
	.w01(w01),
	.w02(w02),
	.w10(w10),
	.w11(w11),
	.w12(w12),
	.w20(w20),
	.w21(w21),
	.w22(w22)
);
sobel_filter sbl
(
	.clk(clk),
	.window_valid(window_valid),
	.w00(w00),
	.w01(w01),
	.w02(w02),
	.w10(w10),
	.w11(w11),
	.w12(w12),
	.w20(w20),
	.w21(w21),
	.w22(w22),
	.out_valid(out_valid),
	.edge_pixel(edge_pixel)
);
endmodule
