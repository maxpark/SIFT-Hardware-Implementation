// ============================================================
// 
//
// Create Date: 05/29/2022 14:34:10   
// Design Name: SIFT_HW_IMPLEMENTATION
// Module Name: RISCV_P1_TOP
// Project Name: RISCV_P1_TOP
// Target Devices: P1
// Comments:
//		机器视觉领域中SIFT算法的硬件实现，在京微齐力P1器件上进行验证。
//      图像通过RISCV软核的串口写入DDR，再使用DMA传入FPGA的SIFT算法加速模块
//      在该模块中生成高斯差分金字塔，完成特征点定位、梯度幅值和方向的计算。
//		使用DMA将图像处理得到的结果写入DDR，再将结果通过软核串口输出。
//      
//		RISCV软核和FPGA通过GPIO和DMA分别进行控制指令和数据信息的交互
//
// ============================================================
module RISCV_P1_TOP (
    input        CLK_25M,
    input        RST_N,
	
    input        jtag_tms,
    input        jtag_tdi,
    output reg   jtag_tdo,
    input        jtag_tck,
	
	output       uart0_txd,
    input        uart0_rxd,
	 
    inout        i2c0_sda,
    inout        i2c0_scl,
	 
	output       spi0_clk, 
	input        spi0_miso,
	output       spi0_mosi,
	output       spi0_scl, 
	 
    output [3:0] led
);

 
wire              core_clk;
wire              core_reset;
wire              debounce_clk;
wire              memory_clk;

wire              clk_ddr;      
wire              rst_ddr_n; 
  
wire              clk_ddr_cfg;  
wire              rst_ddr_cfg_n;

wire              init_done;
wire              init_pass;
       				        
wire     [31:0]   gpio_in;
wire     [31:0]   gpio_out;
wire     [31:0]   gpio_out_en;

wire     [15:0]   apb_s0_paddr;
wire              apb_s0_psel;
wire              apb_s0_penable;
wire              apb_s0_pready;
wire              apb_s0_pwrite;
wire     [31:0]   apb_s0_pwdata;
wire     [31:0]   apb_s0_prdata;
wire              apb_s0_perror;

wire     [15:0]   apb_s1_paddr;
wire              apb_s1_psel;
wire              apb_s1_penable;
wire              apb_s1_pready;
wire              apb_s1_pwrite;
wire     [31:0]   apb_s1_pwdata;
wire     [31:0]   apb_s1_prdata;
wire              apb_s1_perror;
wire              apb_dev_intr;

wire              sys_reset_out;
wire              memory_reset_out;

wire              axi_ddr_arw_valid;
wire              axi_ddr_arw_ready;
wire     [31:0]   axi_ddr_arw_payload_addr;
wire     [7:0]    axi_ddr_arw_payload_id;
wire     [3:0]    axi_ddr_arw_payload_region;
wire     [7:0]    axi_ddr_arw_payload_len;
wire     [2:0]    axi_ddr_arw_payload_size;
wire     [1:0]    axi_ddr_arw_payload_burst;
wire     [0:0]    axi_ddr_arw_payload_lock;
wire     [3:0]    axi_ddr_arw_payload_cache;
wire     [3:0]    axi_ddr_arw_payload_qos;
wire     [2:0]    axi_ddr_arw_payload_prot;
wire              axi_ddr_arw_payload_write;
wire              axi_ddr_w_valid;
wire              axi_ddr_w_ready;
wire     [127:0]  axi_ddr_w_payload_data;
wire     [15:0]   axi_ddr_w_payload_strb;
wire              axi_ddr_w_payload_last;
wire              axi_ddr_b_valid;
wire              axi_ddr_b_ready;
wire     [7:0]    axi_ddr_b_payload_id;
wire     [1:0]    axi_ddr_b_payload_resp;
wire              axi_ddr_r_valid;
wire              axi_ddr_r_ready;
wire     [127:0]  axi_ddr_r_payload_data;
wire     [7:0]    axi_ddr_r_payload_id;
wire     [1:0]    axi_ddr_r_payload_resp;
wire              axi_ddr_r_payload_last;
wire     [7:0]    axi_ddr_w_payload_id;  

wire              axi_awvalid;
wire              axi_awready;
wire     [31:0]   axi_awaddr;
wire     [7:0]    axi_awid;
wire     [3:0]    axi_awregion;
wire     [7:0]    axi_awlen;
wire     [2:0]    axi_awsize;
wire     [1:0]    axi_awburst;
wire     [0:0]    axi_awlock;
wire     [3:0]    axi_awcache;
wire     [3:0]    axi_awqos;
wire     [2:0]    axi_awprot;
wire              axi_wvalid;
wire              axi_wready;
wire     [31:0]   axi_wdata;
wire     [3:0]    axi_wstrb;
wire              axi_wlast;
wire              axi_bvalid;
wire              axi_bready;
wire     [7:0]    axi_bid;
wire     [1:0]    axi_bresp;
wire              axi_arvalid;
wire              axi_arready;
wire     [31:0]   axi_araddr;
wire     [7:0]    axi_arid;
wire     [3:0]    axi_arregion;
wire     [7:0]    axi_arlen;
wire     [2:0]    axi_arsize;
wire     [1:0]    axi_arburst;
wire     [0:0]    axi_arlock;
wire     [3:0]    axi_arcache;
wire     [3:0]    axi_arqos;
wire     [2:0]    axi_arprot;
wire              axi_rvalid;
wire              axi_rready;
wire     [31:0]   axi_rdata;
wire     [7:0]    axi_rid;
wire     [1:0]    axi_rresp;
wire              axi_rlast;
wire              axi_dev_intr;	
 
