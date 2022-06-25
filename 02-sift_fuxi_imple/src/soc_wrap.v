// ============================================================
//
// Company:
// Engineer:
//
// Create Date: 10/30/2021 14:16:55   
// Design Name:
// Module Name: soc_wrap_top
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
// ============================================================
module soc_wrap (
    input               core_clk,
    input               core_reset,
    input               memory_clk,
	input               debounce_clk,
    output              memory_reset_out,
    output              uart0_txd,
    input               uart0_rxd,
    input      [31:0]   gpio_in,
    output     [31:0]   gpio_out_en,
    output     [31:0]   gpio_out, 
    output              spi0_clk,
    input               spi0_miso,
	output              spi0_mosi,
	output     [7:0]    spi0_scl, 
	inout               i2c0_sda,
    inout               i2c0_scl,
    output     [15:0]   apb_paddr_s0,
    output     [0:0]    apb_psel_s0,
    output              apb_penable_s0,
    input               apb_pready_s0,
    output              apb_pwrite_s0,
    output     [31:0]   apb_pwdata_s0,
    input      [31:0]   apb_prdata_s0,
    input               apb_perror_s0,
    output     [15:0]   apb_paddr_s1,
    output     [0:0]    apb_psel_s1,
    output              apb_penable_s1,
    input               apb_pready_s1,
    output              apb_pwrite_s1,
    output     [31:0]   apb_pwdata_s1,
    input      [31:0]   apb_prdata_s1,
    input               apb_perror_s1,
    input               apb_dev_intr,
    output              sys_reset_out,
    input               jtag_tms,
    input               jtag_tdi,
    output              jtag_tdo,
    input               jtag_tck,
    output              ddr_port_arw_valid,
    input               ddr_port_arw_ready,
    output     [31:0]   ddr_port_arw_addr,
    output     [7:0]    ddr_port_arw_id,
    output     [3:0]    ddr_port_arw_region,
    output     [7:0]    ddr_port_arw_len,
    output     [2:0]    ddr_port_arw_size,
    output     [1:0]    ddr_port_arw_burst,
    output     [0:0]    ddr_port_arw_lock,
    output     [3:0]    ddr_port_arw_cache,
    output     [3:0]    ddr_port_arw_qos,
    output     [2:0]    ddr_port_arw_prot,
    output              ddr_port_arw_write,
    output              ddr_port_w_valid,
    input               ddr_port_w_ready,
    output     [127:0]  ddr_port_w_data,
    output     [15:0]   ddr_port_w_strb,
    output              ddr_port_w_last,
    input               ddr_port_b_valid,
    output              ddr_port_b_ready,
    input      [7:0]    ddr_port_b_id,
    input      [1:0]    ddr_port_b_resp,
    input               ddr_port_r_valid,
    output              ddr_port_r_ready,
    input      [127:0]  ddr_port_r_data,
    input      [7:0]    ddr_port_r_id,
    input      [1:0]    ddr_port_r_resp,
    input               ddr_port_r_last,
    output     [7:0]    ddr_port_w_id,
    output              axi_s_awvalid,
    input               axi_s_awready,
    output     [31:0]   axi_s_awaddr,
    output     [7:0]    axi_s_awid,
    output     [3:0]    axi_s_awregion,
    output     [7:0]    axi_s_awlen,
    output     [2:0]    axi_s_awsize,
    output     [1:0]    axi_s_awburst,
    output     [0:0]    axi_s_awlock,
    output     [3:0]    axi_s_awcache,
    output     [3:0]    axi_s_awqos,
    output     [2:0]    axi_s_awprot,
    output              axi_s_wvalid,
    input               axi_s_wready,
    output     [31:0]   axi_s_wdata,
    output     [3:0]    axi_s_wstrb,
    output              axi_s_wlast,
    input               axi_s_bvalid,
    output              axi_s_bready,
    input      [7:0]    axi_s_bid,
    input      [1:0]    axi_s_bresp,
    output              axi_s_arvalid,
    input               axi_s_arready,
    output     [31:0]   axi_s_araddr,
    output     [7:0]    axi_s_arid,
    output     [3:0]    axi_s_arregion,
    output     [7:0]    axi_s_arlen,
    output     [2:0]    axi_s_arsize,
    output     [1:0]    axi_s_arburst,
    output     [0:0]    axi_s_arlock,
    output     [3:0]    axi_s_arcache,
    output     [3:0]    axi_s_arqos,
    output     [2:0]    axi_s_arprot,
    input               axi_s_rvalid,
    output              axi_s_rready,
    input      [31:0]   axi_s_rdata,
    input      [7:0]    axi_s_rid,
    input      [1:0]    axi_s_rresp,
    input               axi_s_rlast,
    input               axi_dev_intr
);
wire              ddr_mast0_aw_valid     ;
wire              ddr_mast0_aw_ready     ;
wire     [31:0]   ddr_mast0_aw_addr      ;
wire     [3:0]    ddr_mast0_aw_id        ;
wire     [3:0]    ddr_mast0_aw_region    ;
wire     [7:0]    ddr_mast0_aw_len       ;
wire     [2:0]    ddr_mast0_aw_size      ;
wire     [1:0]    ddr_mast0_aw_burst     ;
wire     [0:0]    ddr_mast0_aw_lock      ;
wire     [3:0]    ddr_mast0_aw_cache     ;
wire     [3:0]    ddr_mast0_aw_qos       ;
wire     [2:0]    ddr_mast0_aw_prot      ;
wire              ddr_mast0_w_valid      ;
wire              ddr_mast0_w_ready      ;
wire     [31:0]   ddr_mast0_w_data       ;
wire     [3:0]    ddr_mast0_w_strb       ;
wire              ddr_mast0_w_last       ;
wire              ddr_mast0_b_valid      ;
wire              ddr_mast0_b_ready      ;
wire     [3:0]    ddr_mast0_b_id         ;
wire     [1:0]    ddr_mast0_b_resp       ;
wire              ddr_mast0_ar_valid     ;
wire              ddr_mast0_ar_ready     ;
wire     [31:0]   ddr_mast0_ar_addr      ;
wire     [3:0]    ddr_mast0_ar_id        ;
wire     [3:0]    ddr_mast0_ar_region    ;
wire     [7:0]    ddr_mast0_ar_len       ;
wire     [2:0]    ddr_mast0_ar_size      ;
wire     [1:0]    ddr_mast0_ar_burst     ;
wire     [0:0]    ddr_mast0_ar_lock      ;
wire     [3:0]    ddr_mast0_ar_cache     ;
wire     [3:0]    ddr_mast0_ar_qos       ;
wire     [2:0]    ddr_mast0_ar_prot      ;
wire              ddr_mast0_r_valid      ;
wire              ddr_mast0_r_ready      ;
wire     [31:0]   ddr_mast0_r_data       ;
wire     [3:0]    ddr_mast0_r_id         ;
wire     [1:0]    ddr_mast0_r_resp       ;
wire              ddr_mast0_r_last       ;
wire              ddr_mast0_clk          ;
wire              ddr_mast0_reset        ;

