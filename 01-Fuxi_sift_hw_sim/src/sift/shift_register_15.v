`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    17:36:22 06/10/11
// Design Name:    
// Module Name:    shift_register_3
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module shift_register_15(clk, din, rst, dout);
    input [7:0] din;
    input rst;
	 input clk;
	 output [87:0] dout;

	 wire[7:0] dout0;
	 reg[7:0] dout1[10:1];

	 always@(posedge clk or negedge rst)
	 begin
	 	if(!rst)
		begin
			dout1[1]<=8'bzzzzzzzz;
			dout1[10]<=8'bzzzzzzzz;
//			dout1[11]<=8'bzzzzzzzz;
//			dout1[12]<=8'bzzzzzzzz;
//			dout1[13]<=8'bzzzzzzzz;
//			dout1[14]<=8'bzzzzzzzz;
			dout1[2]<=8'bzzzzzzzz;
			dout1[3]<=8'bzzzzzzzz;
			dout1[4]<=8'bzzzzzzzz;
			dout1[5]<=8'bzzzzzzzz;
			dout1[6]<=8'bzzzzzzzz;
			dout1[7]<=8'bzzzzzzzz;
			dout1[8]<=8'bzzzzzzzz;
			dout1[9]<=8'bzzzzzzzz;
		end
		else
		begin
			dout1[1]<=din;
			dout1[2]<=dout1[1];
			dout1[3]<=dout1[2];
			dout1[4]<=dout1[3];
			dout1[5]<=dout1[4];
			dout1[6]<=dout1[5];
			dout1[7]<=dout1[6];
			dout1[8]<=dout1[7];
			dout1[9]<=dout1[8];
			dout1[10]<=dout1[9];
//			dout1[11]<=dout1[10];
//			dout1[12]<=dout1[11];
//			dout1[13]<=dout1[12];
//			dout1[14]<=dout1[13];
		end
	 end

	 assign dout0=din;

	 assign dout={dout1[10],dout1[9],dout1[8],dout1[7],dout1[6],dout1[5],dout1[4],dout1[3],dout1[2],dout1[1],dout0};
	 //dout1[14],dout1[13],dout1[12],dout1[11],

endmodule