wire              sys_clk; 
wire              sys_rstn; 
 
wire     [15:0]   axi_ddr_rid; 
wire     [15:0]   axi_ddr_bid;

wire              axi_ddr_aw_valid;            
wire              axi_ddr_aw_ready;            
wire     [31:0]   axi_ddr_aw_payload_addr;     
wire     [7:0]    axi_ddr_aw_payload_id;       
wire     [3:0]    axi_ddr_aw_payload_region;  
wire     [7:0]    axi_ddr_aw_payload_len;     
wire     [2:0]    axi_ddr_aw_payload_size;     
wire     [1:0]    axi_ddr_aw_payload_burst;    
wire     [0:0]    axi_ddr_aw_payload_lock;     
wire     [3:0]    axi_ddr_aw_payload_cache;    
wire     [3:0]    axi_ddr_aw_payload_qos;      
wire     [2:0]    axi_ddr_aw_payload_prot;     
 
wire              axi_ddr_ar_valid;
wire              axi_ddr_ar_ready;
wire     [31:0]   axi_ddr_ar_payload_addr;
wire     [7:0]    axi_ddr_ar_payload_id;
wire     [3:0]    axi_ddr_ar_payload_region;
wire     [7:0]    axi_ddr_ar_payload_len;
wire     [2:0]    axi_ddr_ar_payload_size;
wire     [1:0]    axi_ddr_ar_payload_burst; 
wire     [0:0]    axi_ddr_ar_payload_lock;
wire     [3:0]    axi_ddr_ar_payload_cache;
wire     [3:0]    axi_ddr_ar_payload_qos;
wire     [2:0]    axi_ddr_ar_payload_prot;


assign axi_ddr_aw_valid           = axi_ddr_arw_payload_write ? axi_ddr_arw_valid            : 1'b0;
assign axi_ddr_aw_payload_addr    = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_addr     : 32'd0;
assign axi_ddr_aw_payload_id      = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_id       : 8'd0;
assign axi_ddr_aw_payload_region  = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_region   : 4'd0;
assign axi_ddr_aw_payload_len     = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_len      : 8'd0;
assign axi_ddr_aw_payload_size    = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_size     : 3'd0;
assign axi_ddr_aw_payload_burst   = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_burst    : 2'd0;
assign axi_ddr_aw_payload_lock    = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_lock     : 1'b0;
assign axi_ddr_aw_payload_cache   = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_cache    : 4'd0;
assign axi_ddr_aw_payload_qos     = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_qos      : 4'd0;
assign axi_ddr_aw_payload_prot    = axi_ddr_arw_payload_write ? axi_ddr_arw_payload_prot     : 3'd0;
                                                                                               
                                                                                               
assign axi_ddr_ar_valid           = ~axi_ddr_arw_payload_write ? axi_ddr_arw_valid           : 1'b0;
assign axi_ddr_ar_payload_addr    = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_addr    : 32'd0;
assign axi_ddr_ar_payload_id      = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_id      : 8'd0;
assign axi_ddr_ar_payload_region  = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_region  : 4'd0;
assign axi_ddr_ar_payload_len     = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_len     : 8'd0;
assign axi_ddr_ar_payload_size    = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_size    : 3'd0;
assign axi_ddr_ar_payload_burst   = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_burst   : 2'd0;
assign axi_ddr_ar_payload_lock    = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_lock    : 1'b0;
assign axi_ddr_ar_payload_cache   = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_cache   : 4'd0;
assign axi_ddr_ar_payload_qos     = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_qos     : 4'd0;
assign axi_ddr_ar_payload_prot    = ~axi_ddr_arw_payload_write ? axi_ddr_arw_payload_prot    : 3'd0;
assign axi_ddr_arw_ready          = axi_ddr_arw_payload_write ? axi_ddr_aw_ready : axi_ddr_ar_ready;							      
assign axi_ddr_r_payload_id       = axi_ddr_rid[7:0];
assign axi_ddr_b_payload_id       = axi_ddr_bid[7:0];

reg  soc_tck,soc_tms,soc_tdi;
wire soc_tdo;

always @(*) begin
    {soc_tck,  soc_tms,  soc_tdi  } = {jtag_tck,jtag_tms,jtag_tdi};
    jtag_tdo = soc_tdo;
end

 
clk_rst_manage clk_rst_manage_ins(
    .CLK_25M          ( CLK_25M        ),
    .RST_N            ( RST_N          ),
	
	.o_sys_clk	      ( sys_clk	       ),			// 100M
	.o_core_clk       ( core_clk       ),			// 80M
	.o_debounce_clk   ( debounce_clk   ),
	.o_memory_clk     ( memory_clk     ),			// 80M
	.o_core_reset     ( core_reset     ),
	.o_sys_rstn       ( sys_rstn       ),	
	
	.o_clk_ddr        ( clk_ddr        ),  			// 200M
	.o_ddr_rstn       ( rst_ddr_n      ),
	.o_clk_ddr_cfg    ( clk_ddr_cfg    ),			// 25M
	.o_ddr_cfg_rstn   ( rst_ddr_cfg_n  )	
);
 
 
led_ctrl led_ctrl_ins(
    .sys_clk    ( sys_clk  ),
	.sys_rst_n  ( sys_rstn ),   
    .led_pin    ( led_pin  )	
);


