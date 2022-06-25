`timescale 1ns / 1ps


module tf_local_desc;

	// Inputs
	reg clk;
	reg rst;
	reg [17:0] addr_kp;
	reg [7:0] mag;
	reg [5:0] dir;
	reg [5:0] main_dir;
    reg complete1;

	// Outputs
	wire [15:0] local_desc_addr;
    wire [63:0] tdesc1;
    wire [63:0] tdesc2;
    wire [63:0] tdesc3;
    wire [63:0] tdesc4;
    wire [63:0] tdesc5;
    wire [63:0] tdesc6;
    wire [63:0] tdesc7;
    wire [63:0] tdesc8;
    wire [63:0] tdesc9;
    wire [63:0] tdesc10;
    wire [63:0] tdesc11;
    wire [63:0] tdesc12;
    wire [63:0] tdesc13;
    wire [63:0] tdesc14;
    wire [63:0] tdesc15;
    wire [63:0] tdesc16;

	// Instantiate the Unit Under Test (UUT)
	local_desc uut (
		.clk(clk), 
		.rst(rst), 
		.addr_kp(addr_kp), 
		.mag(mag), 
		.dir(dir), 
		.main_dir(main_dir), 
		.local_desc_addr(local_desc_addr),
        .tdesc1(tdesc1),
        .tdesc2(tdesc2),
        .tdesc3(tdesc3),
        .tdesc4(tdesc4),
        .tdesc5(tdesc5),
        .tdesc6(tdesc6),
        .tdesc7(tdesc7),
        .tdesc8(tdesc8),
        .tdesc9(tdesc9),
        .tdesc10(tdesc10),
        .tdesc11(tdesc11),
        .tdesc12(tdesc12),
        .tdesc13(tdesc13),
        .tdesc14(tdesc14),
        .tdesc15(tdesc15),
        .tdesc16(tdesc16)   
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		addr_kp = 0;
		mag = 0;
		dir = 0;
		main_dir = 0;
        complete1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst=1;
		addr_kp=10020;
//		mag=10;
//		dir=2;
		main_dir=3;
		// Add stimulus here
        
        #500 
        complete1 = 1;

	end
	
	always
	#5 clk=~clk;
	
	always@(posedge clk)
	begin
		if(dir<30)
			dir<=dir+1;
		else
			dir<=0;
		if(mag<30)
			mag<=mag+1;
		else
			mag<=0;
	end
      
endmodule

