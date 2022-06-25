`timescale 1ns / 1ps


////////////////////////////////////////////////////////////////////////////////

module tf_block11_1;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] din;

	// Outputs
	wire [87:0] dout1;
	wire [87:0] dout2;
	wire [87:0] dout3;
	wire [87:0] dout4;
	wire [87:0] dout5;
	wire [87:0] dout6;
	wire [87:0] dout7;
	wire [87:0] dout8;
	wire [87:0] dout9;
	wire [87:0] dout10;
	wire [87:0] dout11;
	wire start_flag;
	wire [20:0] cnt;
	wire complete;

	// Instantiate the Unit Under Test (UUT)
	block11x11 uut (
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
		.dout10(dout10), 
		.dout11(dout11), 
		.start_flag(start_flag), 
		.cnt(cnt), 
		.complete(complete)
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
		begin
			din<=0;
		end
		
		else
		begin
			if(din<200)
				din<=din+1;
			else
				din<=0;
		end
	end
      
endmodule

