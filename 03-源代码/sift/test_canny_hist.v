`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:30:24 04/01/2012
// Design Name:   canny
// Module Name:   G:/coding/FPGA/algorithm/sift/sift/test_canny_hist.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: canny
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_canny_hist;

	// Inputs
	reg clk1;
	reg clk2;
	reg rst;
	reg [7:0] mag1;
	reg [7:0] mag2;
	reg [5:0] dir1;
	reg [5:0] dir2;

	// Outputs
	wire [17:0] addr;
	wire canny_edge;

	// Instantiate the Unit Under Test (UUT)
	canny uut (
		.clk1(clk1), 
		.clk2(clk2), 
		.rst(rst), 
		.mag1(mag1), 
		.mag2(mag2), 
		.dir1(dir1), 
//		.dir2(dir2), 
		.addr(addr), 
		.canny_edge(canny_edge)
	);

	initial begin
		// Initialize Inputs
		clk1 = 0;
		clk2 = 0;
		rst = 0;
		mag1 = 0;
		mag2 = 0;
		dir1 = 0;
		dir2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst=1;  
		// Add stimulus here

	end
	
	always
	#5 clk1=~clk1;
	
	always
	#2.5 clk2=~clk2;
	
	always@(posedge clk1 or negedge rst)
	begin
		if(!rst)
		begin
			mag1<=0;
		end
		else
		begin
			if(mag1<128)
				mag1<=mag1+1;
			else
				mag1<=0;
		end
	end
      
endmodule

