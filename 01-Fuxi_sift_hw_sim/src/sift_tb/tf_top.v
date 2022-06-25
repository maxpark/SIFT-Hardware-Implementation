`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Project Name:  sift
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sift_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_top;

// Inputs
reg clk_sys;
reg rst_sys;
reg EPP_Write0;
reg EPP_DataStrobe0;
reg EPP_Reset0;
reg EPP_AddressStrobe0;

// Outputs
wire EPP_Interrupt;
wire EPP_Wait;
wire led1;
wire led2;

// Bidirs
wire [7:0] EPP_Data;
   
//other simulation variables
reg [7:0] input_data; 
integer file;
reg     [7:0]   data_img[262143:0];

parameter   CLOCK_FRAME = 10;

initial begin
	// Initialize Inputs
	clk_sys = 0;
	rst_sys = 0;
	EPP_Write0 = 0;
	EPP_DataStrobe0 = 0;
	EPP_Reset0 = 0;
	EPP_AddressStrobe0 = 0;
       
	// Wait for global reset to finish
	#10000
	rst_sys=1;
    EPP_Reset0 = 1;
    EPP_DataStrobe0 = 0;
    EPP_AddressStrobe0 = 1;
    EPP_Write0 = 1;
       
//    file = $fopen("E:/chip design competition/IMAGE/resu.txt","w");
//    $readmemh("ram_image.txt",data_img);
    
    #10000
    EPP_DataStrobe0 = 0;
    EPP_AddressStrobe0 = 1;
    EPP_Write0 = 0;
    
    #10000
    EPP_DataStrobe0 = 1;
    EPP_AddressStrobe0 = 0;
    EPP_Write0 = 1;
    
    #10000
    EPP_DataStrobe0 = 1;
    EPP_AddressStrobe0 = 0;
    EPP_Write0 = 0;
    
    #10000
    EPP_DataStrobe0 = 0;
    EPP_AddressStrobe0 = 0;
    EPP_Write0 = 0;
      
    import_img_data;
    #10000
    EPP_DataStrobe0 = 0;
    EPP_AddressStrobe0 = 0;
    EPP_Write0 = 1;
    
    #10000
    EPP_DataStrobe0 = 1;
    EPP_AddressStrobe0 = 1;
    EPP_Write0 = 0;
    
    #10000
    EPP_DataStrobe0 = 1;
    EPP_AddressStrobe0 = 1;
    EPP_Write0 = 1;
  
end

always #CLOCK_FRAME clk_sys=~clk_sys;

task    import_img_data();
    integer k;
    begin    
        for(k=0; k<262144; k=k+1)
            begin
                input_data = data_img[k];    
                # CLOCK_FRAME;
                # CLOCK_FRAME;
            end
    end    
endtask 

assign EPP_Data = (EPP_DataStrobe0==0 && EPP_Write0==0) ? input_data : 7'bzzzzzzz;

// Instantiate the Unit Under Test (UUT)
	sift_top uut (
		.clk_sys(clk_sys), 
		.rst_sys(rst_sys), 
		.EPP_Write0(EPP_Write0), 
		.EPP_DataStrobe0(EPP_DataStrobe0), 
		.EPP_Reset0(EPP_Reset0), 
		.EPP_AddressStrobe0(EPP_AddressStrobe0), 
		.EPP_Data(EPP_Data), 
		.EPP_Interrupt(EPP_Interrupt), 
		.EPP_Wait(EPP_Wait), 
		.led1(led1), 
		.led2(led2)
	);
 
endmodule