wire     [31:0]   ddr_arw_addr;
assign ddr_port_arw_addr = ddr_arw_addr - 32'h10000;


assign ddr_mast0_aw_valid                        = 1'b0;        
assign ddr_mast0_aw_addr                         = 32'h10000000;        
assign ddr_mast0_aw_id                           = 4'd0;                
assign ddr_mast0_aw_region                       = 4'd0;                
assign ddr_mast0_aw_len                          = 8'd0;                
assign ddr_mast0_aw_size                         = 3'd0;                
assign ddr_mast0_aw_burst                        = 2'd0;                
assign ddr_mast0_aw_lock                         = 1'b0;                
assign ddr_mast0_aw_cache                        = 4'd0;                
assign ddr_mast0_aw_qos                          = 4'd0;                
assign ddr_mast0_aw_prot                         = 3'd0;                
assign ddr_mast0_w_valid                         = 1'b0;        
assign ddr_mast0_w_data                          = 32'd0;               
assign ddr_mast0_w_strb                          = 4'hf;                
assign ddr_mast0_w_last                          = 1'b0;                
assign ddr_mast0_b_ready                         = 1'b0;            
assign ddr_mast0_ar_valid                        = 1'b0;            
assign ddr_mast0_ar_addr                         = 32'h10000000;        
assign ddr_mast0_ar_id                           = 4'd0;                
assign ddr_mast0_ar_region                       = 4'd0;                
assign ddr_mast0_ar_len                          = 8'd0;                
assign ddr_mast0_ar_size                         = 3'd0;                
assign ddr_mast0_ar_burst                        = 2'd0;                
assign ddr_mast0_ar_lock                         = 1'b0;                
assign ddr_mast0_ar_cache                        = 4'd0;                
assign ddr_mast0_ar_qos                          = 4'd0;                
assign ddr_mast0_ar_prot                         = 3'd0;                
assign ddr_mast0_r_ready                         = 1'b0;        
assign ddr_mast0_clk                             = memory_clk;  
                                                          
                                                                   
HME_VEX_SOC_V1 u_vex_soc(                                         
    .core_clk                ( core_clk                ),          
    .core_reset              ( core_reset              ),          
    .memory_clk              ( memory_clk              ),          
	.debounce_clk            ( debounce_clk            ),          
    .memory_reset_out        ( memory_reset_out        ), 
    .uart0_txd               ( uart0_txd               ),          
    .uart0_rxd               ( uart0_rxd               ),          
    .gpio_in                 ( gpio_in                 ),          
    .gpio_out_en             ( gpio_out_en             ),          
    .gpio_out                ( gpio_out                ),
    .spi0_clk                ( spi0_clk                ),
    .spi0_miso               ( spi0_miso               ),
    .spi0_mosi               ( spi0_mosi               ),
    .spi0_scl                ( spi0_scl                ),
	.i2c0_sda                ( i2c0_sda                ),      
    .i2c0_scl                ( i2c0_scl                ),
    .apb_paddr_s0            ( apb_paddr_s0            ),  
	.apb_psel_s0             ( apb_psel_s0             ),
	.apb_penable_s0          ( apb_penable_s0          ),
	.apb_pready_s0           ( apb_pready_s0           ),
    .apb_pwrite_s0           ( apb_pwrite_s0           ),
    .apb_pwdata_s0           ( apb_pwdata_s0           ),
    .apb_prdata_s0           ( apb_prdata_s0           ),
    .apb_perror_s0           ( apb_perror_s0           ),
    .apb_paddr_s1            ( apb_paddr_s1            ),
    .apb_psel_s1             ( apb_psel_s1             ),
    .apb_penable_s1          ( apb_penable_s1          ),
    .apb_pready_s1           ( apb_pready_s1           ),
    .apb_pwrite_s1           ( apb_pwrite_s1           ),
    .apb_pwdata_s1           ( apb_pwdata_s1           ),
    .apb_prdata_s1           ( apb_prdata_s1           ),
    .apb_perror_s1           ( apb_perror_s1           ),
    .apb_dev_intr            ( apb_dev_intr            ),
    .sys_reset_out           ( sys_reset_out           ),
    .jtag_tms                ( jtag_tms                ),
    .jtag_tdi                ( jtag_tdi                ),
    .jtag_tdo                ( jtag_tdo                ),
    .jtag_tck                ( jtag_tck                ),
    .ddr_port_arw_valid      ( ddr_port_arw_valid      ),
    .ddr_port_arw_ready      ( ddr_port_arw_ready      ),
    .ddr_port_arw_addr       ( ddr_arw_addr            ),
    .ddr_port_arw_id         ( ddr_port_arw_id         ),
    .ddr_port_arw_region     ( ddr_port_arw_region     ),
    .ddr_port_arw_len        ( ddr_port_arw_len        ),
    .ddr_port_arw_size       ( ddr_port_arw_size       ),
    .ddr_port_arw_burst      ( ddr_port_arw_burst      ),
    .ddr_port_arw_lock       ( ddr_port_arw_lock       ),
    .ddr_port_arw_cache      ( ddr_port_arw_cache      ),           
    .ddr_port_arw_qos        ( ddr_port_arw_qos        ),           
    .ddr_port_arw_prot       ( ddr_port_arw_prot       ),           
    .ddr_port_arw_write      ( ddr_port_arw_write      ),
    .ddr_port_w_valid        ( ddr_port_w_valid        ),                  
    .ddr_port_w_ready        ( ddr_port_w_ready        ),
    .ddr_port_w_data         ( ddr_port_w_data         ),
    .ddr_port_w_strb         ( ddr_port_w_strb         ),
    .ddr_port_w_last         ( ddr_port_w_last         ),
    .ddr_port_b_valid        ( ddr_port_b_valid        ),
    .ddr_port_b_ready        ( ddr_port_b_ready        ),
    .ddr_port_b_id           ( ddr_port_b_id           ),
    .ddr_port_b_resp         ( ddr_port_b_resp         ),
    .ddr_port_r_valid        ( ddr_port_r_valid        ),
    .ddr_port_r_ready        ( ddr_port_r_ready        ),
    .ddr_port_r_data         ( ddr_port_r_data         ),
    .ddr_port_r_id           ( ddr_port_r_id           ),
    .ddr_port_r_resp         ( ddr_port_r_resp         ),
    .ddr_port_r_last         ( ddr_port_r_last         ),
    .ddr_port_w_id           ( ddr_port_w_id           ),
    .ddr_mast0_aw_valid      ( ddr_mast0_aw_valid      ),          
    .ddr_mast0_aw_ready      ( ddr_mast0_aw_ready      ),
    .ddr_mast0_aw_addr       ( ddr_mast0_aw_addr       ),
    .ddr_mast0_aw_id         ( ddr_mast0_aw_id         ),
    .ddr_mast0_aw_region     ( ddr_mast0_aw_region     ),
    .ddr_mast0_aw_len        ( ddr_mast0_aw_len        ),
    .ddr_mast0_aw_size       ( ddr_mast0_aw_size       ),
    .ddr_mast0_aw_burst      ( ddr_mast0_aw_burst      ),
    .ddr_mast0_aw_lock       ( ddr_mast0_aw_lock       ),
    .ddr_mast0_aw_cache      ( ddr_mast0_aw_cache      ),
    .ddr_mast0_aw_qos        ( ddr_mast0_aw_qos        ),
    .ddr_mast0_aw_prot       ( ddr_mast0_aw_prot       ),
    .ddr_mast0_w_valid       ( ddr_mast0_w_valid       ),
    .ddr_mast0_w_ready       ( ddr_mast0_w_ready       ),
    .ddr_mast0_w_data        ( ddr_mast0_w_data        ),
    .ddr_mast0_w_strb        ( ddr_mast0_w_strb        ),
    .ddr_mast0_w_last        ( ddr_mast0_w_last        ),
    .ddr_mast0_b_valid       ( ddr_mast0_b_valid       ),
    .ddr_mast0_b_ready       ( ddr_mast0_b_ready       ),
    .ddr_mast0_b_id          ( ddr_mast0_b_id          ),
    .ddr_mast0_b_resp        ( ddr_mast0_b_resp        ),
    .ddr_mast0_ar_valid      ( ddr_mast0_ar_valid      ),
    .ddr_mast0_ar_ready      ( ddr_mast0_ar_ready      ),
    .ddr_mast0_ar_addr       ( ddr_mast0_ar_addr       ),
    .ddr_mast0_ar_id         ( ddr_mast0_ar_id         ),
    .ddr_mast0_ar_region     ( ddr_mast0_ar_region     ),
    .ddr_mast0_ar_len        ( ddr_mast0_ar_len        ),
    .ddr_mast0_ar_size       ( ddr_mast0_ar_size       ),
    .ddr_mast0_ar_burst      ( ddr_mast0_ar_burst      ),
    .ddr_mast0_ar_lock       ( ddr_mast0_ar_lock       ),
    .ddr_mast0_ar_cache      ( ddr_mast0_ar_cache      ),
    .ddr_mast0_ar_qos        ( ddr_mast0_ar_qos        ),
    .ddr_mast0_ar_prot       ( ddr_mast0_ar_prot       ),
    .ddr_mast0_r_valid       ( ddr_mast0_r_valid       ),
    .ddr_mast0_r_ready       ( ddr_mast0_r_ready       ),
    .ddr_mast0_r_data        ( ddr_mast0_r_data        ),
    .ddr_mast0_r_id          ( ddr_mast0_r_id          ),
    .ddr_mast0_r_resp        ( ddr_mast0_r_resp        ),
    .ddr_mast0_r_last        ( ddr_mast0_r_last        ),
    .ddr_mast0_clk           ( ddr_mast0_clk           ),
    .ddr_mast0_reset         ( ddr_mast0_reset         ),
    .axi_s_awvalid           ( axi_s_awvalid           ),
    .axi_s_awready           ( axi_s_awready           ),
    .axi_s_awaddr            ( axi_s_awaddr            ),
    .axi_s_awid              ( axi_s_awid              ),
    .axi_s_awregion          ( axi_s_awregion          ),
    .axi_s_awlen             ( axi_s_awlen             ),
    .axi_s_awsize            ( axi_s_awsize            ),
    .axi_s_awburst           ( axi_s_awburst           ),
    .axi_s_awlock            ( axi_s_awlock            ),
    .axi_s_awcache           ( axi_s_awcache           ),
    .axi_s_awqos             ( axi_s_awqos             ),
    .axi_s_awprot            ( axi_s_awprot            ),
    .axi_s_wvalid            ( axi_s_wvalid            ),
    .axi_s_wready            ( axi_s_wready            ),
    .axi_s_wdata             ( axi_s_wdata             ),
    .axi_s_wstrb             ( axi_s_wstrb             ),
    .axi_s_wlast             ( axi_s_wlast             ),
    .axi_s_bvalid            ( axi_s_bvalid            ),
    .axi_s_bready            ( axi_s_bready            ),
    .axi_s_bid               ( axi_s_bid               ),
    .axi_s_bresp             ( axi_s_bresp             ),
    .axi_s_arvalid           ( axi_s_arvalid           ),
    .axi_s_arready           ( axi_s_arready           ),
    .axi_s_araddr            ( axi_s_araddr            ),
    .axi_s_arid              ( axi_s_arid              ),
    .axi_s_arregion          ( axi_s_arregion          ),
    .axi_s_arlen             ( axi_s_arlen             ),
    .axi_s_arsize            ( axi_s_arsize            ),
    .axi_s_arburst           ( axi_s_arburst           ),
    .axi_s_arlock            ( axi_s_arlock            ),
    .axi_s_arcache           ( axi_s_arcache           ),
    .axi_s_arqos             ( axi_s_arqos             ),
    .axi_s_arprot            ( axi_s_arprot            ),
    .axi_s_rvalid            ( axi_s_rvalid            ),
    .axi_s_rready            ( axi_s_rready            ),
    .axi_s_rdata             ( axi_s_rdata             ),
    .axi_s_rid               ( axi_s_rid               ),
    .axi_s_rresp             ( axi_s_rresp             ),
    .axi_s_rlast             ( axi_s_rlast             ),
    .axi_dev_intr            ( axi_dev_intr            )
);  



endmodule
