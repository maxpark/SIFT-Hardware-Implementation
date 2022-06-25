`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:35 04/01/2012 
// Design Name: 
// Module Name:    canny 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: ******************  IMPORTANT
								//********  1. the start address of NMS 
								//********  2. the delay between start_flag and the NMS_edge
								//********  3. the exact relationship between dirction and gradient window 

//
///////////////////////////////////////////////////////////////////////////////////
module canny(
    input clk1,
    input clk2,
    input rst,
    input [7:0] mag1,
    input [7:0] mag2,
    input [5:0] dir1,
    output [17:0] addr,
    output reg canny_edge,
	 output reg complete,
	 output [17:0] addr_edge
    );
	
	 
	 
	 
//*******************************************************//	 
	 reg NMS_complete;
	 wire [7:0] g1,g2,g3,g4,g5,g6,g7,g8,g9;
	 wire [7:0] d1,d2,d3,d4,d5,d6,d7,d8,d9;			// original 5:0
	 wire start_flag;
	 
//************** data window *******//	 
	 reg [17:0] cnt_grad;
	 
	 always@(posedge clk1 or negedge rst)
	 begin
		if(!rst)
		begin
			cnt_grad<=3077;
			NMS_complete<=0;
		end
		else
		begin
			if(cnt_grad<258500)
			begin
				cnt_grad<=cnt_grad+1;
			end
			else
				NMS_complete<=1;
		end
	 end
	 
	 
	 block3x3 GRAD3x3 (
    .clk(clk1), 
    .rst(rst), 
    .din(mag1), 
    .dout1(g1), 
    .dout2(g2), 
    .dout3(g3), 
    .dout4(g4), 
    .dout5(g5), 
    .dout6(g6), 
    .dout7(g7), 
    .dout8(g8), 
    .dout9(g9), 
    .start_flag(start_flag)
    );
	 
	 block3x3 DIR3x3 (
    .clk(clk1), 
    .rst(rst), 
    .din(dir1), 
    .dout1(d1), 
    .dout2(d2), 
    .dout3(d3), 
    .dout4(d4), 
    .dout5(d5), 
    .dout6(d6), 
    .dout7(d7), 
    .dout8(d8), 
    .dout9(d9) 
    );
	 
//***************  Non maximum suppression***************//
	reg NMS_edge;
	
	always @(posedge clk1 or negedge rst)
	begin
		if(!rst)
		begin
			NMS_edge<=0;
		end
		else
		begin
			case(d5)
			0:begin 
				if(g5>g2 && g5>g8)
					NMS_edge<=1;
				else
					NMS_edge<=0;
				end
			
			1:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			2:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			3:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			4:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			5:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			6:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			7:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			8:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			9:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			10:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			11:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			12:begin if(g5>g3&& g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			13:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			14:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			15:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			16:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			17:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			18:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			19:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			20:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			21:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			22:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			23:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			24:begin if(g5>g1 && g5>g9) NMS_edge<=1; else NMS_edge<=0; end
			25:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			26:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			27:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			28:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			29:begin if(g5>g4 && g5>g6) NMS_edge<=1; else NMS_edge<=0; end
			30:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			31:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			32:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			33:begin if(g5>g3 && g5>g7) NMS_edge<=1; else NMS_edge<=0; end
			34:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			35:begin if(g5>g2 && g5>g8) NMS_edge<=1; else NMS_edge<=0; end
			default: NMS_edge<=0;
			endcase
		end
	end

//***********  NMS_RAM ********************//	 
	 wire clk;
	 wire wea;
	 wire [17:0] addr_w;
	 wire [17:0] addr_r;
	 wire [17:0] addra;
	 
	 reg [17:0] cnt_hy;  //hysteresis
	 
	 wire dout_NMS;
	 
	 assign clk=wea?clk1:clk2;
	 assign wea=!NMS_complete;
	 assign addra=wea?addr_w:addr_r;
	 
	 assign addr_w=cnt_grad-514;   // 516 is from the analysis of modelsim results
	 
	 assign addr_r=cnt_hy;
	 assign addr=cnt_hy;
	 
	 NMS NMS_RAM (
	.clka(clk), // input clka
	.wea(wea), // input [0 : 0] wea
	.addra(addra), // input [17 : 0] addra
	.dina(NMS_edge), // input [0 : 0] dina
	.douta(dout_NMS) // output [0 : 0] douta
	);


//**************************  Grad HIST *****************//	
//*******************hysteresis high threshold and low threshold

	 reg [17:0] hist[63:0];
	 reg [17:0] cnt_hist;
	 reg [5:0] cnt_th;
	 reg [17:0] acc_hist;
	 reg [7:0] thH;
	 reg [7:0] thL;
	 
	 always@(posedge clk1 or negedge rst)
	 begin
		if(!rst)
		begin
			cnt_hist<=3077;
			cnt_th<=0;
			acc_hist<=0;
			thH<=0;
			thL<=0;
			hist[0]<=0;hist[8]<=0;hist[16]<=0;hist[24]<=0;hist[32]<=0;hist[40]<=0;hist[48]<=0;hist[56]<=0;
			hist[1]<=0;hist[9]<=0;hist[17]<=0;hist[25]<=0;hist[33]<=0;hist[41]<=0;hist[49]<=0;hist[57]<=0;
			hist[2]<=0;hist[10]<=0;hist[18]<=0;hist[26]<=0;hist[34]<=0;hist[42]<=0;hist[50]<=0;hist[58]<=0;
			hist[3]<=0;hist[11]<=0;hist[19]<=0;hist[27]<=0;hist[35]<=0;hist[43]<=0;hist[51]<=0;hist[59]<=0;
			hist[4]<=0;hist[12]<=0;hist[20]<=0;hist[28]<=0;hist[36]<=0;hist[44]<=0;hist[52]<=0;hist[60]<=0;
			hist[5]<=0;hist[13]<=0;hist[21]<=0;hist[29]<=0;hist[37]<=0;hist[45]<=0;hist[53]<=0;hist[61]<=0;
			hist[6]<=0;hist[14]<=0;hist[22]<=0;hist[30]<=0;hist[38]<=0;hist[46]<=0;hist[54]<=0;hist[62]<=0;
			hist[7]<=0;hist[15]<=0;hist[23]<=0;hist[31]<=0;hist[39]<=0;hist[47]<=0;hist[55]<=0;hist[63]<=0;
		end
		else
		begin
			if(cnt_hist<258500)
			begin
				cnt_hist<=cnt_hist+1;
				if(mag1<64)
					hist[mag1]<=hist[mag1]+1;		
			end
			else
			begin
				if(acc_hist<206800)
				begin
					cnt_th<=cnt_th+1;
					acc_hist<=acc_hist+hist[cnt_th];
				end
				else
				begin
					thH<=cnt_th;
					thL<=cnt_th>>1;
				end
			end				
		end
	 end
	 
	 
	 //******************  Hysteresis thresholding ****************//
	 wire [7:0] g1_2,g2_2,g3_2,g4_2,g5_2,g6_2,g7_2,g8_2,g9_2;
	 wire [7:0] d1_2,d2_2,d3_2,d4_2,d5_2,d6_2,d7_2,d8_2,d9_2;
	 reg edge1;
	 reg g5_2_2;
	 
	 wire gtH,gtL;
	 wire start_flag_2;
	 
	 always@(posedge clk2 or negedge NMS_complete)
	 begin
		if(!NMS_complete)
		begin
			cnt_hy<=0;
			edge1<=0;
			canny_edge<=0;
			complete<=0;
		end
		else
		begin
			if(cnt_hy<258500)
				cnt_hy<=cnt_hy+1;
			else
				complete<=1;
			edge1<=d5_2&&(g1_2||g2_2||g3_2||g4_2||g6_2||g7_2||g8_2||g9_2);
			g5_2_2<=g5_2;
			canny_edge<=edge1||g5_2_2;
		end
	 end
	 
	 assign addr_edge=cnt_hy-517;
	 assign gtH=mag2>thH;
	 assign gtL=mag2>thL;
	 
	 block3x3 NMS3x3_H (
    .clk(clk2), 
    .rst(NMS_complete), 
    .din(dout_NMS&&gtH), 
    .dout1(g1_2), 
    .dout2(g2_2), 
    .dout3(g3_2), 
    .dout4(g4_2), 
    .dout5(g5_2), 
    .dout6(g6_2), 
    .dout7(g7_2), 
    .dout8(g8_2), 
    .dout9(g9_2), 
    .start_flag(start_flag_2)
    );
	 
	 block3x3 NMS3x3_L (
    .clk(clk2), 
    .rst(NMS_complete), 
    .din(dout_NMS&&gtL), 
    .dout1(d1_2), 
    .dout2(d2_2), 
    .dout3(d3_2), 
    .dout4(d4_2), 
    .dout5(d5_2), 
    .dout6(d6_2), 
    .dout7(d7_2), 
    .dout8(d8_2), 
    .dout9(d9_2) 
    );

endmodule