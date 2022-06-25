`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		din: 串行图像梯度和方向，关键点信号
		addr_kp_in: 关键点在图像中的坐标
		mag_in: 梯度幅值输入
		dir_in: 梯度方向输入
	Output:
		addr_kp_out: 关键点RAM
		addr_dir_out: 方向RAM地址控制
		addr_grad_out: 大小RAM地址控制
		desc_out: 关键点的1024位描述向量，以及其在RAM中的地址
		desc_complete: 特征向量计算完成
	Description:	
		特征向量计算模块，首先提取主方向，再计算特征向量。
		两个模块串行计算，均需要方向和梯度大小，因此使用main_ori_complete信号做地址控制
		main_ori模块计算得到主方向后，local_desc模块生成特征描述向量。
		local_desc模块包含了：36方向转8方向计算模块、窗口旋转模块和局部描述向量计算模块。
*/
module sift_desc(
    input clk,
    input rst,
	input  [7:0] mag_in,
	input  [7:0] dir_in,
	input  [17:0] addr_kp_in, 
	output [9:0] addr_kp_out,
	output [17:0] addr_grad_out,
	output [17:0] addr_dir_out,
	output [1023:0] desc_out,
	output desc_complete,
	output reg complete1,
	output reg complete2,
	output [5:0] main_dir
);
	 
//*********   main_ori和Local_desc 模块信号***********//
//	检测到极值点后，main_ori复位rst_main_ori置高，开始主方向计算
//	完成主方向计算后，main_ori_complete置高
//	此时，local_desc复位rst_lcoal_desc置高
//  完成描述向量计算后，local_desc_complete信号置高
//	此时完成一个特征点的描述向量计算，复位rst_main_ori

	 wire main_ori_complete;	//主方向计算完成标志
//	 wire desc_complete;			//描述向量完成标志
	 wire rst_main_ori;			//主方向复位信号
	 wire rst_local_desc;		//描述向量复位信号
	 
	 reg test_desc_complete;	//测试信号，代替第二部分的完成信号
	 
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
	 
	 wire [7:0] desc1[7:0];
	 wire [7:0] desc2[7:0];
	 wire [7:0] desc3[7:0];
	 wire [7:0] desc4[7:0];
	 wire [7:0] desc5[7:0];
	 wire [7:0] desc6[7:0];
	 wire [7:0] desc7[7:0];
	 wire [7:0] desc8[7:0];
	 wire [7:0] desc9[7:0];
	 wire [7:0] desc10[7:0];
	 wire [7:0] desc11[7:0];
	 wire [7:0] desc12[7:0];
	 wire [7:0] desc13[7:0];
	 wire [7:0] desc14[7:0];
	 wire [7:0] desc15[7:0];
	 wire [7:0] desc16[7:0];
	 
	 assign desc1[0]=tdesc1[7:0];assign desc1[3]=tdesc1[31:24];assign desc1[6]=tdesc1[55:48];
	 assign desc1[1]=tdesc1[15:8];assign desc1[4]=tdesc1[39:32];assign desc1[7]=tdesc1[63:56];
	 assign desc1[2]=tdesc1[23:16];assign desc1[5]=tdesc1[47:40];
	 
	 assign desc2[0]=tdesc2[7:0];assign desc2[3]=tdesc2[31:24];assign desc2[6]=tdesc2[55:48];
	 assign desc2[1]=tdesc2[15:8];assign desc2[4]=tdesc2[39:32];assign desc2[7]=tdesc2[63:56];
	 assign desc2[2]=tdesc2[23:16];assign desc2[5]=tdesc2[47:40];
	 
	 assign desc3[0]=tdesc3[7:0];assign desc3[3]=tdesc3[31:24];assign desc3[6]=tdesc3[55:48];
	 assign desc3[1]=tdesc3[15:8];assign desc3[4]=tdesc3[39:32];assign desc3[7]=tdesc3[63:56];
	 assign desc3[2]=tdesc3[23:16];assign desc3[5]=tdesc3[47:40];
	 
	 assign desc4[0]=tdesc4[7:0];assign desc4[3]=tdesc4[31:24];assign desc4[6]=tdesc4[55:48];
	 assign desc4[1]=tdesc4[15:8];assign desc4[4]=tdesc4[39:32];assign desc4[7]=tdesc4[63:56];
	 assign desc4[2]=tdesc4[23:16];assign desc4[5]=tdesc4[47:40];
	 
	 assign desc5[0]=tdesc5[7:0];assign desc5[3]=tdesc5[31:24];assign desc5[6]=tdesc5[55:48];
	 assign desc5[1]=tdesc5[15:8];assign desc5[4]=tdesc5[39:32];assign desc5[7]=tdesc5[63:56];
	 assign desc5[2]=tdesc5[23:16];assign desc5[5]=tdesc5[47:40];
	 
	 assign desc6[0]=tdesc6[7:0];assign desc6[3]=tdesc6[31:24];assign desc6[6]=tdesc6[55:48];
	 assign desc6[1]=tdesc6[15:8];assign desc6[4]=tdesc6[39:32];assign desc6[7]=tdesc6[63:56];
	 assign desc6[2]=tdesc6[23:16];assign desc6[5]=tdesc6[47:40];
	 
	 assign desc7[0]=tdesc7[7:0];assign desc7[3]=tdesc7[31:24];assign desc7[6]=tdesc7[55:48];
	 assign desc7[1]=tdesc7[15:8];assign desc7[4]=tdesc7[39:32];assign desc7[7]=tdesc7[63:56];
	 assign desc7[2]=tdesc7[23:16];assign desc7[5]=tdesc7[47:40];
	 
	 assign desc8[0]=tdesc8[7:0];assign desc8[3]=tdesc8[31:24];assign desc8[6]=tdesc8[55:48];
	 assign desc8[1]=tdesc8[15:8];assign desc8[4]=tdesc8[39:32];assign desc8[7]=tdesc8[63:56];
	 assign desc8[2]=tdesc8[23:16];assign desc8[5]=tdesc8[47:40];
	 
	 assign desc9[0]=tdesc9[7:0];assign desc9[3]=tdesc9[31:24];assign desc9[6]=tdesc9[55:48];
	 assign desc9[1]=tdesc9[15:8];assign desc9[4]=tdesc9[39:32];assign desc9[7]=tdesc9[63:56];
	 assign desc9[2]=tdesc9[23:16];assign desc9[5]=tdesc9[47:40];
	 
	 assign desc10[0]=tdesc10[7:0];assign desc10[3]=tdesc10[31:24];assign desc10[6]=tdesc10[55:48];
	 assign desc10[1]=tdesc10[15:8];assign desc10[4]=tdesc10[39:32];assign desc10[7]=tdesc10[63:56];
	 assign desc10[2]=tdesc10[23:16];assign desc10[5]=tdesc10[47:40];
	 
	 assign desc11[0]=tdesc11[7:0];assign desc11[3]=tdesc11[31:24];assign desc11[6]=tdesc11[55:48];
	 assign desc11[1]=tdesc11[15:8];assign desc11[4]=tdesc11[39:32];assign desc11[7]=tdesc11[63:56];
	 assign desc11[2]=tdesc11[23:16];assign desc11[5]=tdesc11[47:40];
	 
	 assign desc12[0]=tdesc12[7:0];assign desc12[3]=tdesc12[31:24];assign desc12[6]=tdesc12[55:48];
	 assign desc12[1]=tdesc12[15:8];assign desc12[4]=tdesc12[39:32];assign desc12[7]=tdesc12[63:56];
	 assign desc12[2]=tdesc12[23:16];assign desc12[5]=tdesc12[47:40];
	 
	 assign desc13[0]=tdesc13[7:0];assign desc13[3]=tdesc13[31:24];assign desc13[6]=tdesc13[55:48];
	 assign desc13[1]=tdesc13[15:8];assign desc13[4]=tdesc13[39:32];assign desc13[7]=tdesc13[63:56];
	 assign desc13[2]=tdesc13[23:16];assign desc13[5]=tdesc13[47:40];
	 
	 assign desc14[0]=tdesc14[7:0];assign desc14[3]=tdesc14[31:24];assign desc14[6]=tdesc14[55:48];
	 assign desc14[1]=tdesc14[15:8];assign desc14[4]=tdesc14[39:32];assign desc14[7]=tdesc14[63:56];
	 assign desc14[2]=tdesc14[23:16];assign desc14[5]=tdesc14[47:40];
	 
	 assign desc15[0]=tdesc15[7:0];assign desc15[3]=tdesc15[31:24];assign desc15[6]=tdesc15[55:48];
	 assign desc15[1]=tdesc15[15:8];assign desc15[4]=tdesc15[39:32];assign desc15[7]=tdesc15[63:56];
	 assign desc15[2]=tdesc15[23:16];assign desc15[5]=tdesc15[47:40];
	 
	 assign desc16[0]=tdesc16[7:0];assign desc16[3]=tdesc16[31:24];assign desc16[6]=tdesc16[55:48];
	 assign desc16[1]=tdesc16[15:8];assign desc16[4]=tdesc16[39:32];assign desc16[7]=tdesc16[63:56];
	 assign desc16[2]=tdesc16[23:16];assign desc16[5]=tdesc16[47:40];
	 

	//*********  特征点定位  ****************//
	//	提取到特征点时，kp_det =1;
	//	特征向量计算完成后,kp_det=0;
	//	其它情况下，kp_det=0;
	 reg kp_det;
	 
	 wire [17:0] addr_grad_dir_main_ori;
	 wire [17:0] addr_grad_dir_local_desc;
	 wire [17:0] addr_grad;
	 wire [17:0] addr_dir;
	 reg  [17:0] addr_kp_1;
	 reg  [17:0] addr_kp_2;
	 wire [17:0] addr_kp1;
	 wire [17:0] addr_kp;
	 
	 wire [7:0] data_grad_rom;
	 wire [7:0] data_dir_rom;
	 wire [7:0] data_kp_rom;
	 
	 
//	 wire [5:0] main_dir;	//main_ori输出的主方向
	 
//*******************************//

//************** 输出到端口 ***********//
	assign desc_out={tdesc1,tdesc2,tdesc3,tdesc4,tdesc5,tdesc6,tdesc7,tdesc8,tdesc9,tdesc10,tdesc11,tdesc12,tdesc13,tdesc14,tdesc15,tdesc16};
	assign addr_kp_out=complete1?addr_kp_2:addr_kp_1;		// 完成第一幅图后
	assign addr_grad_out=addr_grad;
	assign addr_dir_out=addr_dir;
	
//************** 端口输入****************//
	assign data_grad_rom=mag_in;
	assign data_dir_rom=dir_in;

//*********控制部分****************//

	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			addr_kp_1<=0;
			addr_kp_2<=0;
			kp_det<=0;
			complete1<=0;
			complete2<=0;
		end
		
		else
		begin
			if(!complete1)
			begin
				// 1.去除边界 范围 10
				// 2.判断是否是极值点 XXXXX 不需要这个过程
				// 3.判断是否完成提取，提取完成后复位
				// 4.不是边界点即提取主方向和局部描述向量
					kp_det<=1;
					if(desc_complete)
					begin
						kp_det<=0;
						if(addr_kp_1<1022)
							addr_kp_1<=addr_kp_1+1; 	//计算完成后读取下一个点
						else
							complete1<=1;
					end
			end
			
			else
			begin
				if((addr_kp_in[17:8] > 10) && (addr_kp_in[17:8] < 246) && (addr_kp_in[7:0] > 10) && (addr_kp_in[7:0] < 246))		
				// 1.去除边界 范围 10
				// 2.判断是否是极值点
				// 3.判断是否完成提取，提取完成后复位
				begin
					kp_det<=1;
					if(desc_complete)
					begin
						kp_det<=0;
						if(addr_kp_2<254)
							addr_kp_2<=addr_kp_2+1; //计算完成后读取下一个点
						else
							complete2<=1;
					end
				end
				else
				begin
					kp_det<=0;
					if(addr_kp_2<254)
						addr_kp_2<=addr_kp_2+1;
					else
						complete2<=1;
				end
			end
			
		end
	end
	 
	//*********主方向计算模块*************//	 
	assign rst_main_ori=kp_det; 
	
	main_ori U_main_ori(
		.clk(clk),
		.rst(rst_main_ori),
		.kp_addr(addr_kp_in),
		.mag(data_grad_rom),
		.dir(data_dir_rom[5:0]),
		.grad_dir_addr(addr_grad_dir_main_ori),
		.dir_out(main_dir),
		.out_en(main_ori_complete)
    );
	 
	//*********局部描述向量计算模块***********//	 

	wire [17:0] addr_kp_in_local_desc;
	
	assign addr_kp_in_local_desc=complete1?{addr_kp_in[17:10],addr_kp_in[7:0]}:addr_kp_in;
	
	local_desc U_local_desc(
		.clk(clk),
		.rst(main_ori_complete),
		.addr_kp(addr_kp_in),
		.mag(data_grad_rom),
		.dir(data_dir_rom[5:0]),
		.main_dir(main_dir),
		.complete1(complete1),
		.local_desc_addr(addr_grad_dir_local_desc),
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
		.tdesc16(tdesc16), 
		.out_en(desc_complete)
    );
	 
	 
	//********梯度和方向RAM，保存第一部分计算结果********//
	
	assign addr_grad=main_ori_complete ? addr_grad_dir_local_desc : addr_grad_dir_main_ori;
	assign addr_dir=main_ori_complete ? addr_grad_dir_local_desc : addr_grad_dir_main_ori;

endmodule
