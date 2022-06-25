`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:49:38 12/07/2011
// Design Name:   main_ori
// Module Name:   G:/coding/FPGA/algorithm/sift/siftmatcher(1123)/sift/tf_main_ori.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_ori
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_main_ori;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] mag;
	reg [5:0] dir;
	reg [15:0] kp_addr;

	// Outputs
	wire [5:0] dir_out;
	wire [15:0] grad_dir_addr;
	wire out_en;
	

	// Instantiate the Unit Under Test (UUT)
	main_ori uut (
		.clk(clk), 
		.rst(rst),
		.kp_addr(kp_addr),
		.mag(mag), 
		.dir(dir),
		.grad_dir_addr(grad_dir_addr),
		.dir_out(dir_out), 
		.out_en(out_en)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		mag = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=1;
		mag=20;
		kp_addr=10000;
//		dir=3;
//		
//		#100
//		dir=25;
        
		// Add stimulus here

	end
	
	always
	#5 clk=~clk;
	
	always@(posedge clk or negedge rst)
	begin
	if(!rst)
	begin
//		mag<=0;
		dir<=0;
	end
	else
	begin
//	if(mag<30)
//		mag<=mag+1;
//	else
//		mag<=0;
	if(dir<30)
		dir<=dir+1;
	else
		dir<=0;
	end
	end
      
endmodule

