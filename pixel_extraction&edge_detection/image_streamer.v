module image_streamer
(
	input clk,
	input rst,
	output reg pixel_valid,
	output reg [7:0] pixel_out,
	output reg done
);
reg [9:0] addr;
wire [7:0] pixel;
image_rom ROM
(
	.addr(addr),
	.pixel(pixel)
);
always @(posedge clk)
begin
	if(rst)
	begin
	addr<=0;
	pixel_valid<=0;
	pixel_out<=0;
	done<=0;
	end
	else
	begin
	if(addr<=783)
	begin
		pixel_out<=pixel;
		pixel_valid<=1;
		if(addr==783)
		begin
			done<=1;
			pixel_valid<=0;
		end
		else
		begin
			addr<=addr+1;
		end
	end
	else
	begin
		pixel_valid<=0;
	end
end
end
endmodule