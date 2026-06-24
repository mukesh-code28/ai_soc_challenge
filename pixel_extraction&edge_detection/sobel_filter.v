module sobel_filter
#(
	parameter THRESHOLD=100
)
(
	input clk,
	input window_valid,
	input [7:0] w00,w01,w02,
	input [7:0] w10,w11,w12,
	input [7:0] w20,w21,w22,
	output reg out_valid,
	output reg [7:0] edge_pixel
);
reg signed [10:0] gx;
reg signed [10:0] gy;
reg [10:0] abs_gx;
reg [10:0] abs_gy;
reg [11:0] mag;
always @(posedge clk)
begin
	if(window_valid)
	begin
		gx<=(w02+(w12<<1)+w22)-(w00+(w10<<1)+w20);
		gy<=(w20+(w21<<1)+w22)-(w00+(w01<<1)+w02);
		abs_gx<=(gx<0)?-gx:gx;
		abs_gy<=(gy<0)?-gy:gy;
		mag<=abs_gx+abs_gy;
		if(mag>THRESHOLD)
			edge_pixel<=8'd255;
		else
			edge_pixel<=8'd0;
		out_valid<=1'b1;
		$display("\n");
		$display("3x3 Window");
		$display("%d %d %d",w00,w01,w02);
		$display("%d %d %d",w10,w11,w12);
		$display("%d %d %d",w20,w21,w22);
		$display("Gx=%d",gx);
		$display("Gy=%d",gy);
		$display("Magnitude=%d",mag);
		$display("Edge Pixel=%d",edge_pixel);
		$display("----------------------------");
	end
	else
	begin
		out_valid<=1'b0;
	end
end
endmodule