`timescale 1ns / 1ps

/*
	Input:
		时钟、复位
		din1, din2, din3, ...: 并行窗口数据
		k1, k2, k3, k4, k5, k6, k7, k8: 卷积权重参数
	Output:
		dout: 卷积结果输出
		out_en: 输出数据有效
	Description：
		功能上，为1D卷积，即计算两个序列的乘积和；
		结构上输入为两个序列，为10位宽的din1、din2、……、din8数据
		和8位宽的k1、k2、……、k8权重值，输出为21位宽的dout
	Note:
		在卷积运算过程中，需要对窗口数据做乘加操作，因此使用了Fuxi提供的内置DSP IP。
*/

module cov(
		clk, rst, din1, din2, din3, din4, din5, din6, din7, din8,
		k1, k2, k3, k4, k5, k6, k7, k8, dout, dout_en
	);
    
	input        clk;
	input 		 rst;

    input  [9:0] din1;
    input  [9:0] din2;
    input  [9:0] din3;
    input  [9:0] din4;
    input  [9:0] din5;
    input  [9:0] din6;
    input  [9:0] din7;
    input  [9:0] din8;
    input  [7:0] k1;
    input  [7:0] k2;
    input  [7:0] k3;
    input  [7:0] k4;
    input  [7:0] k5;
    input  [7:0] k6;
    input  [7:0] k7;
    input  [7:0] k8;
    output [20:0] dout;
    output 		  dout_en;
	 
	
	wire [18:0] r11_rslt,r12_rslt,r13_rslt,r14_rslt;

	wire [17:0] r1,r2,r3,r4,r5,r6,r7,r8;			//,r9;
	reg [18:0] r11,r12,r13,r14;
	reg [19:0]	r21,r22;
	reg [20:0] r31;


	reg dout_en;
	wire [20:0] dout;  	//reg
	reg [2:0] cnt_en;		//输出使能计数器, pipeline delay，行为仿真延时 3 clock，布线后延时3.5 clock；时钟为50MHz


	assign dout=r31;

	always@(posedge clk or negedge rst)
	begin
	 	if(!rst) begin
			r21<=0;r22<=0;
			r31<=0;
		end
		else begin
			r11 <= r11_rslt;
			r12 <= r12_rslt;
			r13 <= r13_rslt;
			r14 <= r14_rslt;

			r21<=r11+r12;
			r22<=r13+r14;

			r31<=r21+r22;	
		end
	end

	always@(negedge clk or negedge rst)
	begin
		if(!rst) begin
		dout_en<=0;
		cnt_en<=0;
	end
	else begin
		if(cnt_en<2)						 //行为仿真延时
			cnt_en<=cnt_en+1;
		else
			dout_en<=1;
	end
	end
	 

	//乘法器模块，无符号{11{1'b0},al[6:0]}
	mul_new2  U11_mul (
		.clk         (     	clk 		),
		.rstn        (     	rst 		),
		.al          ({8'd0, din1[9:0]} ),
		.cl          ({10'd0, k1[7:0]}  ),

		.au          ({8'd0, din2[9:0]} ),
		.cu          ({10'd0, k2[7:0]} 	),
		.r           ( r11_rslt )
	);


	mul_new2  U12_mul (
		.clk                     ( clk       ),
		.rstn                    ( rst          ),
		.al                      ({8'd0, din3[9:0]} 	),
		.cl                      ({10'd0, k3[7:0]} 		),

		.au                      ({8'd0, din4[9:0]} 	),
		.cu                      ({10'd0, k4[7:0]} 		),

		.r                       ( r12_rslt )
	);
	

	mul_new2  U13_mul (
		.clk                     ( clk       ),
		.rstn                    ( rst          ),
		.al                      ({8'd0, din5[9:0]} 	),
		.cl                      ({10'd0, k5[7:0]} 		),

		.au                      ({8'd0, din6[9:0]} 	),
		.cu                      ({10'd0, k6[7:0]} 		),

		.r                       ( r13_rslt )
	);

	mul_new2  U14_mul (
		.clk                     ( clk       ),
		.rstn                    ( rst          ),
		.al                      ({8'd0, din7[9:0]} 	),
		.cl                      ({10'd0, k7[7:0]} 		),

		.au                      ({8'd0, din8[9:0]} 	),
		.cu                      ({10'd0, k8[7:0]} 		),

		.r                       ( r14_rslt )
	);

	


endmodule
