`timescale 1ns / 1ps



module tf_DoG;

	// Inputs
	reg clk;
	reg clk_90;
	reg rst;
	reg [7:0] din;

	// Outputs
	wire [17:0] dout1;
	wire [17:0] dout2;
	wire [17:0] dout3;
	wire [17:0] dout4;
	wire [7:0] diff0;
	wire [7:0] diff1;
	wire [7:0] diff2;
	wire out_en;
	wire [20:0] addr;
	wire complete1;
	wire complete2;

	// Instantiate the Unit Under Test (UUT)
	DoG uut (
		.clk(clk), 
		.clk_90(clk_90),
		.rst(rst), 
		.din(din), 
		.dout1(dout1), 
		.dout2(dout2), 
		.dout3(dout3), 
		.dout4(dout4), 
		.diff0(diff0), 
		.diff1(diff1), 
		.diff2(diff2), 
		.out_en(out_en), 
		.addr(addr), 
		.complete1(complete1), 
		.complete2(complete2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_90 = 0;
		rst = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst=1;
		// Add stimulus here

	end
	
always@(posedge clk or negedge rst)
    if(rst == 1'b0)
        din <= 8'd0;
    else if(din == 8'd255)
        din <= 8'd0;
    else
        din <= din + 8'd1;
    
	
	always
	#10 clk=~clk;
	
	always
	#10 clk_90=~clk_90;
      
endmodule

