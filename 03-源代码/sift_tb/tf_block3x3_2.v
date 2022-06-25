`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Design Name:   block3x3_2
// Project Name:  sift
// Target Device:  
// 
////////////////////////////////////////////////////////////////////////////////

module tf_block3x3_2;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] din;

	// Outputs
	wire [7:0] dout1;
	wire [7:0] dout2;
	wire [7:0] dout3;
	wire [7:0] dout4;
	wire [7:0] dout5;
	wire [7:0] dout6;
	wire [7:0] dout7;
	wire [7:0] dout8;
	wire [7:0] dout9;
	wire start_flag;

	// Instantiate the Unit Under Test (UUT)
	block3x3_2 uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.dout1(dout1), 
		.dout2(dout2), 
		.dout3(dout3), 
		.dout4(dout4), 
		.dout5(dout5), 
		.dout6(dout6), 
		.dout7(dout7), 
		.dout8(dout8), 
		.dout9(dout9), 
		.start_flag(start_flag)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst=1;
        
		// Add stimulus here

	end
      
	always
	#10 clk=~clk;
	
	always@(posedge clk)
	begin
		if(!rst)
			din<=0;
		else
		begin
			if(din<200)
				din<=din+1;
			else
				din<=0;
		end
	end
	
endmodule

