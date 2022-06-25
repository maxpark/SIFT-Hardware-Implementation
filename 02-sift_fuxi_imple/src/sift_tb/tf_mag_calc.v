`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/09 22:11:52
// Design Name: 
// Module Name: tf_mag_calc
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


module tf_mag_calc(

    );
    
reg         clk;
reg         rst;
reg         complete1;
reg  [7:0]  din;
reg  [7:0]  temp;
wire    signed  [7:0]   dx;   
wire    signed  [7:0]   dy;
wire        out_en; 
    
always #10 clk = ~clk;

initial begin
    clk = 'b0;
    rst = 1'b0;
    complete1 = 1'b1;
    din = 8'd0;
    #100
    rst = 1'b1;
end

always@(posedge clk or negedge rst) 
    if(rst == 1'b0)
        temp <= 8'd0;
    else if(temp == 8'd10)
        temp <= 8'd0;
    else
        temp <= temp + 8'd1;

always@(posedge clk or negedge rst) 
    if(rst == 1'b0)
        din <= 8'd0;
    else if(din > 8'd200)
        din <= 8'd0;
    else
        din <= din + temp;

    
    

mag_calc tb_mag_calc(
    .clk(clk),
    .rst(rst),
	.complete1(complete1),
    .din(din),
    .dx(dx),
    .dy(dy),
    .out_en(out_en)
    );
    
endmodule
