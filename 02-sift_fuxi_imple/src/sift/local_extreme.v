`timescale 1ns / 1ps

/*
	Input:
		时钟、复位
		diff0、diff1、diff2: 差分金字塔
	Output:
		dout: 极值点信号，表示当前数据为极值点
		max、min: 极值
		out_en: 输出有效

	Description:	
		SIFT算法中关键点定位的步骤， 3层的差分金字塔可以构建成一个长*宽*3的3维矩阵，
		在中间的那一层中，对每个像素点，考虑其邻域的3x3x3窗口，若其是邻域中的最大值或最小值，
		则其可作为极值点输出，即之后的SIFT关键点。
	Note:
		例化的block2_27extreme模块用于3x3x3窗口缓存，本模块中将窗口数据做比较，确定极值点
		判断该点是否为特征点的第一个过程为判断该点的值是否是 27 个数据中的最大值或者最小值，同时设置一定的阈值，去除低对比度特征点
*/

module local_extreme(
		input clk,
		input rst,
		input complete1,
		input  signed [7:0] diff0,
		input  signed [7:0] diff1,
		input  signed [7:0] diff2,
		output reg signed [7:0] max,
		output reg signed [7:0] min,
		output reg dout,
		output reg out_en
    );
	 
	 
	wire signed [7:0] d11;
	wire signed [7:0] d12;
	wire signed [7:0] d13;
	wire signed [7:0] d14;
	wire signed [7:0] d15;
	wire signed [7:0] d16;
	wire signed [7:0] d17;
	wire signed [7:0] d18;
	wire signed [7:0] d19;
	wire signed [7:0] d21;
	wire signed [7:0] d22;
	wire signed [7:0] d23;
	wire signed [7:0] d24;
	wire signed [7:0] d25;
	wire signed [7:0] d26;
	wire signed [7:0] d27;
	wire signed [7:0] d28;
	wire signed [7:0] d29;
	wire signed [7:0] d31;
	wire signed [7:0] d32;
	wire signed [7:0] d33;
	wire signed [7:0] d34;
	wire signed [7:0] d35;
	wire signed [7:0] d36;
	wire signed [7:0] d37;
	wire signed [7:0] d38;
	wire signed [7:0] d39;	 
	

	reg signed [7:0] m1[12:0];
	reg signed [7:0] m2[6:0];
	reg signed [7:0] m3[3:0];
	reg signed [7:0] m4[1:0];

	reg signed [7:0] n1[12:0];
	reg signed [7:0] n2[6:0];
	reg signed [7:0] n3[3:0];
	reg signed [7:0] n4[1:0];
	
	reg signed [7:0] d25_1;
	reg signed [7:0] d25_2;
	reg signed [7:0] d25_3;
	reg signed [7:0] d25_4;
	reg signed [7:0] d25_5;
	reg signed [7:0] d25_6;

	wire data_start;
	

	block2_27extreme blk2_27(
		.clk(clk),.rst(rst),.complete1(complete1),.diff0(diff0),.diff1(diff1),.diff2(diff2),.dout11(d11),
		.dout12(d12),.dout13(d13),.dout14(d14),.dout15(d15),.dout16(d16),.dout17(d17),
        .dout18(d18),.dout19(d19),.dout21(d21),.dout22(d22),.dout23(d23),.dout24(d24),
		.dout25(d25),.dout26(d26),.dout27(d27),.dout28(d28),.dout29(d29),
        .dout31(d31),.dout32(d32),.dout33(d33),.dout34(d34),.dout35(d35),
		.dout36(d36),.dout37(d37),.dout38(d38),.dout39(d39),.out_en(data_start)
	);
	

	always @(posedge clk or negedge rst)
	if(!rst)
	begin
		dout<=0;
		d25_1<=0;d25_2<=0;d25_3<=0;d25_4<=0;d25_5<=0;d25_6<=0;
		max <= 'd0; min <= 'd0;
	end
	else if(data_start)
	begin
		m1[12]<=d11>d16?d11:d16;  m1[7]<=d22>d28?d22:d28;  m1[2]<=d34>d37?d34:d37;
		m1[11]<=d12>d17?d12:d17;  m1[6]<=d23>d29?d23:d29;  m1[1]<=d35>d38?d35:d38;
		m1[10]<=d13>d18?d13:d18;  m1[5]<=d24>d31?d24:d31;  m1[0]<=d36>d39?d36:d39;
		m1[9]<=d14>d19?d14:d19;   m1[4]<=d26>d32?d26:d32;
		m1[8]<=d15>d21?d15:d21;   m1[3]<=d27>d33?d27:d33;
		
		d25_1<=d25;
		
		m2[6]<=m1[12]>m1[9]?m1[12]:m1[9];  m2[3]<=m1[6]>m1[4]?m1[6]:m1[4];  m2[1]<=m1[2]>m1[1]?m1[2]:m1[1];
		m2[5]<=m1[11]>m1[8]?m1[11]:m1[8];  m2[2]<=m1[5]>m1[3]?m1[5]:m1[3];  m2[0]<=m1[0];
		m2[4]<=m1[10]>m1[7]?m1[10]:m1[7];
			
		d25_2<=d25_1;
		
		m3[3]<=m2[6]>m2[4]?m2[6]:m2[4];  m3[1]<=m2[2]>m2[1]?m2[2]:m2[1];
		m3[2]<=m2[5]>m2[3]?m2[5]:m2[3];  m3[0]<=m2[0];
			
		d25_3<=d25_2;
		
		m4[1]<=m3[3]>m3[2]?m3[3]:m3[2];  m4[0]<=m3[1]>m3[0]?m3[1]:m3[0];
			
		d25_4<=d25_3;
		
		max<=m4[1]>m4[0]?m4[1]:m4[0];
			
		d25_5<=d25_4;
		
		n1[12]<=d11<d16?d11:d16;  n1[7]<=d22<d28?d22:d28;  n1[2]<=d34<d37?d34:d37;
		n1[11]<=d12<d17?d12:d17;  n1[6]<=d23<d29?d23:d29;  n1[1]<=d35<d38?d35:d38;
		n1[10]<=d13<d18?d13:d18;  n1[5]<=d24<d31?d24:d31;  n1[0]<=d36<d39?d36:d39;
		n1[9]<=d14<d19?d14:d19;   n1[4]<=d26<d32?d26:d32;
		n1[8]<=d15<d21?d15:d21;   n1[3]<=d27<d33?d27:d33;
		
		n2[6]<=n1[12]<n1[9]?n1[12]:n1[9];  n2[3]<=n1[6]<n1[4]?n1[6]:n1[4];  n2[1]<=n1[2]<n1[1]?n1[2]:n1[1];
		n2[5]<=n1[11]<n1[8]?n1[11]:n1[8];  n2[2]<=n1[5]<n1[3]?n1[5]:n1[3];  n2[0]<=n1[0];
		n2[4]<=n1[10]<n1[7]?n1[10]:n1[7];
		
		n3[3]<=n2[6]<n2[4]?n2[6]:n2[4];  n3[1]<=n2[2]<n2[1]?n2[2]:n2[1];
		n3[2]<=n2[5]<n2[3]?n2[5]:n2[3];  n3[0]<=n2[0];
		
		n4[1]<=n3[3]<n3[2]?n3[3]:n3[2];  n4[0]<=n3[1]<n3[0]?n3[1]:n3[0];
		
		min<=n4[1]<n4[0]?n4[1]:n4[0];
		
		if(out_en)
			dout<=(d25_5>max)||(d25_5<min);
			
	end
	 
	reg [3:0] cnt;
	always@(negedge clk or negedge rst)
	begin
		if(!rst)
		begin
			out_en<=0;
			cnt<=0;
		end
	else
	begin
		if(data_start)
		begin
			if(cnt<6)
				cnt<=cnt+1;
			else
				out_en<=1;
		end
		
	end
	end

endmodule
