`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    11:11:18 06/10/11
// Design Name:    
// Module Name:    my_fifo_128
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module my_fifo256(clk, rst, rd_en, wr_en, din, dout, empty, full, cnt);
    input clk;
    input rst;
    input rd_en;
    input wr_en;
    input [7:0] din;
    output [7:0] dout;
    output empty;
    output full;
	 output cnt; 
	
	 parameter size=512;
	 parameter deep=9;

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

/*	 always@(posedge clk or  negedge rst)
	 begin
	 	if(!rst)
		begin

			rd_ptr=0;
			wr_ptr=0;
			dout=0;
			cnt=0;			

		end
		else
		begin
			
			case({rd_en,wr_en})
			0:			cnt=cnt;
			1:			
				begin
					ram[wr_ptr]<=din;
					cnt=cnt+1;
					wr_ptr=(wr_ptr==127)?0:wr_ptr+1;
				end
			2:
				begin
					dout<=ram[rd_ptr];
					cnt=cnt-1;
					rd_ptr=(rd_ptr==127)?0:rd_ptr+1;					
				end
			
			3:
				begin
					if(cnt==2)
						dout=din;
					else
					begin
						ram[wr_ptr]<=din;
						dout<=ram[rd_ptr];
						wr_ptr=(wr_ptr==127)?0:wr_ptr+1;
						rd_ptr=(rd_ptr==127)?0:rd_ptr+1;
					end
				end
			endcase

		end

	 end
	 
	 assign full=(cnt==127);
	 assign empty=(cnt==0);

  */	 




endmodule
