`timescale 1ns / 1ps



module tf_window_rotate;

	// Inputs
	reg clk;
	reg rst;
	reg [5:0] main_dir;
	reg [17:0] kp_addr;
	reg [7:0] cnt;
    reg complete1;

	// Outputs
	wire [15:0] addr_out;

	// Instantiate the Unit Under Test (UUT)
	window_rotate uut (
		.clk(clk), 
		.rst(rst), 
		.main_dir(main_dir), 
		.kp_addr(kp_addr), 
		.cnt(cnt), 
        .complete1(complete1),
		.addr_out(addr_out)   
	);

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		rst = 1'b0;
		main_dir = 6'd0;
		kp_addr = 16'd0;
		cnt = 8'd0;
        complete1 = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst=1'b1;
		main_dir=6'd9;
		kp_addr=16'd10020;
        
        #100 
        complete1 = 1'b1;
	end
	
    always #5 clk <= ~clk;
        
    always@(posedge clk or negedge rst)
        if(!rst)
            cnt <= 8'd0;
        else
            cnt <= cnt+8'd1;		
      
endmodule

