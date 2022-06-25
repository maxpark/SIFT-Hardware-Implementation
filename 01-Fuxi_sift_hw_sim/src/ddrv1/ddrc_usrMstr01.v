`include "ddr_param.v"

module ddrc_usrMstr01(
	input i_clk_ref	,
	output [7:0]LED
);

//`define SDII_BUS_ENABLE 1
`define AXI_BUS_ENABLE  1
`ifdef SDII_BUS_ENABLE
   parameter CFG_BUS_SEL = 1 ; //1:SDII,0:AXI ; 
`elsif AXI_BUS_ENABLE 
   parameter CFG_BUS_SEL = 0 ; //1:SDII,0:AXI ; 
`endif

// notes:
// ip_clk & usr_clk should be in same freq, 
// mc_clk is the DDR clk freq
// DDRC async usr mode: mc_clk faster than usr/ip_clk
// DDRC sync usr mode: ip_clk rules as the mc_clk
wire   mc_clk_src;	 // for hardware IP PHY
wire   ip_bus_clk;  // for hardware IP bridge logic
wire   ip_bus_clk_fp;
wire   usrbus_clk;	 // for usr master logic
wire   cfg_uclk; // low speed < 100MHz
wire   cfg_pclk;
wire   pll_lck;   

//
wire [279:0] S_port0_data_to_ip ;
wire [279:0] S_port1_data_to_ip ;
wire [169:0] S_port0_data_to_usr ;
wire [169:0] S_port1_data_to_usr ;
wire S_intr;
wire S_ddr_cfg_done;
wire S_ddr_cfg_err;

//
`define SUM_PORT_NUM   2
wire [`SUM_PORT_NUM-1:0] S_axi_areset_n;
wire [`SUM_PORT_NUM-1:0] S_axi_aclk;
wire [`SUM_PORT_NUM-1:0] S_axi_aclk_fp;
//write address
wire [`AXI_WAID_BUS-1:0] S_axi_awid	  [`SUM_PORT_NUM-1:0] ;
wire [`AXI_ADDR_BUS-1:0] S_axi_awaddr [`SUM_PORT_NUM-1:0] ;
wire [`AXI_LENG_BUS-1:0] S_axi_awlen  [`SUM_PORT_NUM-1:0] ;
wire [`AXI_SIZE_BUS-1:0] S_axi_awsize [`SUM_PORT_NUM-1:0] ;
wire [`AXI_BURST_BUS-1:0]S_axi_awburst[`SUM_PORT_NUM-1:0] ;
wire [`SUM_PORT_NUM-1:0] S_axi_awvalid ;
wire [`SUM_PORT_NUM-1:0] S_axi_awready ;
// write data
wire [`AXI_WDID_BUS-1:0] S_axi_wid	 [`SUM_PORT_NUM-1:0];
wire [`AXI_DATA_BUS-1:0] S_axi_wdata [`SUM_PORT_NUM-1:0];
wire [`AXI_MASK_BUS-1:0] S_axi_wstrb [`SUM_PORT_NUM-1:0];
wire [`SUM_PORT_NUM-1:0] S_axi_wlast ;
wire [`SUM_PORT_NUM-1:0] S_axi_wvalid;
wire [`SUM_PORT_NUM-1:0] S_axi_wready;
// write respond
wire [`AXI_WBID_BUS-1:0] S_axi_bid   [`SUM_PORT_NUM-1:0 ] ;
wire [`AXI_RESP_BUS-1:0] S_axi_bresp [`SUM_PORT_NUM-1:0 ] ;
wire [`SUM_PORT_NUM-1:0] S_axi_bvalid;
wire [`SUM_PORT_NUM-1:0] S_axi_bready;
// read address
wire [`AXI_RAID_BUS-1:0] S_axi_arid	  [`SUM_PORT_NUM-1:0] ;
wire [`AXI_ADDR_BUS-1:0] S_axi_araddr [`SUM_PORT_NUM-1:0] ;
wire [`AXI_LENG_BUS-1:0] S_axi_arlen  [`SUM_PORT_NUM-1:0] ;
wire [`AXI_SIZE_BUS-1:0] S_axi_arsize [`SUM_PORT_NUM-1:0] ;
wire [`AXI_BURST_BUS-1:0]S_axi_arburst[`SUM_PORT_NUM-1:0] ;
wire [`SUM_PORT_NUM-1:0] S_axi_arvalid ;
wire [`SUM_PORT_NUM-1:0] S_axi_arready ;
// read data
wire [`AXI_RDID_BUS-1:0] S_axi_rid	 [`SUM_PORT_NUM-1:0] ;
wire [`AXI_DATA_BUS-1:0] S_axi_rdata [`SUM_PORT_NUM-1:0] ;
wire [`AXI_RESP_BUS-1:0] S_axi_rresp [`SUM_PORT_NUM-1:0] ;
wire [`SUM_PORT_NUM-1:0] S_axi_rlast ;
wire [`SUM_PORT_NUM-1:0] S_axi_rvalid ;
wire [`SUM_PORT_NUM-1:0] S_axi_rready ;

