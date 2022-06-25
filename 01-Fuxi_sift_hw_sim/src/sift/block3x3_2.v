`timescale 1ns / 1ps
/*
	Input:
		时钟、复位、串行数据
	Output:
		dout1, dout2, dout3, ...: 3x3窗口的数据
		start_flag: 有效数据输出开始。缓存两行，第三行数据到达，即为有效窗口

	Description:	
		用于从串行输入的图像数据中提取出3x3大小的窗口数据。
		结构上，输入端为8bit图像数据，每个时钟周期输入一个数据；
		输出端有9个端口，分别代表3x3窗口的数据
*/


module block3x3_2(clk, rst, din, dout1, dout2, dout3, dout4, dout5, dout6, dout7, 
                   dout8, dout9, start_flag); 
    input clk;
    input rst;
	input  [7:0] din;
    output [7:0] dout1;
    output [7:0] dout2;
    output [7:0] dout3;
    output [7:0] dout4;
    output [7:0] dout5;
    output [7:0] dout6;
    output [7:0] dout7;
    output [7:0] dout8;
    output [7:0] dout9;

	 output start_flag;
										  
	 wire [7:0] test1;			  //FIFO1输出信号
	 wire [7:0] test2;			  //FIFO2输出信号

	 wire [7:0] dout1;			  //3x3 1
	 wire [7:0] dout2;			  //3x3 2
	 wire [7:0] dout3;			  //3x3 3
	 wire [7:0] dout4;			  //3x3 4
	 wire [7:0] dout5;			  //3x3 5
	 wire [7:0] dout6;			  //3x3 6
	 wire [7:0] dout7;			  //3x3 7
	 wire [7:0] dout8;			  //3x3 8
	 wire [7:0] dout9;			  //3x3 9
	
	 reg [9:0] cnt;				  //图像像素计数器

	 reg full2_flag;				  //FIFO2满标志，FIFO满后读数据
	 reg full1_flag;				  //FIFO1满标志，FIFO满后读数据

	 reg wr_en2;//FIFO2 控制信号
	 wire rd_en2;
	 wire wr_en1;//FIFO1 控制信号
	 wire rd_en1;

	 reg[7:0] din1;//
	 reg[7:0] din2;//		

	 wire empty2,full2;
	 wire empty1,full1;

	 always@(posedge clk or negedge rst)
	 begin
	 	if(!rst)
		begin
			cnt<=0;
			din1<=0;
		    din2<=0;

			wr_en2<=0;

			full2_flag<=0;
			full1_flag<=0;
		end

		else
		begin
			begin
				wr_en2<=1;
				din2<=din;
				if(full2)
					full2_flag<=1;

				if(full1)
					full1_flag<=1;
				
				if(cnt<1000)
					cnt<=cnt+1;
			end
		end
	 end
	
	 
	 assign rd_en1=full1_flag;
	 assign rd_en2=full2_flag;
	 assign wr_en1=full2_flag;
	 assign start_flag=(cnt>514);	//256*2+2, buffer 2 lines


	 my_fifo2 fifo2(.clk(clk),.rst(rst),.rd_en(rd_en2),.wr_en(wr_en2),
	 						 .din(din2),.dout(test2),.empty(empty2),.full(full2));


	 my_fifo2 fifo1(.clk(clk),.rst(rst),.rd_en(rd_en1),.wr_en(wr_en1),
	 						 .din(test2),.dout(test1),.empty(empty1),.full(full1));


	 shift_register_3 sr1(.clk(clk),.din(test1),.rst(rst),.dout0(dout3),.dout1(dout2),.dout2(dout1));

	 shift_register_3 sr2(.clk(clk),.din(test2),.rst(rst),.dout0(dout6),.dout1(dout5),.dout2(dout4));

	 shift_register_3 sr3(.clk(clk),.din(din2),.rst(rst),.dout0(dout9),.dout1(dout8),.dout2(dout7));


endmodule