assign apb_s0_pready             = 1'b1;
assign apb_s0_perror             = 1'b0;

assign apb_s1_pready             = 1'b1;
assign apb_s1_perror             = 1'b0;

assign axi_awready               = 1'b0;
assign axi_wready                = 1'b0;
assign axi_bvalid                = 1'b0;
assign axi_bid                   = 8'd0;
assign axi_bresp                 = 2'd0;
assign axi_arready               = 1'b0;
assign axi_rvalid                = 1'b0;
assign axi_rid                   = 8'd0;
assign axi_rresp                 = 2'd0;
 
assign userInterrupt             = 1'b0; 
assign axiAInterrupt             = 1'b0; 
	

localparam  M_AXI_ADDR_WIDTH      = 32;
localparam  M_AXI_DATA_WIDTH      = 128;
localparam  M_AXI_ID_WIDTH        = 16;
localparam  M_AXI_MAX_BURST_LEN   = 16;


localparam  WR_MEM_SIZE  	   	  = 32'd512*512*8*2;    // 64/8 = 8 bytes
localparam  RD_MEM_SIZE           = 32'd512*512;
localparam  WR_MEM_ADDR_OFFSET    = 32'h500000;         // calculation result addr
localparam  RD_MEM_ADDR_OFFSET    = 32'h300000;         // IMG addr

localparam  WR_FDMA_BURST_LEN       = 16'd64;
localparam  RD_FDMA_BURST_LEN       = 16'd256;                    //256个128位的数据，每次AXI burst发送16个，故有16次AXI burst, 一次传送128*512 = 8行

wire 								fdma_clk		    ;
wire  								fdma_rstn			;

wire [M_AXI_ADDR_WIDTH-1 : 0]       fdma0_waddr         ;
wire                                fdma0_wareq         ;
wire [15 : 0]                       fdma0_wsize         ;                                     
wire                                fdma0_wbusy         ;
				
wire [M_AXI_DATA_WIDTH-1 :0]        fdma0_wdata			;
wire                                fdma0_wvalid        ;
wire                                fdma0_wready	    ;

wire [M_AXI_ADDR_WIDTH-1 : 0]       fdma0_raddr         ;
wire                                fdma0_rareq         ;
wire [15 : 0]                       fdma0_rsize         ;                                     
wire                                fdma0_rbusy         ;
				
wire [M_AXI_DATA_WIDTH-1 :0]        fdma0_rdata			;
wire                                fdma0_rvalid        ;
wire                                fdma0_rready		;
				

wire 								fdma0_error			;
wire  [2  :0] 						fdma0_T_S			;



wire  								FDMA0_M_AXI_ACLK		;
wire  								FDMA0_M_AXI_ARESETN		;
wire [M_AXI_ID_WIDTH-1 : 0]		    FDMA0_M_AXI_AWID		;
wire [M_AXI_ADDR_WIDTH-1 : 0] 	    FDMA0_M_AXI_AWADDR		;
wire [7 : 0]						FDMA0_M_AXI_AWLEN		;
wire [2 : 0] 						FDMA0_M_AXI_AWSIZE		;
wire [1 : 0] 						FDMA0_M_AXI_AWBURST		;
wire  								FDMA0_M_AXI_AWVALID		;
wire  								FDMA0_M_AXI_AWREADY		;

wire [M_AXI_ID_WIDTH-1 : 0] 		FDMA0_M_AXI_WID			;
wire [M_AXI_DATA_WIDTH-1 : 0] 	    FDMA0_M_AXI_WDATA		;
wire [M_AXI_DATA_WIDTH/8-1 : 0] 	FDMA0_M_AXI_WSTRB		;
wire  								FDMA0_M_AXI_WLAST		; 			
wire  								FDMA0_M_AXI_WVALID		;
wire  								FDMA0_M_AXI_WREADY		;
wire [M_AXI_ID_WIDTH-1 : 0] 		FDMA0_M_AXI_BID			;
wire [1 : 0] 						FDMA0_M_AXI_BRESP		;
wire  								FDMA0_M_AXI_BVALID		;
wire  								FDMA0_M_AXI_BREADY		; 

wire [M_AXI_ID_WIDTH-1 : 0] 		FDMA0_M_AXI_ARID		;	 
wire [M_AXI_ADDR_WIDTH-1 : 0] 	    FDMA0_M_AXI_ARADDR		;	 	
wire [7 : 0] 						FDMA0_M_AXI_ARLEN		;	 
wire [2 : 0] 						FDMA0_M_AXI_ARSIZE		;	 
wire [1 : 0] 						FDMA0_M_AXI_ARBURST		;	 	   
wire  								FDMA0_M_AXI_ARVALID		;	 
wire  								FDMA0_M_AXI_ARREADY		;	

wire [M_AXI_ID_WIDTH-1 : 0] 		FDMA0_M_AXI_RID			;	 
wire [M_AXI_DATA_WIDTH-1 : 0] 	    FDMA0_M_AXI_RDATA		;	 
wire [1 : 0] 						FDMA0_M_AXI_RRESP		;	 
wire  								FDMA0_M_AXI_RLAST		;	 
wire  								FDMA0_M_AXI_RVALID		;    
wire  								FDMA0_M_AXI_RREADY		;

