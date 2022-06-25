`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:17:05 01/10/2012
// Design Name:   ram_mag1
// Module Name:   G:/coding/FPGA/algorithm/sift/sift/tf_ram_mag1.v
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_mag1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_ram_mag1;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [15:0] addra;
	reg [7:0] dina;

	// Outputs
	wire [7:0] douta;

	// Instantiate the Unit Under Test (UUT)
	ram_mag1 uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	reg [15:0] addr_r;
	reg [15:0] addr_w;
	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 1;
		addra = 0;
		dina = 0;
		addr_r=0;
		addr_w=0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
        
		// Add stimulus here

	end
	
	always
	#10 clka=~clka;
	
	
	always@(posedge clka)
	begin
		if(addr_w<1000)
		begin
			addr_w<=addr_w+1;
			dina<=dina+1;
		end
		else
		begin
			wea<=0;
			addr_r<=addr_r+1;
		end
		
		if(wea)
			addra<=addr_w;
		else
			addra<=addr_r;
	end
      
endmodule

