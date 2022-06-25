`timescale 1ns / 1ps



module tf_local_extreme;

	// Inputs
	reg clk;
	reg rst;
	 reg signed [7:0] diff0;
	 reg signed [7:0] diff1;
	 reg signed [7:0] diff2;
     reg complete1;

	// Outputs
	wire signed  [7:0] max;
	wire signed  [7:0] min;
	wire dout;
	wire out_en;

	// Instantiate the Unit Under Test (UUT)
	local_extreme uut (
		.clk(clk), 
		.rst(rst), 
        .complete1(complete1),
		.diff0(diff0), 
		.diff1(diff1), 
		.diff2(diff2), 
		.max(max), 
		.min(min), 
		.dout(dout), 
		.out_en(out_en)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
        complete1 = 1;
//		diff0 = 0;
//		diff1 = 0;
//		diff2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=1;
        
		// Add stimulus here

	end
	
	always
	#5 clk=~clk;
	
	always@(posedge clk)
	begin
	if(!rst)
	begin
		diff0<=-100;
		diff1<=-50;
		diff2<=-30;
	end
	
	else
	begin
		if(diff0<100)
			diff0<=diff0+4;
		else
			diff0<=-100;
		
		if(diff1<100)
			diff1<=diff1+2;
		else
			diff1<=-50;
		
		if(diff2<100)
			diff2<=diff2+1;
		else
			diff2<=-30;
		
		
	end
	end
      
endmodule

