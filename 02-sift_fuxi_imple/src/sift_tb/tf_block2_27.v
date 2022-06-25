`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:26 11/24/2011
// Design Name:   block2_27extreme
// Module Name:   G:/coding/FPGA/algorithm/sift/siftmatcher(1123)/sift/tf_block2_27.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: block2_27extreme
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_block2_27;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] diff0;
	reg [7:0] diff1;
	reg [7:0] diff2;

	// Outputs
	wire [7:0] dout11;
	wire [7:0] dout12;
	wire [7:0] dout13;
	wire [7:0] dout14;
	wire [7:0] dout15;
	wire [7:0] dout16;
	wire [7:0] dout17;
	wire [7:0] dout18;
	wire [7:0] dout19;
	wire [7:0] dout21;
	wire [7:0] dout22;
	wire [7:0] dout23;
	wire [7:0] dout24;
	wire [7:0] dout25;
	wire [7:0] dout26;
	wire [7:0] dout27;
	wire [7:0] dout28;
	wire [7:0] dout29;
	wire [7:0] dout31;
	wire [7:0] dout32;
	wire [7:0] dout33;
	wire [7:0] dout34;
	wire [7:0] dout35;
	wire [7:0] dout36;
	wire [7:0] dout37;
	wire [7:0] dout38;
	wire [7:0] dout39;
	wire out_en;

	// Instantiate the Unit Under Test (UUT)
	block2_27extreme uut (
		.clk(clk), 
		.rst(rst), 
		.diff0(diff0), 
		.diff1(diff1), 
		.diff2(diff2), 
		.dout11(dout11), 
		.dout12(dout12), 
		.dout13(dout13), 
		.dout14(dout14), 
		.dout15(dout15), 
		.dout16(dout16), 
		.dout17(dout17), 
		.dout18(dout18), 
		.dout19(dout19), 
		.dout21(dout21), 
		.dout22(dout22), 
		.dout23(dout23), 
		.dout24(dout24), 
		.dout25(dout25), 
		.dout26(dout26), 
		.dout27(dout27), 
		.dout28(dout28), 
		.dout29(dout29), 
		.dout31(dout31), 
		.dout32(dout32), 
		.dout33(dout33), 
		.dout34(dout34), 
		.dout35(dout35), 
		.dout36(dout36), 
		.dout37(dout37), 
		.dout38(dout38), 
		.dout39(dout39), 
		.out_en(out_en)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		diff0 = 0;
		diff1 = 0;
		diff2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst=1;
      diff0=0;
		diff1=0;
		diff2=0;
		// Add stimulus here

	end
	
	always
	#5 clk=~clk;
	
	always @(posedge clk)
	begin
		diff0=diff0+1;
		diff1=diff1+1;
		diff2=diff2+1;
	end
      
endmodule

