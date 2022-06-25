`timescale 1ns / 1ps



module tf_sift_desc;

	// Inputs
	reg clk;
	reg rst;
    reg [7:0]   mag_in;
    reg [7:0]   dir_in;
    reg [17:0]  addr_kp_in;  

	// Outputs
    wire    [9:0]   addr_kp_out;
    wire    [17:0]  addr_grad_out;
    wire    [17:0]  addr_dir_out;
    wire    [1023:0]    desc_out;
    wire    desc_complete;
    wire    complete1;
    wire    complete2;
	wire    [5:0]   main_dir;
    
	// Instantiate the Unit Under Test (UUT)
	sift_desc uut 
    (
		.clk(clk), 
		.rst(rst), 
        .mag_in(mag_in),
        .dir_in(dir_in),
        .addr_kp_in(addr_kp_in),
        
        .addr_kp_out(addr_kp_out),
        .addr_grad_out(addr_grad_out),
        .addr_dir_out(addr_dir_out),
        .desc_out(desc_out),
        .desc_complete(desc_complete),
        .complete1(complete1),
        .complete2(complete2),
		.main_dir(main_dir)
	);

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		rst = 1'b0;
        mag_in = 8'd0;
        dir_in = 8'd0;
        addr_kp_in = 18'd0;

		#500;
		
		rst=1;
        
	end
	
	always #5 clk <=~ clk;
    
    always @(posedge clk or negedge rst)
    if(!rst)
        mag_in <= 8'd0;
    else 
        mag_in <= mag_in + 8'd17;
        
    always @(posedge clk or negedge rst)
    if(!rst)
        dir_in <= 8'd0;
    else if(dir_in >= 8'd29)
        dir_in <= dir_in - 8'd29;
    else 
        dir_in <= dir_in + 8'd7;    
        
    always @(posedge clk or negedge rst)
    if(!rst)
        addr_kp_in <= 18'd0;
    else 
        addr_kp_in <= addr_kp_in + {8'd0,dir_in}<<8;    
      
endmodule

