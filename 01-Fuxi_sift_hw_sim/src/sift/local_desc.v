`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		addr_kp: 关键点在图像中的坐标
		mag_in: 梯度幅值输入
		dir_in: 梯度方向输入
		main_dir: 主方向
	Output:
		tdesc1, tdesc2, tdesc3, ...: 特征描述向量
		local_desc_addr: 梯度幅值和方向的RAM地址控制
		out_en: 输出有效标志位
	Description:	
		local_desc模块包含了：36方向转8方向计算模块dir36to8、旋转窗口地址计算window_rotate和局部描述向量计算模块。
*/

module local_desc(
		input clk,
		input rst,
		input [17:0] addr_kp,
		input [7:0] mag,
		input [5:0] dir,
		input [5:0] main_dir,
		input complete1,
		output [17:0] local_desc_addr,
		output [63:0] tdesc1,
		output [63:0] tdesc2,
		output [63:0] tdesc3,
		output [63:0] tdesc4,
		output [63:0] tdesc5, 
		output [63:0] tdesc6,
		output [63:0] tdesc7,
		output [63:0] tdesc8,
		output [63:0] tdesc9,
		output [63:0] tdesc10,
		output [63:0] tdesc11,
		output [63:0] tdesc12,
		output [63:0] tdesc13,
		output [63:0] tdesc14,
		output [63:0] tdesc15,
		output [63:0] tdesc16,
		output reg out_en
    );
	  
	reg [7:0] cnt_init;    //超前一个周期
	reg [7:0] cnt;         //当前状态计数器,ROM地址
	reg [7:0] cnt_d1;      //延时一个周期
	reg [7:0] cnt_d2;		//延时一个周期
	reg [7:0] cnt_d3;		//延时一个周期
	
	wire [7:0] spo;			//ROM输出
	wire [2:0] dir_r;		//旋转变换后的方向
	reg [2:0] dir_d1;		//延时
	reg [2:0] dir_d2;		//延时
	
	
	wire [15:0] t1;
	wire [13:0] mul_tmp;  	// gaussian核参数卷积
	
	wire [3:0] cnt1;  		//4x4窗口划分
	wire [3:0] cnt2;
	wire rg1,rg2,rg3,rg4;
	
	assign mul_tmp=t1[13:0];
	
	//************** GAUSSIAN 权重 ROM **************//
	local_gau_rom U_local_coe (
			.a(cnt_d3), 				// input [7 : 0] a
			.spo(spo) 					// output [7 : 0] spo
	);

	 //**************  加权乘积硬核乘法器******************//	 
	 mul_desc U_mag_mul(
		.clk		(clk), 
		.rstn		(rst),
		.r			(t1), 
		.al			(mag), 
		.cl			(spo)
	);

	//***********  4x4 子区域分割     ************//
	assign cnt1=cnt_d3[3:0];   //列数
	assign cnt2=cnt_d3[7:4];   //行数
	
	assign rg1=(cnt2>7);  assign rg2=((cnt2>3)&&(cnt2<8))||((cnt2>11)&&(cnt2<=15));
	assign rg3=(cnt1>7);  assign rg4=((cnt1>3)&&(cnt1<8))||((cnt1>11)&&(cnt1<=15));

	
	//*************   方向旋转，36个方向转换成8个局部描述方向  ***************//

	dir36to8 U_dir_trans(
		.dir_in(dir),
		.dir_main(main_dir),
		.dir_out(dir_r)
	);
	
	
	//*************  旋转窗口地址计算 ************************//
	window_rotate U_window_rotate(
		.clk(clk),
		.rst(rst),
		.main_dir(main_dir),
		.kp_addr(addr_kp),
		.cnt(cnt_init),
		.complete1(complete1),
		.addr_out(local_desc_addr)
    );
	
	//***************  生成描述向量   ****************//
	reg [17:0] hist0[7:0];
	reg [17:0] hist1[7:0];
	reg [17:0] hist2[7:0];
	reg [17:0] hist3[7:0];
	reg [17:0] hist4[7:0];
	reg [17:0] hist5[7:0];
	reg [17:0] hist6[7:0];
	reg [17:0] hist7[7:0];
	reg [17:0] hist8[7:0];
	reg [17:0] hist9[7:0];
	reg [17:0] hist10[7:0];
	reg [17:0] hist11[7:0];
	reg [17:0] hist12[7:0];
	reg [17:0] hist13[7:0];
	reg [17:0] hist14[7:0];
	reg [17:0] hist15[7:0];
	
	reg [17:0] max;
	
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			out_en<=0;
			cnt_init<=0;
			cnt<=0;
			cnt_d1<=0;
			cnt_d2<=0;
			cnt_d3<=0;
			hist0[0]<=0;hist1[0]<=0;hist2[0]<=0;hist3[0]<=0;
			hist4[0]<=0;hist5[0]<=0;hist6[0]<=0;hist7[0]<=0;
			hist8[0]<=0;hist9[0]<=0;hist10[0]<=0;hist11[0]<=0;
			hist12[0]<=0;hist13[0]<=0;hist14[0]<=0;hist15[0]<=0;
			
			hist0[1]<=0;hist1[1]<=0;hist2[1]<=0;hist3[1]<=0;
			hist4[1]<=0;hist5[1]<=0;hist6[1]<=0;hist7[1]<=0;
			hist8[1]<=0;hist9[1]<=0;hist10[1]<=0;hist11[1]<=0;
			hist12[1]<=0;hist13[1]<=0;hist14[1]<=0;hist15[1]<=0;
			
			hist0[2]<=0;hist1[2]<=0;hist2[2]<=0;hist3[2]<=0;
			hist4[2]<=0;hist5[2]<=0;hist6[2]<=0;hist7[2]<=0;
			hist8[2]<=0;hist9[2]<=0;hist10[2]<=0;hist11[2]<=0;
			hist12[2]<=0;hist13[2]<=0;hist14[2]<=0;hist15[2]<=0;
			
			hist0[3]<=0;hist1[3]<=0;hist2[3]<=0;hist3[3]<=0;
			hist4[3]<=0;hist5[3]<=0;hist6[3]<=0;hist7[3]<=0;
			hist8[3]<=0;hist9[3]<=0;hist10[3]<=0;hist11[3]<=0;
			hist12[3]<=0;hist13[3]<=0;hist14[3]<=0;hist15[3]<=0;
			
			hist0[4]<=0;hist1[4]<=0;hist2[4]<=0;hist3[4]<=0;
			hist4[4]<=0;hist5[4]<=0;hist6[4]<=0;hist7[4]<=0;
			hist8[4]<=0;hist9[4]<=0;hist10[4]<=0;hist11[4]<=0;
			hist12[4]<=0;hist13[4]<=0;hist14[4]<=0;hist15[4]<=0;
			
			hist0[5]<=0;hist1[5]<=0;hist2[5]<=0;hist3[5]<=0;
			hist4[5]<=0;hist5[5]<=0;hist6[5]<=0;hist7[5]<=0;
			hist8[5]<=0;hist9[5]<=0;hist10[5]<=0;hist11[5]<=0;
			hist12[5]<=0;hist13[5]<=0;hist14[5]<=0;hist15[5]<=0;
			
			hist0[6]<=0;hist1[6]<=0;hist2[6]<=0;hist3[6]<=0;
			hist4[6]<=0;hist5[6]<=0;hist6[6]<=0;hist7[6]<=0;
			hist8[6]<=0;hist9[6]<=0;hist10[6]<=0;hist11[6]<=0;
			hist12[6]<=0;hist13[6]<=0;hist14[6]<=0;hist15[6]<=0;
			
			hist0[7]<=0;hist1[7]<=0;hist2[7]<=0;hist3[7]<=0;
			hist4[7]<=0;hist5[7]<=0;hist6[7]<=0;hist7[7]<=0;
			hist8[7]<=0;hist9[7]<=0;hist10[7]<=0;hist11[7]<=0;
			hist12[7]<=0;hist13[7]<=0;hist14[7]<=0;hist15[7]<=0;
		end
		else
		begin

			dir_d1<=dir_r;
			dir_d2<=dir_d1;		//重新确定延时
			
			cnt<=cnt_init;
			cnt_d1<=cnt;
			cnt_d2<=cnt_d1;
			cnt_d3<=cnt_d2;
			
			if(cnt_init<255)
			begin
				cnt_init<=cnt_init+1;
				case({rg1,rg2,rg3,rg4})
					4'b0000:begin
							case(dir_d1)			//1228 修改，修改地址计算后重新确定时序  //dir_d2
								0:hist0[0]<=hist0[0]+mul_tmp;
								1:hist0[1]<=hist0[1]+mul_tmp;
								2:hist0[2]<=hist0[2]+mul_tmp;
								3:hist0[3]<=hist0[3]+mul_tmp;
								4:hist0[4]<=hist0[4]+mul_tmp;
								5:hist0[5]<=hist0[5]+mul_tmp;
								6:hist0[6]<=hist0[6]+mul_tmp;
								7:hist0[7]<=hist0[7]+mul_tmp;
							endcase
						end
					4'b0001:begin
							case(dir_d1)
								0:hist1[0]<=hist1[0]+mul_tmp;
								1:hist1[1]<=hist1[1]+mul_tmp;
								2:hist1[2]<=hist1[2]+mul_tmp;
								3:hist1[3]<=hist1[3]+mul_tmp;
								4:hist1[4]<=hist1[4]+mul_tmp;
								5:hist1[5]<=hist1[5]+mul_tmp;
								6:hist1[6]<=hist1[6]+mul_tmp;
								7:hist1[7]<=hist1[7]+mul_tmp;
							endcase
						end
					4'b0010:begin
							case(dir_d1)
								0:hist2[0]<=hist2[0]+mul_tmp;
								1:hist2[1]<=hist2[1]+mul_tmp;
								2:hist2[2]<=hist2[2]+mul_tmp;
								3:hist2[3]<=hist2[3]+mul_tmp;
								4:hist2[4]<=hist2[4]+mul_tmp;
								5:hist2[5]<=hist2[5]+mul_tmp;
								6:hist2[6]<=hist2[6]+mul_tmp;
								7:hist2[7]<=hist2[7]+mul_tmp;
							endcase
						end
					4'b0011:begin
							case(dir_d1)
								0:hist3[0]<=hist3[0]+mul_tmp;
								1:hist3[1]<=hist3[1]+mul_tmp;
								2:hist3[2]<=hist3[2]+mul_tmp;
								3:hist3[3]<=hist3[3]+mul_tmp;
								4:hist3[4]<=hist3[4]+mul_tmp;
								5:hist3[5]<=hist3[5]+mul_tmp;
								6:hist3[6]<=hist3[6]+mul_tmp;
								7:hist3[7]<=hist3[7]+mul_tmp;
							endcase
						end
					4'b0100:begin
							case(dir_d1)
								0:hist4[0]<=hist4[0]+mul_tmp;
								1:hist4[1]<=hist4[1]+mul_tmp;
								2:hist4[2]<=hist4[2]+mul_tmp;
								3:hist4[3]<=hist4[3]+mul_tmp;
								4:hist4[4]<=hist4[4]+mul_tmp;
								5:hist4[5]<=hist4[5]+mul_tmp;
								6:hist4[6]<=hist4[6]+mul_tmp;
								7:hist4[7]<=hist4[7]+mul_tmp;
							endcase
						end
					4'b0101:begin
							case(dir_d1)
								0:hist5[0]<=hist5[0]+mul_tmp;
								1:hist5[1]<=hist5[1]+mul_tmp;
								2:hist5[2]<=hist5[2]+mul_tmp;
								3:hist5[3]<=hist5[3]+mul_tmp;
								4:hist5[4]<=hist5[4]+mul_tmp;
								5:hist5[5]<=hist5[5]+mul_tmp;
								6:hist5[6]<=hist5[6]+mul_tmp;
								7:hist5[7]<=hist5[7]+mul_tmp;
							endcase
						end
					4'b0110:begin
							case(dir_d1)
								0:hist6[0]<=hist6[0]+mul_tmp;
								1:hist6[1]<=hist6[1]+mul_tmp;
								2:hist6[2]<=hist6[2]+mul_tmp;
								3:hist6[3]<=hist6[3]+mul_tmp;
								4:hist6[4]<=hist6[4]+mul_tmp;
								5:hist6[5]<=hist6[5]+mul_tmp;
								6:hist6[6]<=hist6[6]+mul_tmp;
								7:hist6[7]<=hist6[7]+mul_tmp;
							endcase
						end
					4'b0111:begin
							case(dir_d1)
								0:hist7[0]<=hist7[0]+mul_tmp;
								1:hist7[1]<=hist7[1]+mul_tmp;
								2:hist7[2]<=hist7[2]+mul_tmp;
								3:hist7[3]<=hist7[3]+mul_tmp;
								4:hist7[4]<=hist7[4]+mul_tmp;
								5:hist7[5]<=hist7[5]+mul_tmp;
								6:hist7[6]<=hist7[6]+mul_tmp;
								7:hist7[7]<=hist7[7]+mul_tmp;
							endcase
						end
					4'b1000:begin
							case(dir_d1)
								0:hist8[0]<=hist8[0]+mul_tmp;
								1:hist8[1]<=hist8[1]+mul_tmp;
								2:hist8[2]<=hist8[2]+mul_tmp;
								3:hist8[3]<=hist8[3]+mul_tmp;
								4:hist8[4]<=hist8[4]+mul_tmp;
								5:hist8[5]<=hist8[5]+mul_tmp;
								6:hist8[6]<=hist8[6]+mul_tmp;
								7:hist8[7]<=hist8[7]+mul_tmp;
							endcase
						end
					4'b1001:begin
							case(dir_d1)
								0:hist9[0]<=hist9[0]+mul_tmp;
								1:hist9[1]<=hist9[1]+mul_tmp;
								2:hist9[2]<=hist9[2]+mul_tmp;
								3:hist9[3]<=hist9[3]+mul_tmp;
								4:hist9[4]<=hist9[4]+mul_tmp;
								5:hist9[5]<=hist9[5]+mul_tmp;
								6:hist9[6]<=hist9[6]+mul_tmp;
								7:hist9[7]<=hist9[7]+mul_tmp;
							endcase
						end
					4'b1010:begin
							case(dir_d1)
								0:hist10[0]<=hist10[0]+mul_tmp;
								1:hist10[1]<=hist10[1]+mul_tmp;
								2:hist10[2]<=hist10[2]+mul_tmp;
								3:hist10[3]<=hist10[3]+mul_tmp;
								4:hist10[4]<=hist10[4]+mul_tmp;
								5:hist10[5]<=hist10[5]+mul_tmp;
								6:hist10[6]<=hist10[6]+mul_tmp;
								7:hist10[7]<=hist10[7]+mul_tmp;
							endcase
						end
					4'b1011:begin
							case(dir_d1)
								0:hist11[0]<=hist11[0]+mul_tmp;
								1:hist11[1]<=hist11[1]+mul_tmp;
								2:hist11[2]<=hist11[2]+mul_tmp;
								3:hist11[3]<=hist11[3]+mul_tmp;
								4:hist11[4]<=hist11[4]+mul_tmp;
								5:hist11[5]<=hist11[5]+mul_tmp;
								6:hist11[6]<=hist11[6]+mul_tmp;
								7:hist11[7]<=hist11[7]+mul_tmp;
							endcase
						end
					4'b1100:begin
							case(dir_d1)
								0:hist12[0]<=hist12[0]+mul_tmp;
								1:hist12[1]<=hist12[1]+mul_tmp;
								2:hist12[2]<=hist12[2]+mul_tmp;
								3:hist12[3]<=hist12[3]+mul_tmp;
								4:hist12[4]<=hist12[4]+mul_tmp;
								5:hist12[5]<=hist12[5]+mul_tmp;
								6:hist12[6]<=hist12[6]+mul_tmp;
								7:hist12[7]<=hist12[7]+mul_tmp;
							endcase
						end
					4'b1101:begin
							case(dir_d1)
								0:hist13[0]<=hist13[0]+mul_tmp;
								1:hist13[1]<=hist13[1]+mul_tmp;
								2:hist13[2]<=hist13[2]+mul_tmp;
								3:hist13[3]<=hist13[3]+mul_tmp;
								4:hist13[4]<=hist13[4]+mul_tmp;
								5:hist13[5]<=hist13[5]+mul_tmp;
								6:hist13[6]<=hist13[6]+mul_tmp;
								7:hist13[7]<=hist13[7]+mul_tmp;
							endcase
						end
					4'b1110:begin
							case(dir_d1)
								0:hist14[0]<=hist14[0]+mul_tmp;
								1:hist14[1]<=hist14[1]+mul_tmp;
								2:hist14[2]<=hist14[2]+mul_tmp;
								3:hist14[3]<=hist14[3]+mul_tmp;
								4:hist14[4]<=hist14[4]+mul_tmp;
								5:hist14[5]<=hist14[5]+mul_tmp;
								6:hist14[6]<=hist14[6]+mul_tmp;
								7:hist14[7]<=hist14[7]+mul_tmp;
							endcase
						end
					4'b1111:begin
							case(dir_d1)
								0:hist15[0]<=hist15[0]+mul_tmp;
								1:hist15[1]<=hist15[1]+mul_tmp;
								2:hist15[2]<=hist15[2]+mul_tmp;
								3:hist15[3]<=hist15[3]+mul_tmp;
								4:hist15[4]<=hist15[4]+mul_tmp;
								5:hist15[5]<=hist15[5]+mul_tmp;
								6:hist15[6]<=hist15[6]+mul_tmp;
								7:hist15[7]<=hist15[7]+mul_tmp;
							endcase
						end
				endcase
			end
			else
			begin
				cnt_init<=255;
				out_en<=1;
				
			end
		end
	end

	 assign tdesc1={hist0[0][9:2],hist0[1][9:2],hist0[2][9:2],hist0[3][9:2],hist0[4][9:2],hist0[5][9:2],hist0[6][9:2],hist0[7][9:2]};
	 assign tdesc2={hist1[0][9:2],hist1[1][9:2],hist1[2][9:2],hist1[3][9:2],hist1[4][9:2],hist1[5][9:2],hist1[6][9:2],hist1[7][9:2]};
	 assign tdesc3={hist2[0][9:2],hist2[1][9:2],hist2[2][9:2],hist2[3][9:2],hist2[4][9:2],hist2[5][9:2],hist2[6][9:2],hist2[7][9:2]};
	 assign tdesc4={hist3[0][9:2],hist3[1][9:2],hist3[2][9:2],hist3[3][9:2],hist3[4][9:2],hist3[5][9:2],hist3[6][9:2],hist3[7][9:2]};
	 assign tdesc5={hist4[0][9:2],hist4[1][9:2],hist4[2][9:2],hist4[3][9:2],hist4[4][9:2],hist4[5][9:2],hist4[6][9:2],hist4[7][9:2]};
	 assign tdesc6={hist5[0][9:2],hist5[1][9:2],hist5[2][9:2],hist5[3][9:2],hist5[4][9:2],hist5[5][9:2],hist5[6][9:2],hist5[7][9:2]};
	 assign tdesc7={hist6[0][9:2],hist6[1][9:2],hist6[2][9:2],hist6[3][9:2],hist6[4][9:2],hist6[5][9:2],hist6[6][9:2],hist6[7][9:2]};
	 assign tdesc8={hist7[0][9:2],hist7[1][9:2],hist7[2][9:2],hist7[3][9:2],hist7[4][9:2],hist7[5][9:2],hist7[6][9:2],hist7[7][9:2]};
	 assign tdesc9={hist8[0][9:2],hist8[1][9:2],hist8[2][9:2],hist8[3][9:2],hist8[4][9:2],hist8[5][9:2],hist8[6][9:2],hist8[7][9:2]};
	 assign tdesc10={hist9[0][9:2],hist9[1][9:2],hist9[2][9:2],hist9[3][9:2],hist9[4][9:2],hist9[5][9:2],hist9[6][9:2],hist9[7][9:2]};
	 assign tdesc11={hist10[0][9:2],hist10[1][9:2],hist10[2][9:2],hist10[3][9:2],hist10[4][9:2],hist10[5][9:2],hist10[6][9:2],hist10[7][9:2]};
	 assign tdesc12={hist11[0][9:2],hist11[1][9:2],hist11[2][9:2],hist11[3][9:2],hist11[4][9:2],hist11[5][9:2],hist11[6][9:2],hist11[7][9:2]};
	 assign tdesc13={hist12[0][9:2],hist12[1][9:2],hist12[2][9:2],hist12[3][9:2],hist12[4][9:2],hist12[5][9:2],hist12[6][9:2],hist12[7][9:2]};
	 assign tdesc14={hist13[0][9:2],hist13[1][9:2],hist13[2][9:2],hist13[3][9:2],hist13[4][9:2],hist13[5][9:2],hist13[6][9:2],hist13[7][9:2]};
	 assign tdesc15={hist14[0][9:2],hist14[1][9:2],hist14[2][9:2],hist14[3][9:2],hist14[4][9:2],hist14[5][9:2],hist14[6][9:2],hist14[7][9:2]};
	 assign tdesc16={hist15[0][9:2],hist15[1][9:2],hist15[2][9:2],hist15[3][9:2],hist15[4][9:2],hist15[5][9:2],hist15[6][9:2],hist15[7][9:2]};



endmodule
