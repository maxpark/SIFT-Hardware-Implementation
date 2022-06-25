`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:42:25 12/07/2011
// Design Name:   main_ori_rom
// Module Name:   G:/coding/FPGA/algorithm/sift/sift/tf_main_rom.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_ori_rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_main_rom;

	// Inputs
	reg clka;
	reg [6:0] addra;

	// Outputs
	wire [5:0] douta;

	// Instantiate the Unit Under Test (UUT)
	main_ori_rom uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always 
	#5 clka=~clka;
	
	always@(posedge clka)
	addra<=addra+1;
      
endmodule

