`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:51 12/31/2011 
// Design Name: 
// Module Name:    my_fifo2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module my_fifo2(clk, rst, rd_en, wr_en, din, dout, empty, full, cnt);
    input clk;
    input rst;
    input rd_en;
    input wr_en;
    input [7:0] din;
    output [7:0] dout;
    output empty;
    output full;
	 output cnt; 
	
	 parameter size=256;			//depth 128byte
	 parameter deep=8;

	 reg[7:0] ram[0:size-1];
	 reg[7:0] dout;
	 reg empty;
	 reg full;
	 reg [(deep-1):0] rd_ptr,wr_ptr,cnt;

	 always @(posedge clk)
	 begin
	 	if(!rst)
			begin
				dout<=8'bzzzzzzzz;

			end
		else if(rd_en==1&&empty==0)
		begin
			dout<=ram[rd_ptr];
		end

	 end

	 always@(posedge clk)
	 begin
	 	if(rst&&wr_en)//&&!full)
		begin
			ram[wr_ptr]<=din;
		end
	 end

	 always@(posedge clk)
	 begin
	 	if(!rst)
		begin
			wr_ptr<=0;
		end
		else
		begin
			if(wr_en)//&&!full)
			begin
				wr_ptr<=wr_ptr+1;
			end
		end
	 end

	 always@(posedge clk)
	 begin
	 	if(!rst)
		begin
			rd_ptr<=0;
		end
		else
		begin
			if(rd_en&&!empty)
			begin
				rd_ptr<=rd_ptr+1;
			end
		end
	 end


	 always@(posedge clk)
	 begin
	 	if(!rst)
		begin
			cnt<=0;
		end
		else
		begin
		case({rd_en,wr_en})
			0:	cnt<=cnt;
			1:	if(cnt!=(size-1)) cnt<=cnt+1;
			2:	if(cnt!=0) cnt<=cnt-1;
			3:	cnt<=cnt;
		endcase
		end
	 end

	 always @ (cnt)
	 begin
	 	if(cnt==0)
			empty<=1;
		else
			empty<=0;
		if(cnt==(size-2))
			full<=1;
		else
			full<=0;
	 end



endmodule

