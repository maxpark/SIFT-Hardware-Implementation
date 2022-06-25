`timescale 1ns / 1ps 

/* 
    Slave Mode, always ready 
    busy when request tranfer, but valid when transfering actual data
*/

module dma_if#
(
    parameter  integer WR_MEM_SIZE  	   	 = 32'd512*512,         // rslt size
    parameter  integer WR_MEM_ADDR_OFFSET    = 32'h500000,
    parameter  integer WR_FDMA_BURST_LEN     = 16'd64,              // 64个128bit in one package, corresponding to 6 bit addr

    parameter  integer RD_MEM_SIZE           = 32'd512*512,         // image size
    parameter  integer RD_MEM_ADDR_OFFSET    = 32'h300000,  
    parameter  integer RD_FDMA_BURST_LEN     = 16'd256,
    parameter  integer M_AXI_ADDR_WIDTH      = 32,
    parameter  integer M_AXI_DATA_WIDTH      = 128
)
(
    input 	 wire   							fdma_clk			,
    input 	 wire   							fdma_rstn			,

    /* user ports */
    input    wire                               load_cmd              ,
    input    wire [63:0]                         din                 ,
    input    wire                                din_en              ,


    output   wire [M_AXI_ADDR_WIDTH-1 : 0]      fdma_waddr          ,
    output   reg                                fdma_wareq          ,
    output   wire [15 : 0]                      fdma_wsize          , 
    input                                       fdma_wbusy          ,
    output   wire [M_AXI_DATA_WIDTH-1 :0]       fdma_wdata			,
    input  	 wire                               fdma_wvalid         ,
    output	 wire                               fdma_wready			,

    output   wire [M_AXI_ADDR_WIDTH-1 : 0]      fdma_raddr          ,
    output   reg                                fdma_rareq          ,
    output   wire [15 : 0]                      fdma_rsize          ,                                     
    input                                       fdma_rbusy          ,

    input    wire [M_AXI_DATA_WIDTH-1 :0]       fdma_rdata			,
    input    wire                               fdma_rvalid         ,
    
    output	 wire                               fdma_rready			,

    output   wire  [2  :0] 						fdma_T_S			
);

/************** FIFO related signals *************/
wire [6:0]wr_data_cnt_ddr;
wire [5:0]rd_data_cnt_ddr;
wire empty_ddr;
wire full_ddr;

/*************************************************/


// edge, load image to ram
reg load_cmd_d = 1'b0;
always @(posedge fdma_clk) begin
    load_cmd_d <= load_cmd;
end

reg wr_cmd, wr_cmd_d;
always @(posedge fdma_clk or negedge fdma_rstn) begin
    if(~fdma_rstn) begin
        wr_cmd <= 1'b0;
        wr_cmd_d <= 1'b0;
    end
    else begin
        wr_cmd_d <= wr_cmd;

        // start one transfer
        if (wr_data_cnt_ddr > WR_FDMA_BURST_LEN * 2 - 1) begin     
            wr_cmd <= 1'b1;
        end
        else
            wr_cmd <= 1'b0;
    end
end

assign fdma_wready = 1'b1;
assign fdma_rready = 1'b1;



// 128bit / 8(bit/byte) = 16 bytes
localparam RD_ADDR_INC = RD_FDMA_BURST_LEN * 16;      // 256 * 128bit / 8(bit/bytes) = Read Address increment in bytes    
localparam WR_ADDR_INC = WR_FDMA_BURST_LEN * 16;      // 64 * 128bit / 8(bit/bytes) = Write Address increment in bytes

localparam IDLE   = 0;
localparam WRITE1 = 1;
localparam WRITE2 = 2;
localparam READ1  = 3;
localparam READ2  = 4;

reg [31: 0] fdma_waddr_r;
reg [31: 0] fdma_raddr_r;
reg [2  :0] T_S = IDLE;


/**************  读写地址  **************/
assign fdma_T_S = T_S;
assign fdma_waddr = fdma_waddr_r + WR_MEM_ADDR_OFFSET;
assign fdma_raddr = fdma_raddr_r + RD_MEM_ADDR_OFFSET;

assign fdma_wsize = WR_FDMA_BURST_LEN;             
assign fdma_rsize = RD_FDMA_BURST_LEN;             // 需要64次FDMA burst，64*16次AXI burst

  
//delay reset
reg [8:0] rst_cnt = 0;
always @(posedge fdma_clk)
	if(fdma_rstn==1'b0)
		rst_cnt <= 9'd0;
	else if(rst_cnt[8] == 1'b0 )
         rst_cnt <= rst_cnt + 1'b1;
     else 
         rst_cnt <= rst_cnt;



/* Test: Write->Read->IDLE*/
always @(posedge fdma_clk)begin
    if(rst_cnt[8] == 1'b0)begin
        T_S <= IDLE;                  // TODO: T_S <= IDLE;
        fdma_wareq  <= 1'b0; 
        fdma_rareq  <= 1'b0; 
        fdma_waddr_r <= 'd0;    
        fdma_raddr_r <= 'd0;
    end 
    else begin
        case(T_S)    
        IDLE:begin
            if(wr_cmd & ~wr_cmd_d)
                T_S <= WRITE1;
            else if(load_cmd & ~load_cmd_d)
                T_S <= READ1;
            else
                T_S <= IDLE;
        end

        WRITE1:begin
            if(fdma_waddr_r >= WR_MEM_SIZE) begin       /* if write finish or data finish */
                fdma_waddr_r<=0;
                T_S <= IDLE;
            end
            else begin
                if(!fdma_wbusy)begin
                    fdma_wareq  <= 1'b1; 
                end

                if(fdma_wareq && fdma_wbusy)begin
                    fdma_wareq  <= 1'b0; 
                    T_S         <= WRITE2;
                end
            end
        end

        WRITE2:begin
            if(!fdma_wbusy) begin
                fdma_waddr_r  <= fdma_waddr_r + WR_ADDR_INC;//128/8=16
                T_S <= WRITE1;
            end 
            else if(fdma_wvalid) begin

            end
        end

        READ1:begin
            if(fdma_raddr_r >= RD_MEM_SIZE) begin
                fdma_raddr_r<=0;
                T_S <= IDLE;
            end
            else begin
                if(!fdma_rbusy)begin
                    fdma_rareq  <= 1'b1; 
                end
                if(fdma_rareq && fdma_rbusy)begin
                    fdma_rareq  <= 1'b0; 
                    T_S         <= READ2;
                end 
            end
        end
        
        READ2:begin
            if(!fdma_rbusy) begin
                T_S <= READ1;
                fdma_raddr_r  <= fdma_raddr_r + RD_ADDR_INC;		// TODO: raddr fdma_waddr_r
            end 
            else if(fdma_rvalid) begin

            end
        end   
        default:
            T_S <= IDLE;     
        endcase
    end
  end

wire fifo_rst;
assign fifo_rst = (T_S==IDLE)?1'b0:1'b1;


/* 
*   FIFO中有127个数时启动一次传输，将fifo数据写入DDR
*   write: input->this fifo->ddr 
*/
fifo2ddr  u_fifo2ddr (
    .clk                     ( fdma_clk                ),
    .rst_n                   ( fifo_rst                ),

    .wen                     ( din_en               ),
    .wdata                   ( din        [63:0]     ),

    .ren                     ( fdma_wvalid          ),
    .rdata                   ( fdma_wdata   [127:0] ),

    .wr_data_cnt             ( wr_data_cnt_ddr  [6:0]  ),       // maximum:1023
    .rd_data_cnt             ( rd_data_cnt_ddr  [5:0]  ),

    .rempty                  ( empty_ddr               ),
    .wfull                   ( full_ddr                )
);





endmodule