wire [31:0]S_axi_wr_time[`SUM_PORT_NUM-1:0];
wire [2:0] S_error_status ;
wire S_error_status_en; 
wire [`SUM_PORT_NUM-1:0]S_axi_cmp_match;
wire [2:0] S_axi_machine[`SUM_PORT_NUM-1:0];
wire [`SUM_PORT_NUM-1:0] S_axi_cmp_result_en;

wire I_cfg_rstn;
wire [256:0] debug [1:0];

assign S_axi_aclk = { 2{ ip_bus_clk } };
assign S_axi_aclk_fp = { 2{ ip_bus_clk_fp} };
assign S_axi_areset_n = {  S_ddr_cfg_done, S_ddr_cfg_done } ;

reg S_sys_rstn ;
reg	[4:0]S_rst_cnt;
always @(posedge mc_clk_src or negedge pll_lck)begin
	if ( !pll_lck ) begin
		S_rst_cnt  <= 0;
		S_sys_rstn <= 0;
	end else begin
		S_rst_cnt <= S_rst_cnt + 1'b1;
		S_sys_rstn <= ( &S_rst_cnt ) ? 1'b1 : S_sys_rstn;
	end
end

reg [9:0]S_cfg_cnt;
reg S_cfg_rst_n ;
always @( posedge cfg_pclk or negedge pll_lck ) begin
	if( !pll_lck )begin 
		S_cfg_cnt   <= 'b0;
		S_cfg_rst_n <= 1'b0;
	end
	else begin
		S_cfg_cnt   <= S_cfg_cnt + 1'b1 ;
		S_cfg_rst_n <= ( &S_cfg_cnt ) ? 1'b1 : S_cfg_rst_n ;
	end
end

reg [19:0]S_axi_cnt;
reg S_axi_rst_n ;
always @( posedge cfg_pclk or negedge pll_lck ) begin
	if( !pll_lck )begin 
		S_axi_cnt   <= 'b0;
		S_axi_rst_n <= 1'b0;
	end
	else begin
		S_axi_cnt   <= S_axi_cnt + 1'b1 ;
		S_axi_rst_n <= ( &S_axi_cnt ) ? 1'b1 : S_axi_rst_n ;
	end
end

wire pll_clkout3;
pll_v1 u0_pll(
    .clkin0  ( i_clk_ref  ),
    .clkout0 ( mc_clk_src ), // 1:2 to DDR/DDRPHY clock, IP core clock, like 400MHz
    .clkout1 ( cfg_pclk	), // usr in Fabric clock and the same freq but different latency to mc_clk, like SDII 400MHz
    .clkout2 ( ip_bus_clk_fp ), // connect to IP bus bridge, diffrent latency
	.clkout3 ( pll_clkout3 ),
    .locked  ( pll_lck    )
);

assign ip_bus_clk = ip_bus_clk_fp;

