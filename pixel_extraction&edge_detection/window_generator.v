module window_3x3#(
	parameter WIDTH=28
)
(
	input clk,
	input rst,
	input pixel_valid,
	input [7:0] pixel_in,
	output reg window_valid,
	output reg [7:0] w00,w01,w02,
	output reg [7:0] w10,w11,w12,
	output reg [7:0] w20,w21,w22
);
reg [7:0] line1 [0:WIDTH-1];
reg [7:0] line2 [0:WIDTH-1];
reg [10:0] row_cnt;
reg [10:0] col_cnt;
integer i;
always @(posedge clk)
begin
	if(rst)
	begin
		row_cnt<=0;
		col_cnt<=0;
		window_valid<=0;
		w00<=0;w01<=0;w02<=0;
		w10<=0;w11<=0;w12<=0;
		w20<=0;w21<=0;w22<=0;
		for(i=0;i<WIDTH;i=i+1)
		begin
			line1[i]<=0;
			line2[i]<=0;
		end
	end
	else if(pixel_valid)
	begin
		w00<=w01;
		w01<=w02;
		w10<=w11;
		w11<=w12;
		w20<=w21;
		w21<=w22;
		w02<=line1[col_cnt];
		w12<=line2[col_cnt];
		w22<=pixel_in;
		line1[col_cnt]<=line2[col_cnt];
		line2[col_cnt]<=pixel_in;
		if((row_cnt>=2)&&(col_cnt>=2))
			window_valid<=1'b1;
		else
			window_valid<=1'b0;
		if(col_cnt==WIDTH-1)
		begin
			col_cnt<=0;
			row_cnt<=row_cnt+1;
		end
		else
		begin
			col_cnt<=col_cnt+1;
		end
	end
	else
	begin
		window_valid<=1'b0;
	end
	if(window_valid)
	begin
		$display("\nPixel In=%d",pixel_in);
		$display("%d %d %d",w00,w01,w02);
		$display("%d %d %d",w10,w11,w12);
		$display("%d %d %d",w20,w21,w22);
		$display("-------------------------");
	end
end
endmodule