`timescale 1ns / 1ps

/*
	Input:
		时钟、复位
		din: 串行图像梯度和方向，关键点信号
		kp_addr: 关键点的图像坐标
		mag: 梯度幅值输入
		dir: 梯度方向输入
	Output:
		grad_dir_addr: 
		dir_out: 主方向的计算结果
		out_en: 输出有效标志位
	Description:	
		主方向计算模块
*/


module main_ori(
		input clk,
		input rst,
		input [17:0] kp_addr,
		input [7:0] mag,
		input [5:0] dir,
		output reg [17:0] grad_dir_addr,
		output reg [5:0] dir_out,
		output reg out_en
    );
	 
	reg [8:0] cnt;
	reg [8:0] cnt_en;
	wire [5:0] spo;
	
	reg [5:0] dir1,dir2,dir3;
	
	reg [19:0] mg1,mg2,mg3,mg4,mg5,mg6,mg7,mg8,mg9,mg10,mg11,mg12,mg13,mg14,mg15,mg16,mg17,mg18,mg19,mg20;
	reg [19:0] mg21,mg22,mg23,mg24,mg25,mg26,mg27,mg28,mg29,mg30,mg31,mg32,mg33,mg34,mg35,mg36;
	
	wire [11:0] mul_tmp;
	reg [19:0] tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7,tmp8,tmp9;
	reg [19:0] tmp10,tmp11,tmp12,tmp13,tmp14,tmp15,tmp16,tmp17,tmp18;
	reg [19:0] tmp21,tmp22,tmp23,tmp24,tmp25,tmp26,tmp27,tmp28,tmp29;
	reg [19:0] tmp31,tmp32,tmp33,tmp34,tmp35;
	reg [19:0] tmp41,tmp42,tmp43;
	reg [19:0] tmp51,tmp52;
	
	reg [5:0] tn1,tn2,tn3,tn4,tn5,tn6,tn7,tn8,tn9;
	reg [5:0] tn10,tn11,tn12,tn13,tn14,tn15,tn16,tn17,tn18;
	reg [5:0] tn21,tn22,tn23,tn24,tn25,tn26,tn27,tn28,tn29;
	reg [5:0] tn31,tn32,tn33,tn34,tn35;
	reg [5:0] tn41,tn42,tn43;
	reg [5:0] tn51,tn52;

	//*************  梯度和方向ROM控制模块*****************//
	reg [3:0] cnt_addr1;
	reg [3:0] cnt_addr2;
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			grad_dir_addr<=0;
			cnt_addr1<=0;
			cnt_addr2<=0;
		end
		else
		begin
			if(cnt_addr1>9)
			begin
				cnt_addr2<=cnt_addr2+1;
				cnt_addr1<=0;
			end
			else
			begin
				cnt_addr1<=cnt_addr1+1;
			end
			
			case(cnt_addr2)
				0:	begin grad_dir_addr<=kp_addr-2565+cnt_addr1; end
				1:	begin grad_dir_addr<=kp_addr-2053+cnt_addr1; end
				2:	begin grad_dir_addr<=kp_addr-1541+cnt_addr1; end
				3:	begin grad_dir_addr<=kp_addr-1029+cnt_addr1; end
				4:	begin grad_dir_addr<=kp_addr- 517+cnt_addr1; end
				5:	begin grad_dir_addr<=kp_addr-   5+cnt_addr1; end
				6:	begin grad_dir_addr<=kp_addr+ 507+cnt_addr1; end
				7:	begin grad_dir_addr<=kp_addr+1019+cnt_addr1; end
				8:	begin grad_dir_addr<=kp_addr+1531+cnt_addr1; end
				9:	begin grad_dir_addr<=kp_addr+2043+cnt_addr1; end
			  	10:	begin grad_dir_addr<=kp_addr+2555+cnt_addr1; end
			   default:begin grad_dir_addr<=0; end
			endcase
			
		end
	end

	 
	//************  主函数模块，主要计算量*******************//
	//	计算梯度方向直方图
	//	计算直方图极大值 
	 always@(posedge clk or negedge rst)
	 begin
		if(!rst)
		begin
			cnt<=0;
			dir_out<=6'bzzzzzz;
			mg1<=0;mg2<=0;mg3<=0;mg4<=0;mg5<=0;mg6<=0;mg7<=0;mg8<=0;mg9<=0;
			mg10<=0;mg11<=0;mg12<=0;mg13<=0;mg14<=0;mg15<=0;mg16<=0;mg17<=0;mg18<=0;mg19<=0;
			mg20<=0;mg21<=0;mg22<=0;mg23<=0;mg24<=0;mg25<=0;mg26<=0;mg27<=0;mg28<=0;mg29<=0;
			mg30<=0;mg31<=0;mg32<=0;mg33<=0;mg34<=0;mg35<=0;mg36<=0;
		end
		else
		begin	
			dir1<=dir;
			dir2<=dir1;
			dir3<=dir2;
		
		//方向梯度直方图——累加部分
			if(cnt<128)
			begin
				cnt<=cnt+1;
				case(dir1)
					0: begin mg1<= mg1+mul_tmp;end
					1: begin mg2<= mg2+mul_tmp;end
					2: begin mg3<= mul_tmp+mg3;end
					3: begin mg4<= mul_tmp+mg4;end
					4: begin mg5<= mul_tmp+mg5;end
					5: begin mg6<= mul_tmp+mg6;end
					6: begin mg7<= mul_tmp+mg7;end
					7: begin mg8<= mul_tmp+mg8;end
					8: begin mg9<= mul_tmp+mg9;end
					9: begin mg10<=mul_tmp+mg10;end
					10:begin mg11<=mul_tmp+mg11;end
					11:begin mg12<=mul_tmp+mg12;end
					12:begin mg13<=mul_tmp+mg13;end
					13:begin mg14<=mul_tmp+mg14;end
					14:begin mg15<=mul_tmp+mg15;end
					15:begin mg16<=mul_tmp+mg16;end
					16:begin mg17<=mul_tmp+mg17;end
					17:begin mg18<=mul_tmp+mg18;end
					18:begin mg19<=mul_tmp+mg19;end
					19:begin mg20<=mul_tmp+mg20;end
					20:begin mg21<=mul_tmp+mg21;end
					21:begin mg22<=mul_tmp+mg22;end
					22:begin mg23<=mul_tmp+mg23;end
					23:begin mg24<=mul_tmp+mg24;end
					24:begin mg25<=mul_tmp+mg25;end
					25:begin mg26<=mul_tmp+mg26;end
					26:begin mg27<=mul_tmp+mg27;end
					27:begin mg28<=mul_tmp+mg28;end
					28:begin mg29<=mul_tmp+mg29;end
					29:begin mg30<=mul_tmp+mg30;end
					30:begin mg31<=mul_tmp+mg31;end
					31:begin mg32<=mul_tmp+mg32;end
					32:begin mg33<=mul_tmp+mg33;end
					33:begin mg34<=mul_tmp+mg34;end
					34:begin mg35<=mul_tmp+mg35;end
					35:begin mg36<=mul_tmp+mg36;end
					//default:
				endcase
			end
			
			// 生成梯度直方图后采用并行比较的方法得到主方向，会有几个周期的延迟
			else   //cnt>=256
			begin
				tmp1  <= mg1 > mg2?mg1:mg2;
				tn1   <= mg1 > mg2?0:1;
				tmp2  <= mg3 > mg4?mg3:mg4;
				tn2   <= mg3 > mg4?2:3;
				tmp3  <= mg5 > mg6?mg5:mg6;
				tn3   <= mg5 > mg6?4:5;
				tmp4  <= mg7 > mg8?mg7:mg8;
				tn4   <= mg7 > mg8?6:7;
				tmp5  <= mg9 > mg10?mg9:mg10;
				tn5   <= mg9 > mg10?8:9;
				tmp6  <= mg11 > mg12?mg11:mg12;
				tn6   <= mg11 > mg12?10:11;
				tmp7  <= mg13 > mg14?mg13:mg14;
				tn7   <= mg13 > mg14?12:13;
				tmp8  <= mg15 > mg16?mg15:mg16;
				tn8   <= mg15 > mg16?14:15;
				tmp9  <= mg17 > mg18?mg17:mg18;
				tn9   <= mg17 > mg18?16:17;
				tmp10  <= mg19 > mg20?mg19:mg20;
				tn10   <= mg19 > mg20?18:19;
				tmp11  <= mg21 > mg22?mg21:mg22;
				tn11   <= mg21 > mg22?20:21;
				tmp12  <= mg23 > mg24?mg23:mg24;
				tn12   <= mg23 > mg24?22:23;
				tmp13  <= mg25 > mg26?mg25:mg26;
				tn13   <= mg25 > mg26?24:25;
				tmp14  <= mg27 > mg28?mg27:mg28;
				tn14   <= mg27 > mg28?26:27;
				tmp15  <= mg29 > mg30?mg29:mg30;
				tn15   <= mg29 > mg30?28:29;
				tmp16  <= mg31 > mg32?mg31:mg32;
				tn16   <= mg31 > mg32?30:31;
				tmp17  <= mg33 > mg34?mg33:mg34;
				tn17   <= mg33 > mg34?32:33;
				tmp18  <= mg35 > mg36?mg35:mg36;
				tn18   <= mg35 > mg36?34:35;
				
				tmp21  <= tmp1 > tmp2?tmp1:tmp2;
				tn21   <= tmp1 > tmp2?tn1:tn2;
				tmp22  <= tmp3 > tmp4?tmp3:tmp4;
				tn22   <= tmp3 > tmp4?tn3:tn4;
				tmp23  <= tmp5 > tmp6?tmp5:tmp6;
				tn23   <= tmp5 > tmp6?tn5:tn6;
				tmp24  <= tmp7 > tmp8?tmp7:tmp8;
				tn24   <= tmp7 > tmp8?tn7:tn8;
				tmp25  <= tmp9 > tmp10?tmp9:tmp10;
				tn25   <= tmp9 > tmp10?tn9:tn10;
				tmp26  <= tmp11 > tmp12?tmp11:tmp12;
				tn26   <= tmp11 > tmp12?tn11:tn12;
				tmp27  <= tmp13 > tmp14?tmp13:tmp14;
				tn27   <= tmp13 > tmp14?tn13:tn14;
				tmp28  <= tmp15 > tmp16?tmp15:tmp16;
				tn28   <= tmp15 > tmp16?tn15:tn16;
				tmp29  <= tmp17 > tmp18?tmp17:tmp18;
				tn29   <= tmp17 > tmp18?tn17:tn18;
				
				tmp31  <= tmp21 > tmp22?tmp21:tmp22;
				tn31   <= tmp21 > tmp22?tn21:tn22;
				tmp32  <= tmp23 > tmp24?tmp23:tmp24;
				tn32   <= tmp23 > tmp24?tn23:tn24;
				tmp33  <= tmp25 > tmp26?tmp25:tmp26;
				tn33   <= tmp25 > tmp26?tn25:tn26;
				tmp34  <= tmp27 > tmp28?tmp27:tmp28;
				tn34   <= tmp27 > tmp28?tn27:tn28;
				tmp35  <= tmp29;// > tmp22?tmp21:tm22;
				tn35   <= tn29;
				
				tmp41  <= tmp31 > tmp32?tmp31:tmp32;
				tn41   <= tmp31 > tmp32?tn31:tn32;
				tmp42  <= tmp33 > tmp34?tmp33:tmp34;
				tn42   <= tmp33 > tmp34?tn33:tn34;
				tmp43  <= tmp35;
				tn43   <= tn35;
				
				tmp51  <= tmp41 > tmp42?tmp41:tmp42;
				tn51   <= tmp41 > tmp42?tn41:tn42;
				tmp52  <= tmp43;
				tn52   <= tn43;
				
				dir_out <= tmp51 > tmp52?tn51:tn52;
			
			end
		end
	 end

//*************输出使能控制函数**************//	 
	 always @(posedge clk or negedge rst)
	 begin
		if(!rst)
		begin
			cnt_en<=0;
			out_en<=0;
		end
		else
		begin
			if(cnt_en<134) begin
				out_en<=0;
				cnt_en<=cnt_en+1;
			end
			else
				out_en<=1;
		end
	 end
	 

	 wire [15:0] t2;
	 assign mul_tmp=t2[11:0];

	//*********** 参数ROM模块***************//	 
		main_ori_rom_distr U_main_coe(
			.a(cnt), // input [6 : 0] a
			.spo(spo) // output [5 : 0] spo
		);
					

	//***********乘法器模块***************//

		mul_desc main_mul(
			.clk		(clk),
			.rstn		(rst),
			.al			({11'd0, mag}),
			.cl			({12'd0, spo}),	
			.r			(t2)
		);

endmodule
