`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		kp_addr: 关键点在图像中的坐标
		main_dir: 主方向
	Output:
		addr_out: 关键点在重新排列窗口旋转后在图像中的新地址
	Description:	
		根据主方向对子区域的顺序进行重新排列
*/

module window_rotate(
		input clk,
		input rst,
		input [5:0] main_dir,
		input [17:0] kp_addr,
		input [7:0] cnt,
		input complete1,
		output reg [17:0] addr_out
    );
	 
	 reg signed [4:0] y;
	 reg signed [13:0] x;
	 
	 wire signed [4:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
	 wire signed [4:0] x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35;
	 
	 wire signed [4:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17;
	 wire signed [4:0] y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31,y32,y33,y34,y35;
	 
	 reg signed [17:0] tmp;
	 
	 always@(posedge clk or negedge rst)
	 begin
		if(!rst)
		begin
			addr_out<=0;
			x<=0;
			y<=0;
			tmp<=0;
		end
		else
		begin
		if(complete1)
		begin
			case(main_dir)
				0: begin x<=x0<<8;y<=y0;end
				1: begin	x<=x1<<8;y<=y1;end
				2: begin	x<=x2<<8;y<=y2;end
				3: begin	x<=x3<<8;y<=y3;end
				4: begin	x<=x4<<8;y<=y4;end
				5: begin	x<=x5<<8;y<=y5;end
				6: begin	x<=x6<<8;y<=y6;end
				7: begin	x<=x7<<8;y<=y7;end
				8: begin	x<=x8<<8;y<=y8;end
				9: begin	x<=x9<<8;y<=y9;end
				10:	begin	x<=x10<<8;y<=y10;end
				11:	begin	x<=x11<<8;y<=y11;end
				12:	begin	x<=x12<<8;y<=y12;end
				13:	begin	x<=x13<<8;y<=y13;end
				14:	begin	x<=x14<<8;y<=y14;end
				15:	begin	x<=x15<<8;y<=y15;end
				16:	begin	x<=x16<<8;y<=y16;end
				17:	begin	x<=x17<<8;y<=y17;end
				18:	begin	x<=x18<<8;y<=y18;end
				19:	begin	x<=x19<<8;y<=y19;end
				20:	begin	x<=x20<<8;y<=y20;end
				21:	begin	x<=x21<<8;y<=y21;end
				22:	begin	x<=x22<<8;y<=y22;end
				23:	begin	x<=x23<<8;y<=y23;end
				24:	begin	x<=x24<<8;y<=y24;end
				25:	begin	x<=x25<<8;y<=y25;end
				26:	begin	x<=x26<<8;y<=y26;end
				27:	begin	x<=x27<<8;y<=y27;end
				28:	begin	x<=x28<<8;y<=y28;end
				29:	begin	x<=x29<<8;y<=y29;end
				30:	begin	x<=x30<<8;y<=y30;end
				31:	begin	x<=x31<<8;y<=y31;end
				32:	begin	x<=x32<<8;y<=y32;end
				33:	begin	x<=x33<<8;y<=y33;end
				34:	begin	x<=x34<<8;y<=y34;end
				35:	begin	x<=x35<<8;y<=y35;end	
				default:begin x<=0;y<=0; end
			endcase
		end
		
		else
		begin
			case(main_dir)
				0:	begin 	x<=x0<<9;y<=y0;end
				1:	begin	x<=x1<<9;y<=y1;end
				2:	begin	x<=x2<<9;y<=y2;end
				3:	begin	x<=x3<<9;y<=y3;end
				4:	begin	x<=x4<<9;y<=y4;end
				5:	begin	x<=x5<<9;y<=y5;end
				6:	begin	x<=x6<<9;y<=y6;end
				7:	begin	x<=x7<<9;y<=y7;end
				8:	begin	x<=x8<<9;y<=y8;end
				9:	begin	x<=x9<<9;y<=y9;end
				10:	begin	x<=x10<<9;y<=y10;end
				11:	begin	x<=x11<<9;y<=y11;end
				12:	begin	x<=x12<<9;y<=y12;end
				13:	begin	x<=x13<<9;y<=y13;end
				14:	begin	x<=x14<<9;y<=y14;end
				15:	begin	x<=x15<<9;y<=y15;end
				16:	begin	x<=x16<<9;y<=y16;end
				17:	begin	x<=x17<<9;y<=y17;end
				18:	begin	x<=x18<<9;y<=y18;end
				19:	begin	x<=x19<<9;y<=y19;end
				20:	begin	x<=x20<<9;y<=y20;end
				21:	begin	x<=x21<<9;y<=y21;end
				22:	begin	x<=x22<<9;y<=y22;end
				23:	begin	x<=x23<<9;y<=y23;end
				24:	begin	x<=x24<<9;y<=y24;end
				25:	begin	x<=x25<<9;y<=y25;end
				26:	begin	x<=x26<<9;y<=y26;end
				27:	begin	x<=x27<<9;y<=y27;end
				28:	begin	x<=x28<<9;y<=y28;end
				29:	begin	x<=x29<<9;y<=y29;end
				30:	begin	x<=x30<<9;y<=y30;end
				31:	begin	x<=x31<<9;y<=y31;end
				32:	begin	x<=x32<<9;y<=y32;end
				33:	begin	x<=x33<<9;y<=y33;end
				34:	begin	x<=x34<<9;y<=y34;end
				35:	begin	x<=x35<<9;y<=y35;end	
				default:begin x<=0;y<=0; end
			endcase
		end
			tmp<=x+y;
			addr_out<=tmp+kp_addr;
		end
	 end
	 
	 
	 //************* 读取 ROM 预先存储的数据*****************// 
	 dir0_1 U_0_1( 	.a(cnt),	.spo(x0));
	 dir1_1 U_1_1(  .a(cnt),   .spo(x1) ); 
	 dir2_1 U_2_1(  .a(cnt),   .spo(x2) ); 
	 dir3_1 U_3_1(  .a(cnt),   .spo(x3) );
	 dir4_1 U_4_1(  .a(cnt),   .spo(x4) );  
	 dir5_1 U_5_1(  .a(cnt),   .spo(x5) ); 
	 dir6_1 U_6_1(  .a(cnt),   .spo(x6) );
	 dir7_1 U_7_1(  .a(cnt),   .spo(x7) );  
	 dir8_1 U_8_1(  .a(cnt),   .spo(x8) );  
	 dir9_1 U_9_1(  .a(cnt),   .spo(x9) ); 
	 dir10_1 U_10_1(  .a(cnt),   .spo(x10) );
	 dir11_1 U_11_1(  .a(cnt),   .spo(x11) );
	 dir12_1 U_12_1(  .a(cnt),   .spo(x12) );
	 dir13_1 U_13_1(  .a(cnt),   .spo(x13) );
	 dir14_1 U_14_1(  .a(cnt),   .spo(x14) );
	 dir15_1 U_15_1(  .a(cnt),   .spo(x15) );
	 dir16_1 U_16_1(  .a(cnt),   .spo(x16) );
	 dir17_1 U_17_1(  .a(cnt),   .spo(x17) );
	 dir18_1 U_18_1(  .a(cnt),   .spo(x18) );
	 dir19_1 U_19_1(  .a(cnt),   .spo(x19) );
	 dir20_1 U_20_1(  .a(cnt),   .spo(x20) );
	 dir21_1 U_21_1(  .a(cnt),   .spo(x21) );
	 dir22_1 U_22_1(  .a(cnt),   .spo(x22) );
	 dir23_1 U_23_1(  .a(cnt),   .spo(x23) );
	 dir24_1 U_24_1(  .a(cnt),   .spo(x24) );
	 dir25_1 U_25_1(  .a(cnt),   .spo(x25) );
	 dir26_1 U_26_1(  .a(cnt),   .spo(x26) );
	 dir27_1 U_27_1(  .a(cnt),   .spo(x27) );
	 dir28_1 U_28_1(  .a(cnt),   .spo(x28) );
	 dir29_1 U_29_1(  .a(cnt),   .spo(x29) );
	 dir30_1 U_30_1(  .a(cnt),   .spo(x30) );
	 dir31_1 U_31_1(  .a(cnt),   .spo(x31) );
	 dir32_1 U_32_1(  .a(cnt),   .spo(x32) );
	 dir33_1 U_33_1(  .a(cnt),   .spo(x33) );
	 dir34_1 U_34_1(  .a(cnt),   .spo(x34) );
	 dir35_1 U_35_1(  .a(cnt),   .spo(x35) );
	 
	 dir0_2 U_0_2(  .a(cnt),   .spo(y0) ); 
	 dir1_2 U_1_2(  .a(cnt),   .spo(y1) ); 
	 dir2_2 U_2_2(  .a(cnt),   .spo(y2) ); 
	 dir3_2 U_3_2(  .a(cnt),   .spo(y3) );
	 dir4_2 U_4_2(  .a(cnt),   .spo(y4) );  
	 dir5_2 U_5_2(  .a(cnt),   .spo(y5) ); 
	 dir6_2 U_6_2(  .a(cnt),   .spo(y6) );
	 dir7_2 U_7_2(  .a(cnt),   .spo(y7) );  
	 dir8_2 U_8_2(  .a(cnt),   .spo(y8) );  
	 dir9_2 U_9_2(  .a(cnt),   .spo(y9) ); 
	 dir10_2 U_10_2(  .a(cnt),   .spo(y10) );
	 dir11_2 U_11_2(  .a(cnt),   .spo(y11) );
	 dir12_2 U_12_2(  .a(cnt),   .spo(y12) );
	 dir13_2 U_13_2(  .a(cnt),   .spo(y13) );
	 dir14_2 U_14_2(  .a(cnt),   .spo(y14) );
	 dir15_2 U_15_2(  .a(cnt),   .spo(y15) );
	 dir16_2 U_16_2(  .a(cnt),   .spo(y16) );
	 dir17_2 U_17_2(  .a(cnt),   .spo(y17) );
	 dir18_2 U_18_2(  .a(cnt),   .spo(y18) );
	 dir19_2 U_19_2(  .a(cnt),   .spo(y19) );
	 dir20_2 U_20_2(  .a(cnt),   .spo(y20) );
	 dir21_2 U_21_2(  .a(cnt),   .spo(y21) );
	 dir22_2 U_22_2(  .a(cnt),   .spo(y22) );
	 dir23_2 U_23_2(  .a(cnt),   .spo(y23) );
	 dir24_2 U_24_2(  .a(cnt),   .spo(y24) );
	 dir25_2 U_25_2(  .a(cnt),   .spo(y25) );
	 dir26_2 U_26_2(  .a(cnt),   .spo(y26) );
	 dir27_2 U_27_2(  .a(cnt),   .spo(y27) );
	 dir28_2 U_28_2(  .a(cnt),   .spo(y28) );
	 dir29_2 U_29_2(  .a(cnt),   .spo(y29) );
	 dir30_2 U_30_2(  .a(cnt),   .spo(y30) );
	 dir31_2 U_31_2(  .a(cnt),   .spo(y31) );
	 dir32_2 U_32_2(  .a(cnt),   .spo(y32) );
	 dir33_2 U_33_2(  .a(cnt),   .spo(y33) );
	 dir34_2 U_34_2(  .a(cnt),   .spo(y34) );
	 dir35_2 U_35_2(  .a(cnt),   .spo(y35) );
	 


endmodule
