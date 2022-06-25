`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		din: 串行图像数据
	Output:
		addr: 地址计数器，控制外部图像RAM读写地址，复位完成后递增
		max、min: 关键点的极值
		dout_kp: 关键点KeyPoint flag

		mag, dir: 图像经过计算后得到的梯度和方向，用于后续特征向量
		out_en: 梯度和方向计算输出结果有效

		complete1: 第一张图像（原图）处理完毕
		complete2: 第二张图像（降采样）处理完毕

	Description:	
		SIFT算法中关键点定位的步骤， 3层的差分金字塔可以构建成一个长*宽*3的3维矩阵，
		在中间的那一层中，对每个像素点，考虑其邻域的3x3x3窗口，若其是邻域中的最大值或最小值，
		则其可作为极值点输出，即之后的SIFT关键点。
	Note:
		例化的block2_27extreme模块用于3x3x3窗口缓存，本模块中将窗口数据做比较，确定极值点
		判断该点是否为特征点的第一个过程为判断该点的值是否是 27 个数据中的最大值或者最小值，同时设置一定的阈值，去除低对比度特征点
	Testbench:
		tf_sift_feat, 
		modelsim 中输入命令 do sift_feat_sim.do和do sift_feat_wave.do即可
*/

module sift_feat(
	input clk,
	input clk_90,
	input rst,
	input [7:0] din,
	output [17:0] addr,
	
	//local extreme
	output signed [7:0] max,
	output signed [7:0] min,
	output dout_kp,

	//mag ori
	output [7:0] mag,
	output [5:0] dir,
	output out_en,
	output complete1,
	output complete2		
);
	 
	 
	 wire signed [17:0] gau; 
	 wire [7:0] gau1;
	 wire signed [7:0] diff0;
	 wire signed [7:0] diff1;
	 wire signed [7:0] diff2;
	 wire out_en_dog;

	 wire out_en_kp;
	 
	 wire out_en_dx;
	 
	 wire signed [7:0] dx;
	 wire signed [7:0] dy;
	 
	 wire out_en_mag_dir;
	 

	 
	 //***************************************//

//	dbg_core_2  u_dbg (
//		.data_in_0               ( {rst, kp, out_feat_en, out_en_dx, out_en_kp, out_en_dog, mag[7:0], addr[17:0], din[7:0]} ),
//		.ref_clk_0               ( clk          ),
//		.trig_out_0              (          )
//	);
	 
	 //**************  DoG 计算模块 ************//
	 assign gau1=gau[17:10];
	 
	 DoG U_DoG(
		.clk(clk), .clk_90(clk_90), .rst(rst),
		.din(din),.dout2(gau),
		.diff0(diff0),.diff1(diff1),.diff2(diff2),.out_en(out_en_dog),
		.addr(addr) ,.complete1(complete1) ,.complete2(complete2)
    );

	 //*******************************************//
	 
	 
	 //**************  局部极值点计算模块 ************//
	 
	 local_extreme U_local_extreme(
		.clk(clk),    .rst(out_en_dog), .complete1(complete1),	 .diff0(diff0),	 .diff1(diff1),	.diff2(diff2),
		.max(max),	 .min(min),    .dout(dout_kp),    .out_en(out_en_kp)
    );
	 //*******************************************//
	 
	 
	 //************  x,y 方向的梯度计算模块 **********//
	 mag_calc U_mag_calc(
    	.clk(clk),    .rst(out_en_dog),  .complete1(complete1),    .din(gau1),    .dx(dx),    .dy(dy),    .out_en(out_en_dx)
    );
	 //*******************************************//
	 
	 
	 //**************  梯度和方向计算模块 ************//
	 mag_dir_calc U_mag_dir_calc(
		.clk(clk),    .rst(out_en_dx),  .dx(dx),  .dy(dy),
		.mag(mag),    .dir(dir),    .out_en(out_en_mag_dir)
    );
	 
	 assign out_en = out_en_mag_dir;
	 //*******************************************//

endmodule
