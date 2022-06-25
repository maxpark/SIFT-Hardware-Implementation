`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/10 09:32:26
// Design Name: 
// Module Name: tf_mag_dir_calc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tf_mag_dir_calc();

reg     clk;
reg     rst;
reg [7:0]   dx;
reg [7:0]   dy;
wire    [7:0]   mag;
wire    [5:0]   dir;
wire    out_en;

initial begin
    clk = 1'b0;
    rst = 1'b0;
    dx = 8'd0;
    dy = 8'd255;
    #100
    rst = 1'b1;
end

always #10 clk = ~clk;

always@(posedge clk or negedge rst)
    if(rst == 1'b0) begin
        dx = 8'd0;
        dy = 8'd255;
        end
    else begin
        dx = dx + 8'd2;
        dy = dy - 8'd3;
        end

mag_dir_calc tb_mag_dir_calc
(
    .clk(clk),
    .rst(rst),
    .dx(dx),
    .dy(dy),
	.mag(mag),
    .dir(dir),
    .out_en(out_en)
);

endmodule

