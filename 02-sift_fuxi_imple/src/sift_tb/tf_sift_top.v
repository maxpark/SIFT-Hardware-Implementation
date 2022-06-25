`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:03:25 02/21/2012
// Design Name:   sift_top
// Module Name:   G:/coding/FPGA/algorithm/sift/sift/tf_sift_top.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sift_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_sift_top;

	// Inputs
	reg clk_sys;
	reg rst_sys;

	// Outputs
	wire complete3;
	wire [7:0] desc_out;
	wire complete1;

	// Instantiate the Unit Under Test (UUT)
	sift_top uut (
		.clk_sys(clk_sys), 
		.rst_sys(rst_sys), 
		.complete3(complete3), 
		.desc_out(desc_out), 
		.complete1(complete1)
	);

	initial begin
		// Initialize Inputs
		clk_sys = 0;
		rst_sys = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_sys=1;
        
		// Add stimulus here

	end
	
	always
	begin
		#5 clk_sys=~clk_sys;
	end
      
endmodule

