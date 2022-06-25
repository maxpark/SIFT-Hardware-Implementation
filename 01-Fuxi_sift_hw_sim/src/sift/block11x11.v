`timescale 1ns / 1ps

/*
	Input:
		时钟、复位、串行数据
	Output:
		dout1, dout2, dout3, ...: 11x11窗口的数据：
		cnt: 地址计数器，控制外部图像RAM读写地址，复位完成后递增
		start_flag: 有效数据输出开始
		complete: 当前图像输出完成

	Description:	
		用于从串行输入的图像数据中提取出11x11大小的窗口数据用于高斯滤波的窗口操作。
		结构上，输入端为8bit图像数据，每个时钟周期输入一个数据；
		输出端有11个88bit的端口，分别代表11x11窗口的11行数据，每个端口含8bit数据11个，表示窗口某一行的11列数据。
*/


module block11x11(
	clk, rst, din, dout1, dout2, dout3, dout4, dout5, dout6, dout7, 
    dout8, dout9, dout10, dout11, 
	start_flag, cnt, complete
);

	input clk;
	input rst;
	input  [7:0] din;
	output [87:0] dout1;
	output [87:0] dout2;
	output [87:0] dout3;
	output [87:0] dout4;
	output [87:0] dout5;
	output [87:0] dout6;
	output [87:0] dout7;
	output [87:0] dout8;
	output [87:0] dout9;
	output [87:0] dout10;
	output [87:0] dout11;
	output [20:0] cnt;
	output start_flag;

//	组状态	 

	output reg complete;
	 
	parameter test=1'b1;    //测试时为1，预读图像

	 wire [87:0] dout1;			  //15x15 1
	 wire [87:0] dout2;			  //15x15 2
	 wire [87:0] dout3;			  //15x15 3
	 wire [87:0] dout4;			  //15x15 4
	 wire [87:0] dout5;			  //15x15 5
	 wire [87:0] dout6;			  //15x15 6
	 wire [87:0] dout7;			  //15x15 7
	 wire [87:0] dout8;			  //15x15 8
	 wire [87:0] dout9;			  //15x15 9
	 wire [87:0] dout10;		
	 wire [87:0] dout11;

	 wire [20:0] cnt;				  //图像像素计数器，作为读图像RAM的地址
	 
	 reg [16:0] cnt_s;				  // start_flag 控制计数寄存器
	 
	//  reg [7:0] mem[0:262143];	  //用来保存图像数据，临时寄存器，仿真时用到
	 
	 reg [7:0] data;				  //缓存输入的图像数据
	 
	 reg full_11_flag;
	 reg full_10_flag;
	 reg full_9_flag;
	 reg full_8_flag;
	 reg full_7_flag;
	 reg full_6_flag;
	 reg full_5_flag;
	 reg full_4_flag;
	 reg full_3_flag;
	 reg full_2_flag;				  //FIFO2满标志，FIFO满后读数据
	 reg full_1_flag;				  //FIFO1满标志，FIFO满后读数据
	 reg empty_2_flag,empty_1_flag;				  //空标志
	 reg empty_3_flag,empty_4_flag,empty_5_flag,empty_6_flag;
	 reg empty_7_flag,empty_8_flag,empty_9_flag,empty_10_flag;
	 reg empty_11_flag,empty_12_flag,empty_13_flag,empty_14_flag,empty_15_flag;

	 wire start_flag;


	//*******************  仿真加载的图像数据 *************//
	//  initial
	//  begin

	//  	$readmemh("ram_image.txt",mem);		//仿真使用文档数据

	//  end
	 
	 
	 //**************  计算读图像RAM的地址  *************//
	 //  512 * 512 的图像数据
	 reg [20:0] cnt1;

	 always@(posedge clk or negedge rst)
	 begin
		if(!rst)
		begin
			cnt1<=0;
			complete<=0;
		end
		else
		begin
				begin
					if(cnt1<262144)			//512*512  262144 
					begin
						cnt1<=cnt1+1; 		//依次增加，逐行扫描
					end
					else
						complete<=1;
				end
		
		end
	 end
	 
	 assign cnt=cnt1;
	//***************************************//


	//************  FIFO 控制 ****************//
	
	reg wr_en1;//FIFO 写控制信号
	 wire wr_en2,wr_en3,wr_en4,wr_en5,wr_en6,wr_en7,wr_en8,wr_en9,wr_en10,wr_en11,wr_en12,wr_en13,wr_en14;

	 wire rd_en1;//FIFO 读控制信号
	 wire rd_en2,rd_en3,rd_en4,rd_en5,rd_en6,rd_en7,rd_en8,rd_en9,rd_en10,rd_en11,rd_en12,rd_en13,rd_en14;

	 wire[7:0] din1;//FIFO 输入输出信号,移位寄存器输入信号
	 wire[7:0] din2,din3,din4,din5,din6,din7,din8,din9,din10,din11,din12,din13,din14,din15;
	 

	 wire full1,full2,full3,full4,full5,full6,full7,full8,full9,full10,full11,full12,full13,full14;
 

	 always@(posedge clk or negedge rst)
	 begin
	 	if(!rst)
		begin
			cnt_s<=0;
			wr_en1<=0;
			full_11_flag<=0;
			full_10_flag<=0;full_9_flag<=0;full_8_flag<=0;full_7_flag<=0;full_6_flag<=0;
			full_5_flag<=0;full_4_flag<=0;full_3_flag<=0;full_2_flag<=0;full_1_flag<=0;
			empty_1_flag<=0;empty_2_flag<=0;empty_3_flag<=0;empty_4_flag<=0;
			empty_5_flag<=0;empty_6_flag<=0;empty_7_flag<=0;empty_8_flag<=0;
			empty_9_flag<=0;empty_10_flag<=0;
		end

		else
		begin
//			 $monitor("full flag %d",full2_flag);
			begin
				wr_en1<=1;
				
				// data<=mem[cnt];		//仿真的时候读取文件数据，mem[cnt]
				
				data<=din;				//真实采用RAM中的数据
				if(full1)
					full_1_flag<=1;

				if(full2)
					full_2_flag<=1;

				if(full3)
					full_3_flag<=1;
				
				if(full4)
					full_4_flag<=1;

				if(full5)
					full_5_flag<=1;
				
				if(full6)
					full_6_flag<=1;

				if(full7)
					full_7_flag<=1;

				if(full8)
					full_8_flag<=1;

				if(full9)
					full_9_flag<=1;
				
				if(full10)
					full_10_flag<=1;
				
				if(full11)
					full_11_flag<=1;

			end

			if(cnt_s<65535)
				cnt_s<=cnt_s+1;
				
		end
	 end

//
	assign din1=test?data:din;   //读取RAM的值
//	assign din1=data;	 //仿真时使用
	
//FIFO 读使能	 
	 assign rd_en1=full_1_flag;
	 assign rd_en2=full_2_flag;
	 assign rd_en3=full_3_flag;
	 assign rd_en4=full_4_flag;
	 assign rd_en5=full_5_flag;
	 assign rd_en6=full_6_flag;
	 assign rd_en7=full_7_flag;
	 assign rd_en8=full_8_flag;
	 assign rd_en9=full_9_flag;
	 assign rd_en10=full_10_flag;
	 assign rd_en11=full_11_flag;


//FIFO 写使能
	 assign wr_en2=full_1_flag;
	 assign wr_en3=full_2_flag;
	 assign wr_en4=full_3_flag;
	 assign wr_en5=full_4_flag;
	 assign wr_en6=full_5_flag;
	 assign wr_en7=full_6_flag;
	 assign wr_en8=full_7_flag;
	 assign wr_en9=full_8_flag;
	 assign wr_en10=full_9_flag;
	 assign wr_en11=full_10_flag;

		
	 //需要修改
	 assign start_flag=(cnt_s>5131); //0223修改 5130
	 
	 


	  my_fifo256 fifo1(.clk(clk),.rst(rst),.rd_en(rd_en1),.wr_en(wr_en1),
	 						 .din(din1),.dout(din2),.empty(empty1),.full(full1));
	  my_fifo256 fifo2(.clk(clk),.rst(rst),.rd_en(rd_en2),.wr_en(wr_en2),
	 						 .din(din2),.dout(din3),.empty(empty2),.full(full2));
	  my_fifo256 fifo3(.clk(clk),.rst(rst),.rd_en(rd_en3),.wr_en(wr_en3),
	 						 .din(din3),.dout(din4),.empty(empty3),.full(full3));
      my_fifo256 fifo4(.clk(clk),.rst(rst),.rd_en(rd_en4),.wr_en(wr_en4),
	 						 .din(din4),.dout(din5),.empty(empty4),.full(full4));
	  my_fifo256 fifo5(.clk(clk),.rst(rst),.rd_en(rd_en5),.wr_en(wr_en5),
	 						 .din(din5),.dout(din6),.empty(empty5),.full(full5));
	  my_fifo256 fifo6(.clk(clk),.rst(rst),.rd_en(rd_en6),.wr_en(wr_en6),
	 						 .din(din6),.dout(din7),.empty(empty6),.full(full6));
	  my_fifo256 fifo7(.clk(clk),.rst(rst),.rd_en(rd_en7),.wr_en(wr_en7),
	 						 .din(din7),.dout(din8),.empty(empty7),.full(full7));
	  my_fifo256 fifo8(.clk(clk),.rst(rst),.rd_en(rd_en8),.wr_en(wr_en8),
	 						 .din(din8),.dout(din9),.empty(empty8),.full(full8));
	  my_fifo256 fifo9(.clk(clk),.rst(rst),.rd_en(rd_en9),.wr_en(wr_en9),
	 						 .din(din9),.dout(din10),.empty(empty9),.full(full9));
	  my_fifo256 fifo10(.clk(clk),.rst(rst),.rd_en(rd_en10),.wr_en(wr_en10),
	 						 .din(din10),.dout(din11),.empty(empty10),.full(full10));


	 shift_register_15 sr1(.clk(clk),.din(din1),.rst(rst),.dout(dout1));
	 
	 shift_register_15 sr2(.clk(clk),.din(din2),.rst(rst),.dout(dout2));

	 shift_register_15 sr3(.clk(clk),.din(din3),.rst(rst),.dout(dout3));

	 shift_register_15 sr4(.clk(clk),.din(din4),.rst(rst),.dout(dout4));

	 shift_register_15 sr5(.clk(clk),.din(din5),.rst(rst),.dout(dout5));

	 shift_register_15 sr6(.clk(clk),.din(din6),.rst(rst),.dout(dout6));

	 shift_register_15 sr7(.clk(clk),.din(din7),.rst(rst),.dout(dout7));

	 shift_register_15 sr8(.clk(clk),.din(din8),.rst(rst),.dout(dout8));

	 shift_register_15 sr9(.clk(clk),.din(din9),.rst(rst),.dout(dout9));

	 shift_register_15 sr10(.clk(clk),.din(din10),.rst(rst),.dout(dout10));

	 shift_register_15 sr11(.clk(clk),.din(din11),.rst(rst),.dout(dout11));



endmodule
