`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: 
// Module Name:    sift_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
//////////////////////////////////////////////////////////////////////////////////
module sift_top(
	clk_sys, 
	rst_sys, 
	EPP_Write0,
	EPP_DataStrobe0,
	EPP_Reset0,
	EPP_AddressStrobe0,
	EPP_Data,
	EPP_Interrupt,
	EPP_Wait,
	led1,
	led2
);
	input clk_sys;
	input rst_sys;
	input EPP_Write0;
	input EPP_DataStrobe0;
	input EPP_Reset0;
	input EPP_AddressStrobe0;
	inout [7:0] EPP_Data;
	output EPP_Interrupt;
	output EPP_Wait;
	output led1;
	output led2;

	wire flag_read; 
	assign flag_read = 1'b0;			// always read from rom init file
	

	 
	//****************  RAM 初始存储地址 *************//
		
		parameter [17:0] grad1_addr=3077;// 梯度初始保存地址
		parameter [17:0] dir1_addr=3077;// 方向初始保存地址
		
		parameter [17:0] grad2_addr=1541;// 梯度初始保存地址
		parameter [17:0] dir2_addr=1541;// 方向初始保存地址
		
		parameter [17:0] kp1_addr=3074; //KP1地址
		parameter [17:0] kp2_addr=1538; //KP2地址
	 
	 
	//****************   Clock  ********************//
	wire clk_100;
	wire clk_50;
	wire rst;
	
	reg rst_complete;
	
	pll_sift clk_manager(
		.clkin0		(clk_sys),		
		.clkout0	(clk_100),		//100M	
		.clkout1	(clk_50),		//50M
		.locked		(rst)
	);

	 //*****************  EPP register  *****************//	
	 
	 reg div_clk; 		//EPP 发送时钟，需要分频，同时也是读取相应 RAM 的时钟
	 wire write_b_img;	//读取图像数据		//0为写RAM，1为读

	 assign write_b_img = 1'b0;																// WT: 计算，写各个ram

	 wire write_b_kp;		//读取特征点
	 wire write_b_grad;		//读取梯度数据
	 wire write_b_dir;		//读取方向数据
	 
	 wire [7:0] data_txd; //EPP发送数据 wire
	 wire [7:0] data_rxd; //EPP接收数据
	 
	 wire wr_complete;		//一帧处理完成标志位
	 
	 wire [17:0] raddr_epp;
	 wire [9:0] raddr_epp_kp;
	 
	 wire read_grad;
	 wire read_dir;
	 wire read_kp;
	 wire read_canny;
	 
	 wire [7:0] data2ram;
	 
	 wire [7:0] dout_RAM_2;
	 
	 wire wea_1;
	 wire wea_2;
	 
	 
	 //*************** RAM 读写控制信号 ************//
	 wire we_img;
	 reg we_dir1,we_dir2,we_mag1,we_mag2;
	 reg we_KP1_RAM,we_KP2_RAM,we_DESC1_RAM,we_DESC2_RAM;
	 
	 reg we_main_dir_ram;
	 
	 
	 wire [17:0] addr_img_r,addr_dir1_r,addr_mag1_r,addr_dir2_r,addr_mag2_r;
	 wire [17:0] addr_img_w;
	 wire [17:0] addr_img_r_feat,addr_dir1_r_desc,addr_mag1_r_desc;
	 
	 reg [17:0] addr_dir1_w,addr_mag1_w,addr_dir2_w,addr_mag2_w;
	 wire [17:0] addr_img,addr_dir1,addr_mag1,addr_dir2,addr_mag2;
	 wire [9:0] addr_KP1_RAM,addr_KP1_RAM_r,addr_KP1_RAM_r_desc;
	 reg  [9:0] addr_KP1_RAM_w;
	 wire [7:0] addr_KP2_RAM_r,addr_KP2_RAM,addr_KP2_RAM_r_desc;
	 reg  [7:0] addr_KP2_RAM_w;
	 
	 wire [7:0] addr_DESC1_RAM,addr_DESC1_RAM_r;
	 reg  [9:0] addr_DESC1_RAM_w;
	 wire [7:0] addr_DESC2_RAM,addr_DESC2_RAM_r;
	 reg  [7:0] addr_DESC2_RAM_w;
	 
	 wire [9:0] addr_main_dir_ram;
	 wire [9:0] addr_main_dir_ram_r;
	 reg [9:0] addr_main_dir_ram_w;
	 

//************保存提取结果 ****************//	 
	 
	 wire [7:0] din_img, dout_img;
	 
	 wire [7:0] din_dir1,din_dir2,din_mag1,din_mag2;
	  wire [7:0] dout_dir1,dout_dir2,dout_mag1,dout_mag2;
	 
	 wire [1023:0] din_DESC1_RAM,din_DESC2_RAM;
	 wire [1023:0] dout_DESC1_RAM;
	 wire [1023:0] dout_DESC2_RAM;
	 
	 wire [17:0] din_KP1_RAM,din_KP2_RAM;
	 wire [17:0] dout_KP1_RAM,dout_KP2_RAM;
	 
	 wire [5:0] main_dir_out;
	 wire [5:0] main_dir;
	 
	 
	 //******************* 主要模块变量 ****************************//
	 
	 wire rst_feat;
	 
	 wire complete1;
	 wire complete2;//完成第一，二组feat_detection
	 
	 wire complete3;
	 wire complete4;//完成第一，二组desc_calculation
	 
	 wire out_feat_en;
	 wire [5:0] dir;
	 wire [7:0] mag;
	 wire kp;
	 
	 wire [17:0] kp_in;
	 wire [7:0] mag_in;
	 wire [7:0] dir_in;
	
	 wire [1023:0] desc;
	 
	 wire [9:0] addr_kp_out;
	 wire [17:0] addr_dir_out;
	 wire [17:0] addr_mag_out;
	  
	 wire desc_complete;
	 
	 
//******************  canny    ***********//
	wire canny_edge;
	wire [17:0] addr_mag;
	wire [17:0] addr_edge;
	wire [17:0] addr_mag_tmp;
	wire complete_canny;
	
	reg we_canny;
	wire dout_canny;
	wire [17:0] addr_canny;
	wire [17:0] addr_canny_epp;
	wire [17:0] addr_canny_w;
	reg rst_canny;




//********************* RAM 读写控制 地址，数据，使能信号 *************************//
//******************  complete3 控制从RAM1或者RAM2读取数据 ***********************//
	assign dir_in=complete3?dout_dir2:dout_dir1;
	assign mag_in=complete3?dout_mag2:dout_mag1;
	assign kp_in=complete3?dout_KP2_RAM:dout_KP1_RAM;
	
//************************  赋读写地址  *********************//
	//  图像RAM
	assign addr_img_r = write_b_img? raddr_epp : addr_img_r_feat; //write_b为发送到EPP，低则是进行feat运算
	assign addr_img = we_img ? addr_img_w : addr_img_r;	//测试RAM读写 raddr_epp ;
	
	//  DESC 和 EPP地址
	assign addr_mag1_r=complete_canny?addr_mag1_r_desc:addr_mag;
	assign addr_dir1_r=read_dir?raddr_epp:addr_dir1_r_desc;

	assign addr_KP1_RAM_r=read_kp?raddr_epp_kp:addr_KP1_RAM_r_desc;						// desc模块读取KP1_RAM
	
	//  DIR RAM
	assign addr_dir1=we_dir1 ? addr_dir1_w : addr_dir1_r;
	assign addr_dir2=we_dir2 ? addr_dir2_w : addr_dir2_r;
	
	//  MAG RAM
	assign addr_mag_tmp=read_grad ? raddr_epp: addr_mag1_r;

	assign addr_mag1=we_mag1?addr_mag1_w:addr_mag_tmp;//addr_mag1_r;
	assign addr_mag2=we_mag2?addr_mag2_w:addr_mag2_r;
	
	//  KP RAM
	assign addr_KP1_RAM=we_KP1_RAM?addr_KP1_RAM_w:addr_KP1_RAM_r;
	assign addr_KP2_RAM=we_KP2_RAM?addr_KP2_RAM_w:addr_KP2_RAM_r_desc;
   //  DESC RAM
	assign addr_DESC1_RAM=we_DESC1_RAM?addr_DESC1_RAM_w:addr_DESC1_RAM_r;
	assign addr_DESC2_RAM=we_DESC2_RAM?addr_DESC2_RAM_w:addr_DESC2_RAM_r;
	
	// DIR MAG 的 RAM1和RAM2的读地址由 DESC模块提供
	assign addr_dir1_r_desc=we_dir1?0:addr_dir_out;			
	assign addr_dir2_r=we_dir2?0:addr_dir_out;				
	assign addr_mag1_r_desc=we_mag1?0:addr_mag_out;			
	assign addr_mag2_r=we_mag2?0:addr_mag_out;			
	
	assign addr_KP1_RAM_r_desc=we_KP1_RAM?0:addr_kp_out;				// desc模块输出kp地址
	assign addr_KP2_RAM_r_desc=we_KP2_RAM?0:addr_kp_out;
	
	
	assign addr_main_dir_ram=we_main_dir_ram?addr_main_dir_ram_w:addr_main_dir_ram_r;
	
	
// *************** 数据流控制********************************//
	
	//complete1 控制保存到RAM1或者RAM2中
	assign din_dir1=complete1?0:{2'b00,dir};
	assign din_dir2=complete1?{2'b00,dir}:0;
	
	assign din_mag1=complete1?0:mag;
	assign din_mag2=complete1?mag:0;
	 
	//  complete3 控制保存DESC到RAM1或者RAM2中
	assign din_DESC1_RAM=complete3?0:desc;
	assign din_DESC2_RAM=complete3?desc:0;
	 
	wire [15:0] tmp_kp2;
	assign din_KP1_RAM=complete1?0:(addr_img_r_feat-3094);  		//测试结果
	assign din_KP2_RAM=complete1?({addr_img_r_feat[17:10],addr_img_r_feat[8:1]}-1538):0;
	 

//************************** RAM 读写控制*****************************//
	assign we_img = flag_read;				//flag_read high indicate write data to RAM

	always @(posedge clk_50 or negedge rst)
	begin
		if(!rst)
		begin
			we_dir1<=1;	we_dir2<=1;  // 1为写
			we_mag1<=1;	we_mag2<=1;
			we_KP1_RAM<=1;	we_KP2_RAM<=1;
			we_DESC1_RAM<=1;we_DESC2_RAM<=1;
			we_main_dir_ram<=0;
			we_canny<=1;
		end
		
		else
		begin
			if(write_b_img)
			begin
				we_dir1<=0;we_dir2<=0;	//所有RAM均可读
				we_mag1<=0;we_mag2<=0;
				we_KP1_RAM<=0;we_KP2_RAM<=0;
				we_DESC1_RAM<=0;we_DESC2_RAM<=0;
				we_main_dir_ram<=0;
				we_canny<=0;
			end
			else
			begin
				we_dir1<=(!complete1);		we_dir2<=~complete2;
				we_mag1<=~complete1;		we_mag2<=~complete2;		
				we_KP1_RAM<=!complete1;		we_KP2_RAM<=!complete2;
				we_DESC1_RAM<=!complete3;	we_DESC2_RAM<=!complete4;
				we_main_dir_ram<=!complete3;
				we_canny<=~complete_canny;
			end
			
		end
	end





////******************* 主要模块 ****************************//
	 assign rst_feat= rst && rst_complete && (!flag_read)&& (!write_b_img);  	//往图像RAM中写数据时其余模块复位
																			 	//1帧计算完成后复位所有模块
																				//当需要读时，复位所有模块，此信号有效前，
																				//complete2完成




	 sift_feat U_sift_feat (
		.clk(clk_50),
		.clk_90(clk_50),
		.rst(rst_feat), 		// low valid
		.din(dout_img),

		.addr(addr_img_r_feat),			// cnt

		.dout_kp(kp), 
		
		.mag(mag), 
		.dir(dir), 
		.out_en(out_feat_en),
		.complete1(complete1),
		.complete2(complete2)
    );
	 
	 
	 sift_desc U_sift_desc (
		.clk(clk_100), //100M?
		.rst(complete_canny),
		.mag_in(mag_in), 
		.dir_in(dir_in),
		.addr_kp_in(kp_in),
		.addr_kp_out(addr_kp_out), 
		.addr_grad_out(addr_mag_out), 
		.addr_dir_out(addr_dir_out), 
		.desc_out(desc), 
		.desc_complete(desc_complete), 
		.complete1(complete3), 
		.complete2(complete4),
		.main_dir(main_dir)
    );
	
	 //********************  写入RAM ***************************//
	ram_image ram_image (
		.clk		(clk_100),
		.ce			(1'b1),
		.we			(we_img),			// input [0 : 0] wea
		.rstn		(rst),
		.a			(addr_img),	 		// input [17 : 0] addra
		.d			(din_img),			// input [7 : 0] dina	
		.q			(dout_img)			// output [7 : 0] douta
	);

	ram_dir1 U_dir1 (
		.clk		(clk_100),
		.ce			(1'b1),
		.we			(we_dir1),			// input [0 : 0] wea
		.rstn		(rst),
		.a			(addr_dir1),	 		// input [17 : 0] addra
		.d			(din_dir1),			// input [7 : 0] dina	
		.q			(dout_dir1)			// output [7 : 0] douta
	);
	
	
	ram_dir2 U_dir2 (
		.clk		(clk_100),
		.ce			(1'b1),
		.we			(we_dir2),			// input [0 : 0] wea
		.rstn		(rst),
		.a			(addr_dir2),	 		// input [15 : 0] addra
		.d			(din_dir2),			// input [7 : 0] dina	
		.q			(dout_dir2)			// output [7 : 0] douta
	);
	
	
	ram_mag1 U_mag1 (
		.clk		(clk_100),
		.ce			(1'b1),
		.we			(we_mag1),			// input [0 : 0] wea
		.rstn		(rst),
		.a			(addr_mag1),	 		// input [17 : 0] addra
		.d			(din_mag1),			// input [7 : 0] dina	
		.q			(dout_mag1)			// output [7 : 0] douta
	);
		
	ram_mag2 U_mag2 (
		.clk		(clk_100),
		.ce			(1'b1),
		.we			(we_mag2),			// input [0 : 0] wea
		.rstn		(rst),
		.a			(addr_mag2),	 		// input [15 : 0] addra
		.d			(din_mag2),			// input [7 : 0] dina	
		.q			(dout_mag2)			// output [7 : 0] douta
	);
	
	 //  特征点坐标存储	
	 KP1_RAM U_KP1_RAM (
	 	.clk		(clk_100),
	 	.ce			(1'b1),
	 	.we			(we_KP1_RAM),			// input [0 : 0] wea
	 	.rstn		(rst),
	 	.a			(addr_KP1_RAM),	 		// input [9 : 0] addra
	 	.d			(din_KP1_RAM),			// input [17 : 0] dina
	 	.q			(dout_KP1_RAM)			// output [17 : 0] douta
	 );
	
	 KP2_RAM U_KP2_RAM (
	 	.clk		(clk_100),
	 	.ce			(1'b1),
	 	.we			(we_KP2_RAM),			// input [0 : 0] wea
	 	.rstn		(rst),
	 	.a			(addr_KP2_RAM),	 		// input [9 : 0] addra
	 	.d			(din_KP2_RAM),			// input [17 : 0] dina
	 	.q			(dout_KP2_RAM)			// output [17 : 0] douta
	 );
	
	 //	特征点描述向量存储
	 DESC1_RAM U_DESC1_RAM (
	 	.clk		(clk_100),
	 	.ce			(1'b1),
	 	.we			(we_DESC1_RAM),			// input [0 : 0] wea
	 	.rstn		(rst),
	 	.a			(addr_DESC1_RAM),	 		// input [9 : 0] addra
	 	.d			(din_DESC1_RAM),			// input [1023 : 0] dina
	 	.q			(dout_DESC1_RAM)			// output [1023 : 0] douta
	 );

	 DESC2_RAM U_DESC2_RAM (
	 	.clk		(clk_100),
	 	.ce			(1'b1),
	 	.we			(we_DESC2_RAM),			// input [0 : 0] wea
	 	.rstn		(rst),
	 	.a			(addr_DESC2_RAM),	 		// input [7 : 0] addra
	 	.d			(din_DESC2_RAM),			// input [1023 : 0] dina
	 	.q			(dout_DESC2_RAM)			// output [1023 : 0] douta
	 );

	 MAIN_ORI_RAM U_main_ori_ram (
	 	.clk		(clk_100),
	 	.ce			(1'b1),
	 	.we			(we_main_dir_ram),			// input [0 : 0] wea
	 	.rstn		(rst),
	 	.a			(addr_main_dir_ram),	// input [9 : 0] addra
	 	.d			(main_dir),				// input [5 : 0] dina
	 	.q			(main_dir_out)			// output [5 : 0] douta
	 );
	
	reg [2:0] fsm_state;
	parameter RUN = 3'd0;
	parameter READ = 3'd1;

//********* RAM写地址产生器 ********************//	
	always @(posedge clk_50 or negedge rst)
	begin
		if(!rst)
		begin
			addr_dir1_w<=dir1_addr;
			addr_mag1_w<=grad1_addr;
			addr_dir2_w<=dir2_addr;
			addr_mag2_w<=grad2_addr;
			rst_complete<=1;
		end
		else
		begin
			rst_complete<=!complete4;

					if(complete1)				// 存储完第一张后存第二章
					begin
						if(out_feat_en)
						begin
							if(addr_dir2_w<65535)
							begin
								addr_dir2_w<=addr_dir2_w+1;
								addr_mag2_w<=addr_mag2_w+1;
							end
							else
							begin
								addr_dir2_w<=dir2_addr;
								addr_mag2_w<=grad2_addr;
							end
						end
						else
						begin
							addr_dir2_w<=dir2_addr;
							addr_mag2_w<=grad2_addr;
						end
					end
					else							// out_feat_en控制，存储第一张图的输出
					begin
						if(out_feat_en)
						begin
							if(addr_dir1_w<262144)					//addr_dir1_w<262140
							begin
								addr_dir1_w<=addr_dir1_w+1;
								addr_mag1_w<=addr_mag1_w+1;
							end
							else
							begin
								addr_dir1_w<=dir1_addr;
								addr_mag1_w<=grad1_addr;
							end
						end
						else
						begin
							addr_dir1_w<=dir1_addr;
							addr_mag1_w<=grad1_addr;
						end
					end
		end
	end


	//****************** KP RAM 写地址产生器 *************************//
	always @(posedge kp or negedge rst_feat)
	begin
		if(!rst_feat)
		begin
			addr_KP1_RAM_w<=0;
			addr_KP2_RAM_w<=0;
		end
		else
		begin
			if(complete1)
			begin
				if(addr_KP2_RAM_w<254)
					addr_KP2_RAM_w<=addr_KP2_RAM_w+1;
				else
					addr_KP2_RAM_w<=addr_KP2_RAM_w;
			end
			else
			begin
				if(addr_KP1_RAM_w<1022)
					addr_KP1_RAM_w<=addr_KP1_RAM_w+1;
				else
					addr_KP1_RAM_w<=addr_KP1_RAM_w;
			end
		end
	end
	

	//***************** DEDC RAM 写地址产生器  ************************//

	always @(posedge desc_complete or negedge rst_feat)
	begin
		if(!rst_feat)
		begin
			addr_DESC1_RAM_w<=0;
			addr_DESC2_RAM_w<=0;
			addr_main_dir_ram_w<=0;
		end
		else
		begin
			if(complete3)
			begin
				if(addr_DESC2_RAM_w<254)
					addr_DESC2_RAM_w<=addr_DESC2_RAM_w+1;
				else
					addr_DESC2_RAM_w<=addr_DESC2_RAM_w+0;
			end
			else
			begin
				if(addr_DESC1_RAM_w<1022)
					addr_DESC1_RAM_w<=addr_DESC1_RAM_w+1;
				else
					addr_DESC1_RAM_w<=addr_DESC1_RAM_w+0;
				
				if(addr_main_dir_ram_w<1022)
					addr_main_dir_ram_w<=addr_main_dir_ram_w+1;
				else
					addr_main_dir_ram_w<=addr_main_dir_ram_w+0;
			end
	
		end
	end
	
	

	
	//*******************  EPP 读写模块 *****************************//
	wire [7:0] tmp1,tmp2;									
	assign tmp1=read_grad?dout_mag1:dout_dir1;					//判断是读梯度还是读方向
	assign tmp2=read_canny?{7'b0,dout_canny}:tmp1;//
	assign data_txd=(read_canny|read_dir|read_grad)?tmp2:dout_img;		//判断是否为读图像，或者梯度、方向
	

	assign din_img=data2ram;
	assign wr_complete=complete3; // 测试用
	

	
	
//	EPP my_epp(.EPP_Write0(EPP_Write0), .EPP_Data(EPP_Data), .EPP_Interrupt(EPP_Interrupt), .EPP_Wait(EPP_Wait), 
//				  .EPP_DataStrobe0(EPP_DataStrobe0), .EPP_Reset0(EPP_Reset0), .EPP_AddressStrobe0(EPP_AddressStrobe0),
//				  .write_b(write_b_img), .raddr(raddr_epp), .dout(data_txd), .clk(clk_50), .div_clk(div_clk), .rst(rst), 
//				  .eos_frame(wr_complete), .data2ram(data2ram), .waddr(addr_img_w), .flag_read(flag_read),
//				  .read_grad(read_grad),.read_dir(read_dir),.read_kp(read_kp),.raddr_kp(raddr_epp_kp),
//				  .kp_addr(dout_KP1_RAM),.raddr_main_dir(addr_main_dir_ram_r),.main_dir({2'b00,main_dir2epp}),.read_canny(read_canny)
//					);
	
	always @ (posedge clk_50)
	begin
		if(!rst)
		begin
			div_clk<=0;
		end
		else
		begin
			div_clk<=~div_clk;
		end
	end
	
	assign led1=we_img;
	assign led2=raddr_epp[15]|addr_img_w[15]|complete2;
	//****************************************************************//
	
	
	
	//****************  canny edge detector ***********//
	 always@(posedge clk_100 or negedge rst)
	 begin
	 	if(!rst)
	 	begin
	 		rst_canny<=0;
	 	end
	 	else
	 	begin
	 		if(rst_feat)
	 		begin
	 			if(out_feat_en)
	 				rst_canny<=1;
	 		end
	 		else
	 			rst_canny<=0;
	 	end
	 end
	
	
	  canny canny_detector (
	  	.clk1(clk_50), 
	  	.clk2(clk_100), 
	  	.rst(rst_canny), 
	  	.mag1(mag), 
	  	.mag2(dout_mag1), 
	  	.dir1(dir), 
	  	.addr(addr_mag), 
	  	.canny_edge(canny_edge),
	  	.complete(complete_canny),
	  	.addr_edge(addr_edge)
      );
 
	
	  CANNY_EDGE Canny_edge_detector  (
	  	.clk		(clk_100),
	  	.ce			(1'b1),
	  	.we			(we_canny),			// input [0 : 0] wea
	  	.rstn		(rst),
	  	.a			(addr_canny),		// input [17 : 0] addra
	  	.d			(canny_edge),		// input [0 : 0] dina
	  	.q			(dout_canny)		// output [0 : 0] douta
	  );
	
	 
	 assign addr_canny=we_canny?addr_canny_w:raddr_epp;	
	 assign addr_canny_w=addr_edge; 
	 	
endmodule
