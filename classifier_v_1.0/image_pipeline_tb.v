module image_pipeline_tb
();
reg clk;
reg rst;
wire out_valid;
wire [7:0] edge_pixel;
wire done;
integer fp;
integer count;
image_pipeline uut
(
	.clk(clk),
	.rst(rst),
	.out_valid(out_valid),
	.edge_pixel(edge_pixel),
	.done(done)
);
always #5 clk=~clk;
initial
begin
	fp=$fopen("edge_output_circle.txt","w");
	count=0;
end
always @(posedge clk)
begin
	if(out_valid)
	begin
		$fwrite(fp,"%d\n",edge_pixel);
		count=count+1;
	end
end
initial
begin
	clk=0;
	rst=1;
	#20;
	rst=0;
	wait(done);
	#500;
	$display("Total output pixels=%d",count);
	$fclose(fp);
	$finish;
end
endmodule