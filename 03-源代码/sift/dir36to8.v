`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
	Output:
		dir_in: 36个方向
		dir_main: 主方向
		dir_out: 8个方向
	Description:	
		此前根据x、y方向梯度的比值，将图像方向分为36个不同的方向，从而用较少的资源获得较高的精度
		在最终的sift描述向量中，每个子区域的直方图是根据8个方向制定的，因此需要将36方向数据转化为8方向数据，
		同时在转化的过程中，将8方向的直方图顺序重新排列，以近似将关键点11x11邻域旋转到主方向过程中每个子区域的行为。
*/
module dir36to8(
		input [5:0] dir_in,
		input [5:0] dir_main,
		output reg [2:0] dir_out
    );
	 
	 wire signed [6:0] dir_tmp;
	 wire [5:0] dir_c;
	 
	 assign dir_tmp=dir_in-dir_main;
	 assign dir_c=(dir_tmp>0)?(dir_tmp):dir_tmp+36;
	 
	 always@(dir_c)
	 begin
		case(dir_c)
		0:dir_out<=0;
		1:dir_out<=0;
		2:dir_out<=0;
		3:dir_out<=1;
		4:dir_out<=1;
		5:dir_out<=1;
		6:dir_out<=1;
		7:dir_out<=2;
		8:dir_out<=2;
		9:dir_out<=2;
		10:dir_out<=2;
		11:dir_out<=2;
		12:dir_out<=3;
		13:dir_out<=3;
		14:dir_out<=3;
		15:dir_out<=3;
		16:dir_out<=4;
		17:dir_out<=4;
		18:dir_out<=4;
		19:dir_out<=4;
		20:dir_out<=4;
		21:dir_out<=5;
		22:dir_out<=5;
		23:dir_out<=5;
		24:dir_out<=5;
		25:dir_out<=6;
		26:dir_out<=6;
		27:dir_out<=6;
		28:dir_out<=6;
		29:dir_out<=6;
		30:dir_out<=7;
		31:dir_out<=7;
		32:dir_out<=7;
		33:dir_out<=7;
		34:dir_out<=0;
		35:dir_out<=0;
		default:dir_out<=3'bzzz;
		endcase
	 end


endmodule
