module feature_extractor
(
    input clk,
    input rst,
    input out_valid,
    input [7:0] edge_pixel,
    output reg [15:0] feature1,
    output reg [15:0] feature2,
    output reg [15:0] feature3
);
always @(posedge clk) begin
    if(rst) begin
        feature1<=0;
        feature2<=0;
        feature3<=0;
    end
    else if(out_valid) begin
        if(edge_pixel>0) begin
            feature1<=feature1+1;
            feature2<=feature2+edge_pixel;
	end
        if(edge_pixel>feature3) begin
            feature3<=edge_pixel;
	end
    end
end
endmodule