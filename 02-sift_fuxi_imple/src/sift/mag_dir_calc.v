`timescale 1ns / 1ps
/*
	Input:
		时钟、复位
		dx, dy: x和y方向上的梯度
	Output:
		mag: 梯度的大小
		dir: 梯度的方向
		out_en: 输出结果有效
	Description:	
		根据x，y方向的梯度dx, dy，计算梯度大小和梯度的方向
		梯度大小直接将dx和dy的绝对值相加，方向被离散化成为36个数值，用查找表计算得到
*/

module mag_dir_calc(
    input clk,
    input rst,
    input [7:0] dx,
    input [7:0] dy,
	output reg [7:0] mag,
    output reg [5:0] dir,
    output reg out_en
);
	 
	parameter w=8;                    //数据宽度，修改时应同时修改端口数据宽度
	
	parameter dir00=6'b00_0000;       //查表法读取36个梯度方向
	parameter dir01=6'b01_0000;
	parameter dir1=6'b00_0001;
	parameter dir2=6'b00_0010;
	parameter dir3=6'b00_0011;
	parameter dir4=6'b00_0100;
	parameter dir5=6'b00_0101;
	parameter dir6=6'b00_0110;
	parameter dir7=6'b00_0111;
	parameter dir8=6'b00_1000;
	parameter dir90=6'b00_1001;
	parameter dir91=6'b10_1001;
	parameter dir10=6'b10_1000;
	parameter dir11=6'b10_0111;
	parameter dir12=6'b10_0110;
	parameter dir13=6'b10_0101;
	parameter dir14=6'b10_0100;
	parameter dir15=6'b10_0011;
	parameter dir16=6'b10_0010;
	parameter dir17=6'b10_0001;
	parameter dir180=6'b10_0000;
	parameter dir181=6'b11_0000;
	parameter dir19=6'b11_0001;
	parameter dir20=6'b11_0010;
	parameter dir21=6'b11_0011;
	parameter dir22=6'b11_0100;
	parameter dir23=6'b11_0101;
	parameter dir24=6'b11_0110;
	parameter dir25=6'b11_0111;
	parameter dir26=6'b11_1000;
	parameter dir270=6'b11_1001;
	parameter dir271=6'b01_1001;
	parameter dir28=6'b01_1000;
	parameter dir29=6'b01_0111;
	parameter dir30=6'b01_0110;
	parameter dir31=6'b01_0101;
	parameter dir32=6'b01_0100;
	parameter dir33=6'b01_0011;
	parameter dir34=6'b01_0010;
	parameter dir35=6'b01_0001;
	
		 
	wire [1:0] a;
	wire [w-1:0] abs_dx;
	wire [w-1:0] abs_dy;
	wire [w-1+4:0] tx1,tx2,tx3,tx4;  //移位操作后数据宽度变大
	wire [w-1+4:0] ty1,ty2,ty3,ty4;  //移位操作后数据宽度变大
	wire [7:0] mag1;
	reg [3:0] b;
	
	assign a[1]=dx[w-1];
	assign a[0]=dy[w-1];
	
	assign abs_dx=(dx[w-1]==0)?dx:(~dx+1);
	assign abs_dy=(dy[w-1]==0)?dy:(~dy+1);
	
	assign mag1=abs_dx+abs_dy;               //计算梯度值
	
	assign tx1=(abs_dx<<3)+(abs_dx<<2)-(abs_dx>>1);  //8+4-0.5
	assign tx2=(abs_dx<<2)-(abs_dx>>1);
	assign tx3=abs_dx<<1;
	assign tx4=(abs_dx<<1)-(abs_dx>>1);
	
	assign ty1=(abs_dy<<3)+(abs_dy<<2);
	assign ty2=(abs_dy<<2)-(abs_dy>>1);
	assign ty3=abs_dy<<1;
	assign ty4=(abs_dy<<1)-(abs_dy>>1);
	
	always @(abs_dx,abs_dy)
	begin
	if(abs_dx==0 && abs_dy==0)
		b<=4'b0000;
	else if(abs_dx>ty1)
		b<=4'b0000;
	else if((abs_dx>ty2)&&(abs_dx<=ty1))
		b<=4'b0001;
	else if((abs_dx>ty3)&&(abs_dx<=ty2))
		b<=4'b0010;
	else if((abs_dx>ty4)&&(abs_dx<=ty3))
		b<=4'b0011;
	else if((abs_dx>abs_dy)&&(abs_dx<=ty4))
		b<=4'b0100;
	else if((abs_dy>=abs_dx)&&(abs_dy<=tx4))
		b<=4'b0101;
	else if((abs_dy>tx4)&&(abs_dy<=tx3))
		b<=4'b0110;
	else if((abs_dy>tx3)&&(abs_dy<=tx2))
		b<=4'b0111;
	else if((abs_dy>tx2)&&(abs_dy<=tx1))
		b<=4'b1000;
	else if(abs_dy>tx1)
		b<=4'b1001;
	else
		b<=4'b0000;
	end
	
	
	always @(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			out_en<=0;
			mag<=0;
		end
		else
		begin
			out_en<=1;
//			$monitor("%d,%d,tx1:%d,tx2:%d,tx3:%d,tx4:%d,%b",abs_dx,abs_dy,tx1,tx2,tx3,tx4,{a,b});
			mag<=mag1;
			case({a,b})              //LUT方法计算方向
			dir00 : dir<=0;
			dir01 : dir<=0;
			dir1  : dir<=1;
			dir2  : dir<=2;
			dir3  : dir<=3;
			dir4  : dir<=4;
			dir5  : dir<=5;
			dir6  : dir<=6;
			dir7  : dir<=7;
			dir8  : dir<=8;
			dir90 : dir<=9;
			dir91 : dir<=9;
			dir10 : dir<=10;
			dir11 : dir<=11;
			dir12 : dir<=12;
			dir13 : dir<=13;
			dir14 : dir<=14;
			dir15 : dir<=15;
			dir16 : dir<=16;
			dir17 : dir<=17;
			dir180: dir<=18;
			dir181: dir<=18;
			dir19 : dir<=19;
			dir20 : dir<=20;
			dir21 : dir<=21;
			dir22 : dir<=22;
			dir23 : dir<=23;
			dir24 : dir<=24;
			dir25 : dir<=25;
			dir26 : dir<=26;
			dir270: dir<=27;
			dir271: dir<=27;
			dir28 : dir<=28;
			dir29 : dir<=29;
			dir30 : dir<=30;
			dir31 : dir<=31;
			dir32 : dir<=32;
			dir33 : dir<=33;
			dir34 : dir<=34;
			dir35 : dir<=35;
			default:dir<=6'b000000;
			endcase
		end
	 end


endmodule