ddr_v1 ddr_v1_inst(
    .I_mc_rstn          ( S_sys_rstn           )
    ,.I_mc_pclk         ( mc_clk_src           )  // 200MHz,
    ,.I_cfg_rstn        ( S_cfg_rst_n          )
    ,.I_cfg_pclk        ( cfg_pclk             )  // low 100MHz..
    ,.O_init_done       ( S_ddr_cfg_done       )
    ,.O_init_pass       ( S_ddr_cfg_err        )
	   
    // Port Interface axi_port00
    ,.I_pbus_aclk0            ( S_axi_aclk[0]              )
    ,.axi_port00_arid         ( S_axi_arid[0]              )
    ,.axi_port00_araddr       ( S_axi_araddr[0]            )
    ,.axi_port00_arlen        ( S_axi_arlen[0]             )
    ,.axi_port00_arsize       ( S_axi_arsize[0]            )
    ,.axi_port00_arburst      ( S_axi_arburst[0]           )
    ,.axi_port00_arvalid      ( S_axi_arvalid[0]           )
    ,.axi_port00_arready      ( S_axi_arready[0]           )
    ,.axi_port00_rid          ( S_axi_rid[0]               )
    ,.axi_port00_rdata        ( S_axi_rdata[0]             )
    ,.axi_port00_rresp        ( S_axi_rresp[0]             )
    ,.axi_port00_rlast        ( S_axi_rlast[0]             )
    ,.axi_port00_rvalid       ( S_axi_rvalid[0]            )
    ,.axi_port00_rready       ( S_axi_rready[0]            )
    ,.axi_port00_awid         ( S_axi_awid[0]              )
    ,.axi_port00_awaddr       ( S_axi_awaddr[0]            )
    ,.axi_port00_awlen        ( S_axi_awlen[0]             )
    ,.axi_port00_awsize       ( S_axi_awsize[0]            )
    ,.axi_port00_awburst      ( S_axi_awburst[0]           )
    ,.axi_port00_awvalid      ( S_axi_awvalid[0]           )
    ,.axi_port00_awready      ( S_axi_awready[0]           )
    ,.axi_port00_wid          ( S_axi_wid[0]               )
    //,.axi_port00_wdata        ( {{32{1'b0}}, S_axi_wdata[0][95:0]}             )
	,.axi_port00_wdata        ( {S_axi_wdata[0][127:112], 1'b0, S_axi_wdata[0][110:0]} )//axi bit111 has bug,nto fix
    ,.axi_port00_wstrb        ( S_axi_wstrb[0]             )
    ,.axi_port00_wlast        ( S_axi_wlast[0]             )
    ,.axi_port00_wvalid       ( S_axi_wvalid[0]            )
    ,.axi_port00_wready       ( S_axi_wready[0]            )
    ,.axi_port00_bid          ( S_axi_bid[0]               )
    ,.axi_port00_bresp        ( S_axi_bresp[0]             )
    ,.axi_port00_bvalid       ( S_axi_bvalid[0]            )
    ,.axi_port00_bready       ( S_axi_bready[0]            )

    // Port Interface axi_port01
    ,.I_pbus_aclk1            ( S_axi_aclk[1]              )
    ,.axi_port01_arid         ( S_axi_arid[1]              )
    ,.axi_port01_araddr       ( S_axi_araddr[1]            )
    ,.axi_port01_arlen        ( S_axi_arlen[1]             )
    ,.axi_port01_arsize       ( S_axi_arsize[1]            )
    ,.axi_port01_arburst      ( S_axi_arburst[1]           )
    ,.axi_port01_arvalid      ( S_axi_arvalid[1]           )
    ,.axi_port01_arready      ( S_axi_arready[1]           )
    ,.axi_port01_rid          ( S_axi_rid[1]               )
    ,.axi_port01_rdata        ( S_axi_rdata[1]             )
    ,.axi_port01_rresp        ( S_axi_rresp[1]             )
    ,.axi_port01_rlast        ( S_axi_rlast[1]             )
    ,.axi_port01_rvalid       ( S_axi_rvalid[1]            )
    ,.axi_port01_rready       ( S_axi_rready[1]            )
    ,.axi_port01_awid         ( S_axi_awid[1]              )
    ,.axi_port01_awaddr       ( S_axi_awaddr[1]            )
    ,.axi_port01_awlen        ( S_axi_awlen[1]             )
    ,.axi_port01_awsize       ( S_axi_awsize[1]            )
    ,.axi_port01_awburst      ( S_axi_awburst[1]           )
    ,.axi_port01_awvalid      ( S_axi_awvalid[1]           )
    ,.axi_port01_awready      ( S_axi_awready[1]           )
    ,.axi_port01_wid          ( S_axi_wid[1]               )
    //,.axi_port01_wdata        ( {{32{1'b0}}, S_axi_wdata[1][95:0]})
	,.axi_port01_wdata        ( {S_axi_wdata[1][127:112], 1'b0, S_axi_wdata[1][110:0]} )//axi bit111 has bug,nto fix
    ,.axi_port01_wstrb        ( S_axi_wstrb[1]             )
    ,.axi_port01_wlast        ( S_axi_wlast[1]             )
    ,.axi_port01_wvalid       ( S_axi_wvalid[1]            )
    ,.axi_port01_wready       ( S_axi_wready[1]            )
    ,.axi_port01_bid          ( S_axi_bid[1]               )
    ,.axi_port01_bresp        ( S_axi_bresp[1]             )
    ,.axi_port01_bvalid       ( S_axi_bvalid[1]            )
    ,.axi_port01_bready       ( S_axi_bready[1]            )
//	   ,.O_error_status          ( S_error_status         )
//	   ,.O_error_status_en       ( S_error_status_en      ) 
);

master_axi_top	#(
		.DDR_SIZE(32'H0400_0000),  //Test length:64M x32 words(2Gbit)
		.TEST_ADDR(32'H0000_0000), //Start address
		.TEST_LEN(1), //AXI burst length: 1-16, Ok
		.WSTRB(16'Hffff),
		.RSTRB(16'Hffff),
		.RDEN (1),                            //1: Read test enable; 0: Read test disable; 
		.WREN (1)                            //1: Write test enable; 0: Write test disable;
	) master_axi_inst0(
   .I_aresetn      ( S_axi_areset_n[0] )
//   ,.I_aclk        ( S_axi_aclk_fp[0]  )
   ,.I_aclk        ( pll_clkout3  )
   // write address channel signals
   ,.O_mst_awid    ( S_axi_awid[0]     )
   ,.O_mst_awaddr  ( S_axi_awaddr[0]   )
   ,.O_mst_awlen   ( S_axi_awlen[0]    )
   ,.O_mst_awsize  ( S_axi_awsize[0]   )
   ,.O_mst_awburst ( S_axi_awburst[0]  )
   ,.O_mst_awvalid ( S_axi_awvalid[0]  )
   ,.I_mst_awready ( S_axi_awready[0]  )
   // write data channel signals
   ,.O_mst_wid     ( S_axi_wid[0]      )
   ,.O_mst_wdata   ( S_axi_wdata[0]    )
   ,.O_mst_wstrb   ( S_axi_wstrb[0]    )
   ,.O_mst_wlast   ( S_axi_wlast[0]    )
   ,.O_mst_wvalid  ( S_axi_wvalid[0]   )
   ,.I_mst_wready  ( S_axi_wready[0]   )
   // write response channel signals
   ,.I_bid         ( S_axi_bid[0]      ) // axi master do not need this input signal
   ,.I_bresp       ( S_axi_bresp[0]    )
   ,.I_bvalid      ( S_axi_bvalid[0]   )
   ,.O_bready      ( S_axi_bready[0]   )
   // read address channel signals
   ,.O_arid        ( S_axi_arid[0]     )
   ,.O_araddr      ( S_axi_araddr[0]   )
   ,.O_arlen       ( S_axi_arlen[0]    )
   ,.O_arsize      ( S_axi_arsize[0]   )
   ,.O_arburst     ( S_axi_arburst[0]  )
   ,.O_arvalid     ( S_axi_arvalid[0]  )
   ,.I_arready     ( S_axi_arready[0]  )
   // read data channel signals           
   ,.I_rid         ( S_axi_rid[0]      ) // rid is not required; AXI master send 4'b0 IDs for all in-order pipelining reads
   ,.I_rdata       ( S_axi_rdata[0]    )
   ,.I_rresp       ( S_axi_rresp[0]    )
   ,.I_rlast       ( S_axi_rlast[0]    )
   ,.I_rvalid      ( S_axi_rvalid[0]   )
   ,.O_rready      ( S_axi_rready[0]   )
		   
   //
   ,.O_cmp_result   ( S_axi_cmp_match[0]    )
   ,.O_machine      ( S_axi_machine[0]       )
   ,.O_cmp_result_en( S_axi_cmp_result_en[0] )
   ,.O_time         ( S_axi_wr_time[0]       )
   ,.debug          ( debug[0]               )
);

//master_axi_top	#(
//		.DDR_SIZE(32'H0200_0000),  //Test length:32M x32 words(1Gbit)
//		.TEST_ADDR(32'H0100_0000), //Start address
//		.TEST_LEN(16), //AXI burst length: 1-16
//		.RDEN (1),                            //1: Read test enable; 0: Read test disable;
//		.WREN (1)                            //1: Write test enable; 0: Write test disable;
//	) master_axi_inst1(
//   .I_aresetn      ( S_axi_areset_n[1] )
////   ,.I_aclk        ( S_axi_aclk_fp[1]  )
//   ,.I_aclk        ( pll_clkout3  )
//   // write address channel signals
//   ,.O_mst_awid    ( S_axi_awid[1]     )
//   ,.O_mst_awaddr  ( S_axi_awaddr[1]   )
//   ,.O_mst_awlen   ( S_axi_awlen[1]    )
//   ,.O_mst_awsize  ( S_axi_awsize[1]   )
//   ,.O_mst_awburst ( S_axi_awburst[1]  )
//   ,.O_mst_awvalid ( S_axi_awvalid[1]  )
//   ,.I_mst_awready ( S_axi_awready[1]  )
//   // write data channel signals
//   ,.O_mst_wid     ( S_axi_wid[1]      )
//   ,.O_mst_wdata   ( S_axi_wdata[1]    )
//   ,.O_mst_wstrb   ( S_axi_wstrb[1]    )
//   ,.O_mst_wlast   ( S_axi_wlast[1]    )
//   ,.O_mst_wvalid  ( S_axi_wvalid[1]   )
//   ,.I_mst_wready  ( S_axi_wready[1]   )
//   // write response channel signals
//   ,.I_bid         ( S_axi_bid[1]      ) // axi master do not need this input signal
//   ,.I_bresp       ( S_axi_bresp[1]    )
//   ,.I_bvalid      ( S_axi_bvalid[1]   )
//   ,.O_bready      ( S_axi_bready[1]   )
//   // read address channel signals
//   ,.O_arid        ( S_axi_arid[1]     )
//   ,.O_araddr      ( S_axi_araddr[1]   )
//   ,.O_arlen       ( S_axi_arlen[1]    )
//   ,.O_arsize      ( S_axi_arsize[1]   )
//   ,.O_arburst     ( S_axi_arburst[1]  )
//   ,.O_arvalid     ( S_axi_arvalid[1]  )
//   ,.I_arready     ( S_axi_arready[1]  )
//   // read data channel signals           
//   ,.I_rid         ( S_axi_rid[1]      ) // rid is not required; AXI master send 4'b0 IDs for all in-order pipelining reads
//   ,.I_rdata       ( S_axi_rdata[1]    )
//   ,.I_rresp       ( S_axi_rresp[1]    )
//   ,.I_rlast       ( S_axi_rlast[1]    )
//   ,.I_rvalid      ( S_axi_rvalid[1]   )
//   ,.O_rready      ( S_axi_rready[1]   )
//		   
//   //
//   ,.O_cmp_result   ( S_axi_cmp_match[1]    )
//   ,.O_machine      ( S_axi_machine[1]       )
//   ,.O_cmp_result_en( S_axi_cmp_result_en[1] )
//   ,.O_time         ( S_axi_wr_time[1]       )
//   ,.debug          ( debug[1]               )
//   ,.test           ( test             )
//);

assign LED[0] = pll_lck;
assign LED[1] = S_ddr_cfg_done ;
assign LED[2] = S_ddr_cfg_err;
assign LED[3] = S_axi_cmp_match[0];
assign LED[4] = S_axi_cmp_match[1];
assign LED[6:5] = S_axi_machine[1][2:0];
//assign LED[7] = test;

//debug signals                                       
//debugware_v2_1 debug_inst(
//    .trig_out_0( ),
//    .data_in_0( { 
//	S_axi_cmp_match[1], //S_axi_machine[1], 
//	S_axi_wlast[0], S_axi_wvalid[0], S_axi_wready[0],
//	S_axi_cmp_match[0], S_axi_machine[0]}), 
////    .ref_clk_0( S_axi_aclk_fp[0] )
//	.ref_clk_0( pll_clkout3  )	
//);

reg [159:0] debug_in[1:0];

//AXI Write
//always @(posedge pll_clkout3) begin
//	debug_in[0] <= {   
//	    debug[0][5]      , //bit 102
//        debug[0][4:0]    , //bit97-101
//	    S_axi_machine[0] , //bit94-96 
//		// write address channel signals  
//		//S_axi_awid[0]  ,
//		S_axi_awaddr[0]  , //bit62-93
//		S_axi_awlen[0]   , //bit58-61
//		S_axi_awsize[0]  , //bit55-57
//		S_axi_awburst[0] , //bit53-54
//		S_axi_awvalid[0] , //bit52
//		S_axi_awready[0] , //bit51
//		
//		//S_axi_wid[0]   ,
//		S_axi_wdata[0][31:0] , //bit 19-50
//		S_axi_wstrb[0] , //bit3-18
//		S_axi_wlast[0] , //bit2
//		S_axi_wvalid[0], //bit1
//		S_axi_wready[0]  //bit0
//		
//		};
//
//end

//AXI read bus
always @(posedge pll_clkout3) begin
	debug_in[0] <= {   
	    S_axi_cmp_match[0],   //bit 135
	    debug[0][37:6]      , //bit 103-134
	    debug[0][5]      , //bit 102
        debug[0][4:0]    , //bit97-101
	    S_axi_machine[0] , //bit94-96 
		// read address channel signals  
		//S_axi_awid[0]  ,
		S_axi_araddr[0]  , //bit62-93
		S_axi_arlen[0]   , //bit58-61
		S_axi_arsize[0]  , //bit55-57
		S_axi_arburst[0] , //bit53-54
		S_axi_arvalid[0] , //bit52
		S_axi_arready[0] , //bit51
		
		//S_axi_rid[0]   ,
		S_axi_rdata[0][31:0] , //bit 19-50
		14'h0000,S_axi_rresp[0] , //bit3-18
		S_axi_rlast[0] , //bit2
//		S_axi_rvalid[0], //bit1
//		S_axi_rready[0]  //bit0		
		S_ddr_cfg_done,
		S_ddr_cfg_err
		};
end
always @(posedge pll_clkout3) begin
	debug_in[1] <= {   
		debug[0][5]      , //bit 155
        debug[0][4:0]    , //bit150-154
		S_axi_machine[0] ,//bit147-149 
		S_axi_rlast[0] , //bit146
		S_axi_rvalid[0], //bit145
		S_axi_rready[0], //bit144
		debug[0][21:6],  //bit128-143
		S_axi_rdata[0][127:0] //bit0-127	
		};
end

////AXI read bus
//always @(posedge pll_clkout3) begin
//	debug_in[0] <= {   
//	    debug[1][37:6]      , //bit 103-134
//	    debug[1][5]      , //bit 102
//        debug[1][4:0]    , //bit97-101
//	    S_axi_machine[1] , //bit94-96 
//		// read address channel signals  
//		//S_axi_awid[1]  ,
//		S_axi_araddr[1]  , //bit62-93
//		S_axi_arlen[1]   , //bit58-61
//		S_axi_arsize[1]  , //bit55-57
//		S_axi_arburst[1] , //bit53-54
//		S_axi_arvalid[1] , //bit52
//		S_axi_arready[1] , //bit51
//		
//		//S_axi_rid[1]   ,
//		S_axi_rdata[1][31:0] , //bit 19-50
//		14'h0000,S_axi_rresp[1] , //bit3-18
//		S_axi_rlast[1] , //bit2
//		S_axi_rvalid[1], //bit1
//		S_axi_rready[1]  //bit0		
//		};
//end
//always @(posedge pll_clkout3) begin
//	debug_in[1] <= {   
//		debug[1][5]      , //bit 155
//        debug[1][4:0]    , //bit150-154
//		S_axi_machine[1] ,//bit147-149 
//		S_axi_rlast[1] , //bit146
//		S_axi_rvalid[1], //bit145
//		S_axi_rready[1], //bit144
//		debug[1][21:6],  //bit128-143
//		S_axi_rdata[1][127:0] //bit0-127	
//		};
//end

debugware_v2_1 debug_inst(
    .trig_out_0( ),
    .data_in_0( debug_in[0] ),
	.ref_clk_0( pll_clkout3  )//,
//	.trig_out_1( ),
//    .data_in_1( debug_in[1] ),
//	.ref_clk_1( pll_clkout3  )
);

endmodule
