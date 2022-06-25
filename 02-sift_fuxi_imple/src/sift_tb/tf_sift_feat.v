`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:57 12/30/2011
// Design Name:   sift_feat
// Module Name:   G:/coding/FPGA/algorithm/sift/sift/tf_sift_feat.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sift_feat
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_sift_feat;

	// Inputs
	reg clk_sys;
	reg rst_sys;
	reg [7:0] din;

	// Outputs
	wire [7:0] max;
	wire [7:0] min;
	wire dout_kp;
	wire [7:0] mag;
	wire [5:0] dir;
	wire out_en;
    wire complete1;
    wire complete2;
	reg     [7:0]   data_img[262144:0];

	wire [17:0] addr;


	// Instantiate the Unit Under Test (UUT)
	sift_feat uut (
		.clk(clk_sys), 
        .clk_90(clk_sys), 
		.rst(rst_sys), 
		.din(din),
		.addr(addr),

		.max(max), 
		.min(min), 
		.dout_kp(dout_kp), 
		
		.mag(mag), 
		.dir(dir), 
		.out_en(out_en),
        .complete1(complete1),
        .complete2(complete2)
	);

	initial begin
		// Initialize Inputs
		clk_sys = 0;
		rst_sys = 0;
		din = 0;
		$readmemh("ram_image.txt", data_img);

		// Wait 100 ns for global reset to finish
		#100;
		rst_sys=1;
		// Add stimulus here

	end

	always
		#10 clk_sys=~clk_sys;
    
    always@(posedge clk_sys or negedge rst_sys)
        if(rst_sys == 1'b0)
            din <= 8'd0;
        else 
            din <= data_img[addr];
      
endmodule

