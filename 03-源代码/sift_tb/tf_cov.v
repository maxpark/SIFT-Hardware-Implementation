`timescale 1ns / 1ps



module tf_cov;

	// Inputs
	reg clk;
	reg clk_90;
	reg clk_7x;
	reg rst;
	reg [9:0] din1;
	reg [9:0] din2;
	reg [9:0] din3;
	reg [9:0] din4;
	reg [9:0] din5;
	reg [9:0] din6;
	reg [9:0] din7;
	reg [9:0] din8;
	reg [7:0] k1;
	reg [7:0] k2;
	reg [7:0] k3;
	reg [7:0] k4;
	reg [7:0] k5;
	reg [7:0] k6;
	reg [7:0] k7;
	reg [7:0] k8;

	// Outputs
	wire [17:0] dout;
	wire dout_en;

	// Instantiate the Unit Under Test (UUT)
	cov uut (
		.clk(clk), 
		.clk_90(clk_90), 
		.clk_7x(clk_7x), 
		.rst(rst), 
		.din1(din1), 
		.din2(din2), 
		.din3(din3), 
		.din4(din4), 
		.din5(din5), 
		.din6(din6), 
		.din7(din7), 
		.din8(din8), 
		.k1(k1), 
		.k2(k2), 
		.k3(k3), 
		.k4(k4), 
		.k5(k5), 
		.k6(k6), 
		.k7(k7), 
		.k8(k8), 
		.dout(dout), 
		.dout_en(dout_en)
	);

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		clk_90 = 1'b0;
		clk_7x = 1'b0;
		rst = 1'b0;
		din1 = 10'd0;
		din2 = 10'd0;
		din3 = 10'd0;
		din4 = 10'd0;
		din5 = 10'd0;
		din6 = 10'd0;
		din7 = 10'd0;
		din8 = 10'd0;
		k1 = 8'd0;
		k2 = 8'd0;
		k3 = 8'd0;
		k4 = 8'd0;
		k5 = 8'd0;
		k6 = 8'd0;
		k7 = 8'd0;
		k8 = 8'd0;

		// Wait 100 ns for global reset to finish
		#100;
        rst=1; 

		k1=8'd1;
		k2=8'd2;
		k3=8'd3;
		k4=8'd4;
		k5=8'd5;
		k6=8'd6;
		k7=8'd7;
		k8=8'd8;
		din1=10'd1;
		din2=10'd2;
		din3=10'd3;
		din4=10'd4;
		din5=10'd5;
		din6=10'd6;
		din7=10'd7;
		din8=10'd8;
		
		#40;
		din1=10'd2;
		
		#40;
		din1=10'd1;

	end
	
	always
	begin
		#2 clk_7x<=~clk_7x;
	end
	
	always
	begin
		#10 clk<=~clk;
	end
	
	always
	begin	  
        #10 clk_90<=~clk_90;//
	end
      
endmodule

