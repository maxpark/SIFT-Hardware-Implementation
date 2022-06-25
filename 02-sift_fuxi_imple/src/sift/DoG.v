`timescale 1ns / 1ps

/*
	Input:
		时钟, 复位
		din: 串行图像数据
	Output:
		addr: 地址计数器，控制外部图像RAM读写地址，复位完成后递增
		
		dout1、dout2、dout3、dout4: 4层的高斯金字塔结果
		diff0、diff1、diff2: 3层的差分金字塔
		out_en: 输出有效
		
		complete1: 第一张图像（原图）处理完毕
		complete2: 第二张图像（降采样）处理完毕
	Description:	
		用于创建SIFT算法所需要的4层的高斯金字塔和3层的差分金字塔。
		4层的高斯金字塔，采用了方差递增的4个11x11的高斯模板处理后的4个图像；
		3层的高斯差分金字塔即上述4层高斯金字塔相邻两层之间作差，所得到的图像。
	Note:	
		DoG模块: 包含了窗口生成器, 二维卷积模块, 最后输出得到高斯滤波结果。
*/

module DoG(
		input clk,
		input rst,
		input [7:0] din,
		output [17:0] dout1,
		output [17:0] dout2,
		output [17:0] dout3,
		output [17:0] dout4,
		output signed [7:0] diff0,
		output signed [7:0] diff1,
		output signed [7:0] diff2,
		output out_en,
		output [20:0] addr,
		output complete1,
		output complete2
    );
	
	wire start_flag;
	wire [87:0] data[10:0];
	
	wire [87:0] data1[10:0];
	wire [87:0] data2[10:0];

	///**********************  不同尺度的高斯滤波器参数  ***************************//
	 parameter zero = 88'h00_00_00_00_00_00_00_00_00_00_00;

	 //gf3
	 parameter gf3_1= 48'h00_00_01_01_02_02;
	 parameter gf3_2= 48'h00_01_02_03_05_06;
	 parameter gf3_3= 48'h01_02_04_08_0c_0d;
	 parameter gf3_4= 48'h01_03_08_0f_16_19;
	 parameter gf3_5= 48'h02_05_0c_16_20_24;
	 parameter gf3_6= 48'h02_06_0d_19_24_29;
	 ////gf2
	 parameter gf2_2= 48'h00_00_00_01_02_03;
	 parameter gf2_3= 48'h00_00_02_05_09_0b;
	 parameter gf2_4= 48'h00_01_05_0d_18_1d;
	 parameter gf2_5= 48'h00_02_09_18_2b_34;
	 parameter gf2_6= 48'h00_03_0b_1d_34_40;
	 ////gf1
	 parameter gf1_2= 48'h00_00_00_00_01_01;
	 parameter gf1_3= 48'h00_00_00_02_05_07;
	 parameter gf1_4= 48'h00_00_02_09_16_1e;
	 parameter gf1_5= 48'h00_01_05_16_35_48;
	 parameter gf1_6= 48'h00_01_07_1e_48_60;
	 ////gf0
	 parameter gf0_3= 48'h00_00_00_01_02_03;
	 parameter gf0_4= 48'h00_00_01_05_11_1a;
	 parameter gf0_5= 48'h00_00_02_11_3b_59;
	 parameter gf0_6= 48'h00_00_03_1a_59_87;

	 
	 
	 //************第一，第二组 控制器 ************************//
	 wire [20:0] addr1;
	 wire [20:0] addr2;
	 
	 wire start_flag1;
	 wire start_flag2;
	 
	 
	 assign addr = complete1 ? addr2 : addr1;
	 assign start_flag = complete1 ? start_flag2 : start_flag1;

	//******************* 11x11窗口选择模块  ********************//
	block11x11 blk1(
			.clk(clk), .rst(rst), .din(din), .dout1(data1[0]), .dout2(data1[1]), .dout3(data1[2]),
			.dout4(data1[3]), .dout5(data1[4]), .dout6(data1[5]), .dout7(data1[6]), 
			.dout8(data1[7]), .dout9(data1[8]), .dout10(data1[9]), .dout11(data1[10]), 
			.start_flag(start_flag1) ,.cnt(addr1), .complete(complete1)
			);//  ////测试第二组
						 
   	block11x11_2 blk2(
		   .clk(clk), .rst(complete1), .din(din), .dout1(data2[0]), .dout2(data2[1]), .dout3(data2[2]),	
		   .dout4(data2[3]), .dout5(data2[4]), .dout6(data2[5]), .dout7(data2[6]), 
           .dout8(data2[7]), .dout9(data2[8]), .dout10(data2[9]), .dout11(data2[10]), 
		   .start_flag(start_flag2) ,.cnt(addr2) ,.complete(complete2)
		   );

	assign data[0]=complete1?data2[0]:data1[0];
	assign data[1]=complete1?data2[1]:data1[1];
	assign data[2]=complete1?data2[2]:data1[2];
	assign data[3]=complete1?data2[3]:data1[3];
	assign data[4]=complete1?data2[4]:data1[4];
	assign data[5]=complete1?data2[5]:data1[5];
	assign data[6]=complete1?data2[6]:data1[6];
	assign data[7]=complete1?data2[7]:data1[7];
	assign data[8]=complete1?data2[8]:data1[8];
	assign data[9]=complete1?data2[9]:data1[9];
	assign data[10]=complete1?data2[10]:data1[10];
	
	//************************ 卷积模块 *************************//
	CONV gf0(.clk(clk), .rst(start_flag), .din1(data[0]), .din2(data[1]),
								 .din3(data[2]),.din4(data[3]), .din5(data[4]), .din6(data[5]), .din7(data[6]),
								 .din8(data[7]),.din9(data[8]), .din10(data[9]), .din11(data[10]),
								 .df1_1(zero), .df1_2(zero),
								 .df1_3(gf0_3), .df1_4(gf0_4), .df1_5(gf0_5), .df1_6(gf0_6), 
								 .df1_7(gf0_5), .df1_8(gf0_4), .df1_9(gf0_3),
								 .df1_10(zero), .df1_11(zero), 
								 .dout(dout1));
								 
	CONV gf1(.clk(clk), .rst(start_flag), .din1(data[0]), .din2(data[1]),
								 .din3(data[2]),.din4(data[3]), .din5(data[4]), .din6(data[5]), .din7(data[6]),
								 .din8(data[7]),.din9(data[8]), .din10(data[9]), .din11(data[10]),
								 .df1_1(zero), 
								 .df1_2(gf1_2),.df1_3(gf1_3), .df1_4(gf1_4), .df1_5(gf1_5), .df1_6(gf1_6),
								 .df1_7(gf1_5),.df1_8(gf1_4), .df1_9(gf1_3), .df1_10(gf1_2),
								 .df1_11(zero),
								 .dout(dout2),.out_en(out_en));
								 
	CONV gf2(.clk(clk), .rst(start_flag), .din1(data[0]), .din2(data[1]),
								 .din3(data[2]),.din4(data[3]), .din5(data[4]), .din6(data[5]), .din7(data[6]),
								 .din8(data[7]),.din9(data[8]), .din10(data[9]), .din11(data[10]),
								 .df1_1(zero),
								 .df1_2(gf2_2),.df1_3(gf2_3), .df1_4(gf2_4), .df1_5(gf2_5), .df1_6(gf2_6),
								 .df1_7(gf2_5),.df1_8(gf2_4), .df1_9(gf2_3), .df1_10(gf2_2),
								 .df1_11(zero),
								 .dout(dout3));
								 
	CONV gf3(.clk(clk), .rst(start_flag), .din1(data[0]), .din2(data[1]),
								 .din3(data[2]),.din4(data[3]), .din5(data[4]), .din6(data[5]), .din7(data[6]),
								 .din8(data[7]),.din9(data[8]), .din10(data[9]), .din11(data[10]),
								 .df1_1(gf3_1),
								 .df1_2(gf3_2),.df1_3(gf3_3), .df1_4(gf3_4), .df1_5(gf3_5), .df1_6(gf3_6),
								 .df1_7(gf3_5),.df1_8(gf3_4), .df1_9(gf3_3), .df1_10(gf3_2),
								 .df1_11(gf3_1),
								 .dout(dout4));

	assign diff0=(dout2-dout1)>>10;
	assign diff1=(dout3-dout2)>>10;
	assign diff2=(dout4-dout3)>>10;
	
endmodule
