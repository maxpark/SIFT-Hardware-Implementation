`timescale 1ns / 1ps

/*
	Input:
		时钟、复位
		diff0、diff1、diff2: 高斯差分金字塔串行数据
	Output:
		dout11, dout12, ...: 3x3x3的窗口数据，共27个数据
		out_en: 输出有效

	Description:	
		3层的差分金字塔可以构建成一个长*宽*高均为3的3D矩阵，
		构造3*3*3的窗口
*/

module block2_27extreme(
    input clk,
    input rst,
    input signed[7:0] diff0,
    input signed[7:0] diff1,
    input signed[7:0] diff2,
	input complete1,
    
	output signed[7:0] dout11,
    output signed[7:0] dout12,
    output signed[7:0] dout13,
    output signed[7:0] dout14,
    output signed[7:0] dout15,
    output signed[7:0] dout16,
    output signed[7:0] dout17,
    output signed[7:0] dout18,
    output signed[7:0] dout19,
    output signed[7:0] dout21,
    output signed[7:0] dout22,
    output signed[7:0] dout23,
    output signed[7:0] dout24,
    output signed[7:0] dout25,
    output signed[7:0] dout26,
    output signed[7:0] dout27,
    output signed[7:0] dout28,
    output signed[7:0] dout29,
    output signed[7:0] dout31,
    output signed[7:0] dout32,
    output signed[7:0] dout33,
    output signed[7:0] dout34,
    output signed[7:0] dout35,
    output signed[7:0] dout36,
    output signed[7:0] dout37,
    output signed[7:0] dout38,
    output signed[7:0] dout39,
	output out_en
);
	 
	 
	wire signed [7:0] dout11_1,dout12_1,dout13_1,dout14_1,dout15_1,dout16_1,dout17_1,dout18_1,dout19_1;//dout11_1,
	wire signed [7:0] dout21_1,dout22_1,dout23_1,dout24_1,dout25_1,dout26_1,dout27_1,dout28_1,dout29_1;
	wire signed [7:0] dout31_1,dout32_1,dout33_1,dout34_1,dout35_1,dout36_1,dout37_1,dout38_1,dout39_1;
	
	wire signed [7:0] dout11_2,dout12_2,dout13_2,dout14_2,dout15_2,dout16_2,dout17_2,dout18_2,dout19_2;//dout11_2,
	wire signed [7:0] dout21_2,dout22_2,dout23_2,dout24_2,dout25_2,dout26_2,dout27_2,dout28_2,dout29_2;
	wire signed [7:0] dout31_2,dout32_2,dout33_2,dout34_2,dout35_2,dout36_2,dout37_2,dout38_2,dout39_2;
	
	wire out_en_1;
	wire out_en_2;
	
	/* 第一组 */
	block3x3 blk2_1(.clk(clk), .rst(rst), .din(diff0), .dout1(dout11_1), .dout2(dout12_1), .dout3(dout13_1), 
						 .dout4(dout14_1), .dout5(dout15_1), .dout6(dout16_1), .dout7(dout17_1), 
                   .dout8(dout18_1), .dout9(dout19_1), .start_flag(out_en_1));

    block3x3 blk2_2(.clk(clk), .rst(rst), .din(diff1), .dout1(dout21_1), .dout2(dout22_1), .dout3(dout23_1), 
						 .dout4(dout24_1), .dout5(dout25_1), .dout6(dout26_1), .dout7(dout27_1), 
                   .dout8(dout28_1), .dout9(dout29_1));
						 
    block3x3 blk2_3(.clk(clk), .rst(rst), .din(diff2), .dout1(dout31_1), .dout2(dout32_1), .dout3(dout33_1), 
						 .dout4(dout34_1), .dout5(dout35_1), .dout6(dout36_1), .dout7(dout37_1), 
                   .dout8(dout38_1), .dout9(dout39_1));	


	/* 第二组 */
	block3x3_2 blk2_4(.clk(clk), .rst(rst), .din(diff0), .dout1(dout11_2), .dout2(dout12_2), .dout3(dout13_2), 
						 .dout4(dout14_2), .dout5(dout15_2), .dout6(dout16_2), .dout7(dout17_2), 
                   .dout8(dout18_2), .dout9(dout19_2), .start_flag(out_en_2));
						 
						 
	block3x3_2 blk2_5(.clk(clk), .rst(rst), .din(diff1), .dout1(dout21_2), .dout2(dout22_2), .dout3(dout23_2), 
						 .dout4(dout24_2), .dout5(dout25_2), .dout6(dout26_2), .dout7(dout27_2), 
                   .dout8(dout28_2), .dout9(dout29_2));					 
	
	block3x3_2 blk2_6(.clk(clk), .rst(rst), .din(diff2), .dout1(dout31_2), .dout2(dout32_2), .dout3(dout33_2), 
						 .dout4(dout34_2), .dout5(dout35_2), .dout6(dout36_2), .dout7(dout37_2), 
                   .dout8(dout38_2), .dout9(dout39_2));
						 
	assign out_en=complete1?out_en_2:out_en_1;					 
						 
    assign dout11=complete1?dout11_2:dout11_1;
	assign dout12=complete1?dout12_2:dout12_1;
	assign dout13=complete1?dout13_2:dout13_1;
	assign dout14=complete1?dout14_2:dout14_1;
	assign dout15=complete1?dout15_2:dout15_1;
	assign dout16=complete1?dout16_2:dout16_1;
	assign dout17=complete1?dout17_2:dout17_1;
	assign dout18=complete1?dout18_2:dout18_1;
	assign dout19=complete1?dout19_2:dout19_1;
	
	assign dout21=complete1?dout21_2:dout21_1;
	assign dout22=complete1?dout22_2:dout22_1;
	assign dout23=complete1?dout23_2:dout23_1;
	assign dout24=complete1?dout24_2:dout24_1;
	assign dout25=complete1?dout25_2:dout25_1;
	assign dout26=complete1?dout26_2:dout26_1;
	assign dout27=complete1?dout27_2:dout27_1;
	assign dout28=complete1?dout28_2:dout28_1;
	assign dout29=complete1?dout29_2:dout29_1;
	
	assign dout31=complete1?dout31_2:dout31_1;
	assign dout32=complete1?dout32_2:dout32_1;
	assign dout33=complete1?dout33_2:dout33_1;
	assign dout34=complete1?dout34_2:dout34_1;
	assign dout35=complete1?dout35_2:dout35_1;
	assign dout36=complete1?dout36_2:dout36_1;
	assign dout37=complete1?dout37_2:dout37_1;
	assign dout38=complete1?dout38_2:dout38_1;
	assign dout39=complete1?dout39_2:dout39_1;
						 
endmodule
