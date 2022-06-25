`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		din: 串行图像数据
	Output:
		dx, dy: x和y方向上的梯度
		out_en: 输出结果有效
	Description:	
		用于计算图像在x、y方向上的梯度dx, dy，作为后续SIFT关键点描述向量生成的依据。
*/

module mag_calc(
    input clk,
    input rst,
	input complete1,
    input [7:0] din,
    output signed [7:0] dx,
    output signed [7:0] dy,
    output out_en
);
	 
	 wire [7:0] d1,d2,d3,d4,d5,d6,d7,d8,d9;
	 reg signed [8:0] tmp_x1,tmp_y1;
	 
	 wire [7:0] d1_1,d2_1,d3_1,d4_1,d5_1,d6_1,d7_1,d8_1,d9_1;
	 wire [7:0] d1_2,d2_2,d3_2,d4_2,d5_2,d6_2,d7_2,d8_2,d9_2;
	 
	 wire out_en_1;
	 wire out_en_2;
	 
	 block3x3 blk3_mag_1(.clk(clk), .rst(rst), .din(din), .dout1(d1_1), .dout2(d2_1), .dout3(d3_1),
				 .dout4(d4_1), .dout5(d5_1), .dout6(d6_1), .dout7(d7_1),.dout8(d8_1),.dout9(d9_1), .start_flag(out_en_1));
				 
	 block3x3_2 blk3_mag_2(.clk(clk), .rst(rst), .din(din), .dout1(d1_2), .dout2(d2_2), .dout3(d3_2),
				 .dout4(d4_2), .dout5(d5_2), .dout6(d6_2), .dout7(d7_2),.dout8(d8_2),.dout9(d9_2), .start_flag(out_en_2));
				 
	 assign out_en=complete1?out_en_2:out_en_1;				
	
	 assign d1=complete1?d1_2:d1_1;
	 assign d2=complete1?d2_2:d2_1;
	 assign d3=complete1?d3_2:d3_1;
	 assign d4=complete1?d4_2:d4_1;
	 assign d5=complete1?d5_2:d5_1;
	 assign d6=complete1?d6_2:d6_1;
	 assign d7=complete1?d7_2:d7_1;
	 assign d8=complete1?d8_2:d8_1;
	 assign d9=complete1?d9_2:d9_1;
	


	always @(posedge clk or negedge rst)
	 begin
		if(!rst)
		begin
			tmp_x1<=0;
			tmp_y1<=0;
		end
		else
		begin
			tmp_x1<=d8-d2;
			tmp_y1<=d6-d4;
		end
	 end
	 
	 assign dx=tmp_x1[7:0];
	 assign dy=tmp_y1[7:0];
	 

endmodule
