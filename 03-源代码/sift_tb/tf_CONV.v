`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/08 09:37:14
// Design Name: 
// Module Name: tf_CONV
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tf_CONV();

    parameter gf3_1= 48'h00_00_01_01_02_02;
	parameter gf3_2= 48'h00_01_02_03_05_06;
	parameter gf3_3= 48'h01_02_04_08_0c_0d;
	parameter gf3_4= 48'h01_03_08_0f_16_19;
	parameter gf3_5= 48'h02_05_0c_16_20_24;
	parameter gf3_6= 48'h02_06_0d_19_24_29;
 
    reg         clk;
    reg         clk_7x;
    reg         clk_90;
    reg         start_flag;
    reg  [87:0] data[10:0];
    wire [17:0] dout;
    wire        out_en;


    CONV gf3(.clk(clk), .clk_90(clk_90), .clk_7x(clk_7x), .rst(start_flag), .din1(data[0]), .din2(data[1]),
							 .din3(data[2]),.din4(data[3]), .din5(data[4]), .din6(data[5]), .din7(data[6]),
							 .din8(data[7]),.din9(data[8]), .din10(data[9]), .din11(data[10]),
							 .df1_1(gf3_1),
							 .df1_2(gf3_2),.df1_3(gf3_3), .df1_4(gf3_4), .df1_5(gf3_5), .df1_6(gf3_6),
							 .df1_7(gf3_5),.df1_8(gf3_4), .df1_9(gf3_3), .df1_10(gf3_2),
							 .df1_11(gf3_1),
							 .dout(dout),
                             .out_en(out_en));    

	always
	begin
		#2 clk_7x=~clk_7x;
	end
	
	always
	begin
			#10 clk=~clk;
	end
	
	always
	begin	  
	  #10 clk_90=~clk_90;
	end

initial begin
    clk    = 1'b0;
    clk_7x = 1'b0;
    clk_90 = 1'b0;
    start_flag = 1'b0;
    data[0] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[1] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[2] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[3] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[4] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[5] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[6] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[7] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[8] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[9] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    data[10] = 88'h11_11_11_11_11_11_11_11_11_11_11;
    
    #1000
    start_flag = 1'b1;
    
    #20
    data[0] = 88'h22_11_11_11_22_11_11_22_11_11_22;
    data[5] = 88'h22_11_11_11_22_11_11_22_11_11_22;
    data[7] = 88'h22_11_11_11_22_11_11_22_11_11_22;
    
    #20
    data[0] = 88'h22_33_11_33_22_11_33_22_11_33_22;
    data[5] = 88'h22_33_11_33_22_11_33_22_11_33_22;
    data[7] = 88'h22_33_11_33_22_11_33_22_11_33_22;
   
end
    
endmodule