assign FDMA0_M_AXI_ACLK = sys_clk;			// sys_clk: 100M, memory_clk(axi_clk on port00): 80M
assign FDMA0_M_AXI_ARESETN = sys_rstn;




/***************** GPIO Command Signal *****************/
wire ps_rst_n;                  // 来自软核的复位信号
wire start_load;

assign start_load = gpio_out[1];            // 启动主控制器和DMA，将DDR读出到RAM中，we_img置0，sift模块开始处理
assign ps_rst_n = gpio_out[3];              // PS 软件复位

wire [63:0] data2ddr;
wire data2ddr_en;

dma_if#
(
    .WR_MEM_SIZE  	        (WR_MEM_SIZE),
    .WR_MEM_ADDR_OFFSET     (WR_MEM_ADDR_OFFSET),
    .WR_FDMA_BURST_LEN      (WR_FDMA_BURST_LEN),

    .RD_MEM_SIZE            (RD_MEM_SIZE),
    .RD_MEM_ADDR_OFFSET     (RD_MEM_ADDR_OFFSET),
    .RD_FDMA_BURST_LEN      (RD_FDMA_BURST_LEN),
    .M_AXI_ADDR_WIDTH       (M_AXI_ADDR_WIDTH),
    .M_AXI_DATA_WIDTH       (M_AXI_DATA_WIDTH)
)
u_if
(
    .fdma_clk			(FDMA0_M_AXI_ACLK	)   		,
    .fdma_rstn			(FDMA0_M_AXI_ARESETN	)			,

    .load_cmd           (start_load     )           ,
    
    .din                (data2ddr   )           ,
    .din_en             (data2ddr_en)           ,
    // .din_done           (complete2)             ,

    .fdma_waddr			(fdma0_waddr)           ,	//o
    .fdma_wareq			(fdma0_wareq)           ,	//o
    .fdma_wsize			(fdma0_wsize)           ,   //o
    .fdma_wbusy			(fdma0_wbusy)           ,	//i
                    
    .fdma_wdata			(fdma0_wdata)		    ,
    .fdma_wvalid		(fdma0_wvalid)          ,
    .fdma_wready		(fdma0_wready)		    ,

    .fdma_raddr			(fdma0_raddr)           ,
    .fdma_rareq			(fdma0_rareq)           ,
    .fdma_rsize			(fdma0_rsize)           ,                                     
    .fdma_rbusy			(fdma0_rbusy)           ,
                    
    .fdma_rdata			(fdma0_rdata)		    ,
    .fdma_rvalid		(fdma0_rvalid)          ,
    .fdma_rready		(fdma0_rready)		    ,

    .fdma_T_S           (fdma0_T_S)				
);


/************ RAM defines ***********/
reg we_img;                     // 通过PS写RAM，写入时将所有计算模块复位，we_img = 0时开始读出

// Port A (Common)
wire [17:0] addr_img_sift;      // SIFT模块中地址发生器，输出地址读RAM
wire [7:0] din_img, dout_img;
reg wr_done;


// Port B (AXI)
reg [13:0] addr_img_ddr;
wire [127:0] rd_back_data;

/************ SIFT signals ***********/
wire [17:0] addr_sift;
wire [17:0] addr_img_w;
wire [7:0] img_sift;

wire complete1, complete2;
wire out_feat_en;
wire [5:0] dir;
wire [7:0] mag;
wire kp;
wire [17:0] kp_addr;

assign addr_img_sift = addr_sift;               // SIFT 输出地址，连接到RAM Port A

