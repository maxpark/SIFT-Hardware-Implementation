`timescale 1ns / 1ps


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