/************** True Dual Port RAM module **************/
ram_image  u_ram_image (
    .clka                    ( sys_clk        ),
    .clkb                    ( sys_clk        ),
    .cea                     ( 1'b1           ),
    .ceb                     ( 1'b1           ),

    .rstna                   ( sys_rstn       ),
    .rstnb                   ( sys_rstn       ),

    // SIFT Calculation port, read only
    .wea                     ( 1'b0                 ),
    .aa                      ( addr_img_sift[17:0]  ),
    .da                      (          ),
    .qa                      ( dout_img[7:0]        ),

    // AXI port, write only for now
    .web                     ( fdma0_rvalid         ),
    .ab                      ( addr_img_ddr[13:0]   ),
    .db                      ( fdma0_rdata [127:0]  ),
    .qb                      ( rd_back_data[127:0]  )
);


/***************** SIFT module *****************/
sift_top u_sift(
	.clk_sys		    (sys_clk),          // 100M 
    .flag_read          (we_img),           // 写入新图像时处理模块复位，1写入图像

	.img                (img_sift   ),      // input image pixel
    .addr_sift          (addr_sift  ),      // output image request addr
    .kp                 (kp),
    .kp_addr            (kp_addr),
    .sift_mag           (mag),
    .sift_dir           (dir),
    .out_feat_en        (out_feat_en),
    .complete1          (complete1),
    .complete2          (complete2)
);



reg [1:0] fsm_state;
localparam IDLE = 2'b00;
localparam WRITE = 2'b01;
localparam PROCESS = 2'b11;
localparam WRITE_BACK = 2'b10;

/******* 主控制器，CPU接收串口图像写到DDR中，GPIO发出start_load高电平通知FPGA，将图像从DDR搬到RAM进行处理 ********/
always @(posedge sys_clk or negedge sys_rstn) begin
    if(~sys_rstn || ~ps_rst_n) begin
        addr_img_ddr <= 'd0;
        wr_done <= 1'b0;
        we_img <= 1'b1;                     /* RAM待写入，SIFT模块复位 */
        fsm_state <= IDLE;
    end
    else begin
        case(fsm_state)
            IDLE:begin
                if(start_load)
                    fsm_state <= WRITE;
                else begin
                    we_img <= 1'b1;                 // sift module resetting
                    wr_done <= 1'b0;
                    addr_img_ddr <= 'd0;
                    fsm_state <= IDLE;
                end
            end
            WRITE:begin
                we_img <= 1'b1;
                if (addr_img_ddr == 18'd16383) begin: load_img_finish          //65535
                    addr_img_ddr <= 'd0;
                    wr_done <= 1'b1;
                    fsm_state <= PROCESS;
                end
                else if(fdma0_rvalid) begin
                    addr_img_ddr <= addr_img_ddr + 1'b1;
                    fsm_state <= WRITE;
                end
            end
            PROCESS:begin
                we_img <= 1'b0;                 // SIFT模块开始处理
                
                wr_done <= 1'b0;                // reset for timer start flag
                if(complete2)
                    fsm_state <= IDLE;
                else
                    fsm_state <= PROCESS;
            end
        endcase
    end
end

// /*****************   debug    *****************/
 dbg_core1 u_dbg(
     .trig_out_0		(),
     .data_in_0		({ 	
         // out_feat_en, kp, kp_addr[17:0], complete1, complete2, we_img, wr_done, img_sift[7:0], addr_sift[17:0]
 		addr_sift[9:0], fsm_state[1:0], addr_img_ddr[17:0], fdma0_rvalid, fdma0_rbusy
         // , fdma0_rdata[31:0]
         }),
     .ref_clk_0		(sys_clk)
 );


/*****************   SIFT signals    *****************/
assign img_sift = dout_img;
assign data2ddr = {mag, {2'b00, dir}, {6'd0, complete1, kp, 6'd0, kp_addr[17:0]}};     // 64 bits
assign data2ddr_en = complete2? 0 : out_feat_en;

/*****************   Timer for Sift  ******************/
//wire [29:0] time_cost;
//
//timer
//#(
//    .CLK_FREQUENCY(100_000_000), // Clock frequency. Maximum: 4294967295.
//    .TIME_UNIT(1)               // 0: ms, 1: us, default: us.
//) u_timer (
//    .rst            (sys_rstn),         // Input. Active low. Low: reset.
//    .clk            (sys_clk),         // Input. 
//    .start_flag     (wr_done),         // Input. Active high.
//    .stop_flag      (complete2),         // Input. Active high.
//    .time_cost      (time_cost),         // Output. [29:0]. Unit: TIME_UNIT. Maximum: 1000 seconds.
//    .overflow       (overflow)          // Output. Active high.
//);




uiFDMA#(
		.M_AXI_ID_WIDTH(M_AXI_ID_WIDTH)		,
		.M_AXI_ID(0)		    		    ,
		.M_AXI_ADDR_WIDTH(M_AXI_ADDR_WIDTH)	,
		.M_AXI_DATA_WIDTH(M_AXI_DATA_WIDTH)	,	
		.M_AXI_MAX_BURST_LEN(M_AXI_MAX_BURST_LEN)
	)
	u_FDMA(
		.fdma_waddr		(fdma0_waddr)           ,//i
		.fdma_wareq		(fdma0_wareq)           ,//i
		.fdma_wsize		(fdma0_wsize)           ,//i                                    
		.fdma_wbusy		(fdma0_wbusy)           ,//o
						
		.fdma_wdata		(fdma0_wdata)		    ,//i
		.fdma_wvalid	(fdma0_wvalid)          ,//o
		.fdma_wready	(fdma0_wready)		    ,//i

		.fdma_raddr		(fdma0_raddr)           ,//i
		.fdma_rareq		(fdma0_rareq)           ,//i
		.fdma_rsize		(fdma0_rsize)           ,//i                                     
		.fdma_rbusy		(fdma0_rbusy)           ,//o
						
		.fdma_rdata		(fdma0_rdata)		    ,//o
		.fdma_rvalid	(fdma0_rvalid)          ,//o
		.fdma_rready	(fdma0_rready)		    ,//i
				
		.M_AXI_ACLK		(FDMA0_M_AXI_ACLK)		,//i
		.M_AXI_ARESETN	(FDMA0_M_AXI_ARESETN)	,//i
		
		.M_AXI_AWID		(FDMA0_M_AXI_AWID)		,//o
		.M_AXI_AWADDR	(FDMA0_M_AXI_AWADDR)	,//o
		.M_AXI_AWLEN	(FDMA0_M_AXI_AWLEN)		,//o
		.M_AXI_AWSIZE	(FDMA0_M_AXI_AWSIZE)	,//o
		.M_AXI_AWBURST	(FDMA0_M_AXI_AWBURST)	,//o
		.M_AXI_AWLOCK	()						,//o
		.M_AXI_AWCACHE	()						,//o
		.M_AXI_AWPROT	()						,//o  
		.M_AXI_AWQOS	()						,//o
		.M_AXI_AWVALID	(FDMA0_M_AXI_AWVALID)	,//o
		.M_AXI_AWREADY	(FDMA0_M_AXI_AWREADY)	,//i
		.M_AXI_WID		(FDMA0_M_AXI_WID)		,//o
		.M_AXI_WDATA	(FDMA0_M_AXI_WDATA)		,//o
		.M_AXI_WSTRB	(FDMA0_M_AXI_WSTRB)		,//o
		.M_AXI_WLAST	(FDMA0_M_AXI_WLAST)		,//o 			
		.M_AXI_WVALID	(FDMA0_M_AXI_WVALID)	,//o
		.M_AXI_WREADY	(FDMA0_M_AXI_WREADY)	,//i
		.M_AXI_BID		(FDMA0_M_AXI_BID)		,//i
		.M_AXI_BRESP	(FDMA0_M_AXI_BRESP)		,//i
		.M_AXI_BVALID	(FDMA0_M_AXI_BVALID)	,//i
		.M_AXI_BREADY	(FDMA0_M_AXI_BREADY)	,//o 

		.M_AXI_ARID		(FDMA0_M_AXI_ARID)		,//o	 
		.M_AXI_ARADDR	(FDMA0_M_AXI_ARADDR)	,//o	 	
		.M_AXI_ARLEN	(FDMA0_M_AXI_ARLEN)		,//o	 
		.M_AXI_ARSIZE	(FDMA0_M_AXI_ARSIZE)	,//o	 
		.M_AXI_ARBURST	(FDMA0_M_AXI_ARBURST)	,//o	 
		.M_AXI_ARLOCK	()						,//o	 
		.M_AXI_ARCACHE	()						,//o
		.M_AXI_ARPROT	()						,//o	 
		.M_AXI_ARQOS	()						,//o	 	   
		.M_AXI_ARVALID	(FDMA0_M_AXI_ARVALID)	,//o	 
		.M_AXI_ARREADY	(FDMA0_M_AXI_ARREADY)	,//i	 
		.M_AXI_RID		(FDMA0_M_AXI_RID)		,//i	 
		.M_AXI_RDATA	(FDMA0_M_AXI_RDATA)		,//i	 
		.M_AXI_RRESP	(FDMA0_M_AXI_RRESP)		,//i	 
		.M_AXI_RLAST	(FDMA0_M_AXI_RLAST)		,//i	 
		.M_AXI_RVALID	(FDMA0_M_AXI_RVALID)	,//i    
		.M_AXI_RREADY	(FDMA0_M_AXI_RREADY)	 //o
	);




 soc_wrap u_soc_wrap(
    .core_clk                            ( core_clk                    ),
 	.core_reset                          ( core_reset                  ),
 	.memory_clk                          ( memory_clk                  ),		// 80M 
 	.debounce_clk                        ( debounce_clk                ),
 	.memory_reset_out					 ( memory_reset_out            ),
	
    .jtag_tms                           ( soc_tms                     ),
    .jtag_tdi                           ( soc_tdi                     ),
    .jtag_tdo                           ( soc_tdo                     ),
    .jtag_tck                           ( soc_tck                     ),
	
 	.uart0_txd                           ( uart0_txd                   ),
    .uart0_rxd                           ( uart0_rxd                   ),
																			
	.spi0_clk                            ( spi0_clk                    ),
	.spi0_miso                           ( spi0_miso                   ),
	.spi0_mosi                           ( spi0_mosi                   ),
	.spi0_scl                            ( spi0_scl                    ),
	
	.i2c0_sda                            ( i2c0_sda                    ),      
    .i2c0_scl                            ( i2c0_scl                    ),
						
 	.gpio_in                             ( gpio_in                     ),
 	.gpio_out                            ( gpio_out                    ),
 	.gpio_out_en                         ( gpio_out_en                 ),
										
 	.apb_paddr_s0                        ( apb_s0_paddr                ),
    .apb_psel_s0                         ( apb_s0_psel                 ),
    .apb_penable_s0                      ( apb_s0_penable              ),
    .apb_pready_s0                       ( apb_s0_pready               ),
    .apb_pwrite_s0                       ( apb_s0_pwrite               ),
    .apb_pwdata_s0                       ( apb_s0_pwdata               ),
    .apb_prdata_s0                       ( apb_s0_prdata               ),
    .apb_perror_s0                       ( apb_s0_perror               ),
									
    .apb_paddr_s1                        ( apb_s1_paddr                ),
    .apb_psel_s1                         ( apb_s1_psel                 ),
    .apb_penable_s1                      ( apb_s1_penable              ),
    .apb_pready_s1                       ( apb_s1_pready               ),
    .apb_pwrite_s1                       ( apb_s1_pwrite               ),
    .apb_pwdata_s1                       ( apb_s1_pwdata               ),
    .apb_prdata_s1                       ( apb_s1_prdata               ),
    .apb_perror_s1                       ( apb_s1_perror               ),
										
 	.apb_dev_intr                        ( apb_dev_intr                ),
 	.sys_reset_out                       ( sys_reset_out               ), 
	
    .ddr_port_arw_valid                  ( axi_ddr_arw_valid           ),
    .ddr_port_arw_ready                  ( axi_ddr_arw_ready           ),
    .ddr_port_arw_addr                   ( axi_ddr_arw_payload_addr    ),
    .ddr_port_arw_id                     ( axi_ddr_arw_payload_id      ),
    .ddr_port_arw_region                 ( axi_ddr_arw_payload_region  ),
    .ddr_port_arw_len                    ( axi_ddr_arw_payload_len     ),
    .ddr_port_arw_size                   ( axi_ddr_arw_payload_size    ),
    .ddr_port_arw_burst                  ( axi_ddr_arw_payload_burst   ),
    .ddr_port_arw_lock                   ( axi_ddr_arw_payload_lock    ),
    .ddr_port_arw_cache                  ( axi_ddr_arw_payload_cache   ),
    .ddr_port_arw_qos                    ( axi_ddr_arw_payload_qos     ),
    .ddr_port_arw_prot                   ( axi_ddr_arw_payload_prot    ),
    .ddr_port_arw_write                  ( axi_ddr_arw_payload_write   ),
    .ddr_port_w_valid                    ( axi_ddr_w_valid             ),
    .ddr_port_w_ready                    ( axi_ddr_w_ready             ),
    .ddr_port_w_data                     ( axi_ddr_w_payload_data      ),
    .ddr_port_w_strb                     ( axi_ddr_w_payload_strb      ),
    .ddr_port_w_last                     ( axi_ddr_w_payload_last      ),
    .ddr_port_b_valid                    ( axi_ddr_b_valid             ),
    .ddr_port_b_ready                    ( axi_ddr_b_ready             ),
    .ddr_port_b_id                       ( axi_ddr_b_payload_id        ),
    .ddr_port_b_resp                     ( axi_ddr_b_payload_resp      ),
    .ddr_port_r_valid                    ( axi_ddr_r_valid             ),
    .ddr_port_r_ready                    ( axi_ddr_r_ready             ),
    .ddr_port_r_data                     ( axi_ddr_r_payload_data      ),
    .ddr_port_r_id                       ( axi_ddr_r_payload_id        ),
    .ddr_port_r_resp                     ( axi_ddr_r_payload_resp      ),
    .ddr_port_r_last                     ( axi_ddr_r_payload_last      ),
    .ddr_port_w_id                       ( axi_ddr_w_payload_id        ),
									
    .axi_s_awvalid                       ( axi_awvalid                 ),
    .axi_s_awready                       ( axi_awready                 ),
    .axi_s_awaddr                        ( axi_awaddr                  ),
    .axi_s_awid                          ( axi_awid                    ),
    .axi_s_awregion                      ( axi_awregion                ),
    .axi_s_awlen                         ( axi_awlen                   ),
    .axi_s_awsize                        ( axi_awsize                  ),
    .axi_s_awburst                       ( axi_awburst                 ),
    .axi_s_awlock                        ( axi_awlock                  ),
    .axi_s_awcache                       ( axi_awcache                 ),
    .axi_s_awqos                         ( axi_awqos                   ),
    .axi_s_awprot                        ( axi_awprot                  ),
    .axi_s_wvalid                        ( axi_wvalid                  ),
    .axi_s_wready                        ( axi_wready                  ),
    .axi_s_wdata                         ( axi_wdata                   ),
    .axi_s_wstrb                         ( axi_wstrb                   ),
    .axi_s_wlast                         ( axi_wlast                   ),
    .axi_s_bvalid                        ( axi_bvalid                  ),
    .axi_s_bready                        ( axi_bready                  ),
    .axi_s_bid                           ( axi_bid                     ),
    .axi_s_bresp                         ( axi_bresp                   ),
    .axi_s_arvalid                       ( axi_arvalid                 ),
    .axi_s_arready                       ( axi_arready                 ),
    .axi_s_araddr                        ( axi_araddr                  ),
    .axi_s_arid                          ( axi_arid                    ),
    .axi_s_arregion                      ( axi_arregion                ),
    .axi_s_arlen                         ( axi_arlen                   ),
    .axi_s_arsize                        ( axi_arsize                  ),
    .axi_s_arburst                       ( axi_arburst                 ),
    .axi_s_arlock                        ( axi_arlock                  ),
    .axi_s_arcache                       ( axi_arcache                 ),
    .axi_s_arqos                         ( axi_arqos                   ),
    .axi_s_arprot                        ( axi_arprot                  ),
    .axi_s_rvalid                        ( axi_rvalid                  ),
    .axi_s_rready                        ( axi_rready                  ),
    .axi_s_rdata                         ( axi_rdata                   ),
    .axi_s_rid                           ( axi_rid                     ),
    .axi_s_rresp                         ( axi_rresp                   ),
    .axi_s_rlast                         ( axi_rlast                   ),
    .axi_dev_intr                        ( axi_dev_intr	               )
 );    



ddr_v1 u_ddr_v1 (
    .I_mc_rstn                           ( rst_ddr_n                     ),
    .I_mc_pclk                           ( clk_ddr                       ),		// 200M
    .I_cfg_rstn                          ( rst_ddr_cfg_n                 ),
    .I_cfg_pclk                          ( clk_ddr_cfg                   ),		// 25M
    .O_init_done                         ( init_done                     ),
    .O_init_pass                         ( init_pass                     ),
							             
    .I_pbus_aclk0                        ( memory_clk                    ),		// 80M
    .axi_port00_arid                     ( {8'd0,axi_ddr_ar_payload_id}  ),      
    .axi_port00_araddr                   ( axi_ddr_ar_payload_addr       ),     
    .axi_port00_arlen                    ( axi_ddr_ar_payload_len[3:0]   ),
    .axi_port00_arsize                   ( axi_ddr_ar_payload_size       ),     
    .axi_port00_arburst                  ( axi_ddr_ar_payload_burst      ),     
    .axi_port00_arvalid                  ( axi_ddr_ar_valid              ),             
    .axi_port00_arready                  ( axi_ddr_ar_ready              ),             
    .axi_port00_rid                      ( axi_ddr_rid                   ),            
    .axi_port00_rdata                    ( axi_ddr_r_payload_data        ),  
    .axi_port00_rresp                    ( axi_ddr_r_payload_resp        ),  
    .axi_port00_rlast                    ( axi_ddr_r_payload_last        ),  
    .axi_port00_rvalid                   ( axi_ddr_r_valid               ),       
    .axi_port00_rready                   ( axi_ddr_r_ready               ),       
    .axi_port00_awid                     ( {8'd0,axi_ddr_aw_payload_id}  ),      
    .axi_port00_awaddr                   ( axi_ddr_aw_payload_addr       ),     
    .axi_port00_awlen                    ( axi_ddr_aw_payload_len[3:0]   ),
    .axi_port00_awsize                   ( axi_ddr_aw_payload_size       ),     
    .axi_port00_awburst                  ( axi_ddr_aw_payload_burst      ),     
    .axi_port00_awvalid                  ( axi_ddr_aw_valid              ),             
    .axi_port00_awready                  ( axi_ddr_aw_ready              ),             
    .axi_port00_wid                      ( {8'd0,axi_ddr_w_payload_id}   ),   
	.axi_port00_wdata                    ( axi_ddr_w_payload_data        ),  
    .axi_port00_wstrb                    ( axi_ddr_w_payload_strb        ),  
    .axi_port00_wlast                    ( axi_ddr_w_payload_last        ),  
    .axi_port00_wvalid                   ( axi_ddr_w_valid               ),          
    .axi_port00_wready                   ( axi_ddr_w_ready               ),          
    .axi_port00_bid                      ( axi_ddr_bid                   ),        
    .axi_port00_bresp                    ( axi_ddr_b_payload_resp        ),  
    .axi_port00_bvalid                   ( axi_ddr_b_valid               ),          
    .axi_port00_bready                   ( axi_ddr_b_ready               ),
	
	.I_pbus_aclk1						 ( FDMA0_M_AXI_ACLK				),
    .axi_port01_arid                     ( FDMA0_M_AXI_ARID  			),      
    .axi_port01_araddr                   ( FDMA0_M_AXI_ARADDR       	),     
    .axi_port01_arlen                    ( FDMA0_M_AXI_ARLEN   			),
    .axi_port01_arsize                   ( FDMA0_M_AXI_ARSIZE       	),     
    .axi_port01_arburst                  ( FDMA0_M_AXI_ARBURST      	),     
    .axi_port01_arvalid                  ( FDMA0_M_AXI_ARVALID          ),             
    .axi_port01_arready                  ( FDMA0_M_AXI_ARREADY          ),             
    .axi_port01_rid                      ( FDMA0_M_AXI_RID              ),            
    .axi_port01_rdata                    ( FDMA0_M_AXI_RDATA        	),  
    .axi_port01_rresp                    ( FDMA0_M_AXI_RRESP        	),  
    .axi_port01_rlast                    ( FDMA0_M_AXI_RLAST        	),  
    .axi_port01_rvalid                   ( FDMA0_M_AXI_RVALID           ),       
    .axi_port01_rready                   ( FDMA0_M_AXI_RREADY           ),       
    .axi_port01_awid                     ( FDMA0_M_AXI_AWID ),      
    .axi_port01_awaddr                   ( FDMA0_M_AXI_AWADDR       	),     
    .axi_port01_awlen                    ( FDMA0_M_AXI_AWLEN  			),
    .axi_port01_awsize                   ( FDMA0_M_AXI_AWSIZE       	),     
    .axi_port01_awburst                  ( FDMA0_M_AXI_AWBURST      	),     
    .axi_port01_awvalid                  ( FDMA0_M_AXI_AWVALID          ),             
    .axi_port01_awready                  ( FDMA0_M_AXI_AWREADY          ),             
    .axi_port01_wid                      ( FDMA0_M_AXI_WID   ),   
	.axi_port01_wdata                    ( FDMA0_M_AXI_WDATA        	),  
    .axi_port01_wstrb                    ( FDMA0_M_AXI_WSTRB        	),  
    .axi_port01_wlast                    ( FDMA0_M_AXI_WLAST        	),  
    .axi_port01_wvalid                   ( FDMA0_M_AXI_WVALID           ),          
    .axi_port01_wready                   ( FDMA0_M_AXI_WREADY           ),          
    .axi_port01_bid                      ( FDMA0_M_AXI_BID              ),        
    .axi_port01_bresp                    ( FDMA0_M_AXI_BRESP        	),  
    .axi_port01_bvalid                   ( FDMA0_M_AXI_BVALID           ),          
    .axi_port01_bready                   ( FDMA0_M_AXI_BREADY           )
	
);

assign led[3]   =  led_pin; 
assign led[2:0] =  gpio_out[2:0];  


endmodule
