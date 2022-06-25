
module master_axi_top(
// AXI Master interface for in bound transactions
	I_aresetn, I_aclk,

	// write address channel signals
	O_mst_awid, O_mst_awaddr, O_mst_awlen, O_mst_awsize,
	O_mst_awburst, O_mst_awvalid, I_mst_awready,
	
	// write data channel signals
	O_mst_wid, O_mst_wdata, O_mst_wstrb, 
	O_mst_wlast, O_mst_wvalid, I_mst_wready,
	
	// write response channel signals
	I_bid, I_bresp, I_bvalid, O_bready,
	
	// read address channel signals
	O_arid, O_araddr, O_arlen, O_arsize,
	O_arburst, O_arvalid, I_arready,
	
	// read data channel signals
	I_rid, I_rdata, I_rresp,
	I_rlast, I_rvalid, O_rready,
	//
	O_cmp_result, O_machine,
	O_cmp_result_en,
	O_time,
	debug,
	test,
);

parameter RDEN = 1;
parameter WREN = 1;

parameter DDR23AXISLV_PORT_DATABUS = 128 ;
parameter DDR23AXISLV_PORT_IDWIDTH = 16;
parameter DDR_SIZE   = 32'H0800_0000;  //128M x32 words
parameter TEST_ADDR  = 32'H0000_0000;
parameter TEST_LEN   = 16 ;         //AXI burst length: 1-16
parameter TEST_DATA  = 32'H1848_3B67;
parameter BURST_DATA = 2'B01 ;         // 2'B00: Address fixed(FIFO); 2'B01: address increase ;
parameter SIZE_DATA = 3'b100 ;//100:16bytes; 011:8bytes; 010:4bytes; 001:2bytes; 000:1bytes
parameter WSTRB = 16'hFFFF ;
parameter RSTRB = 16'hFFFF ;
parameter LEN_DATA =   ( TEST_LEN == 1 ) ?  4'h0 : 
		               ( TEST_LEN == 2 ) ?  4'h1 : 
					   ( TEST_LEN == 3 ) ?  4'h2 :
					   ( TEST_LEN == 4 ) ?  4'h3 : 
					   ( TEST_LEN == 5 ) ?  4'h4 : 
					   ( TEST_LEN == 6 ) ?  4'h5 : 
					   ( TEST_LEN == 7 ) ?  4'h6 : 
					   ( TEST_LEN == 8 ) ?  4'h7 : 
					   ( TEST_LEN == 9 ) ?  4'h8 : 
					   ( TEST_LEN == 10 ) ?  4'h9 : 
					   ( TEST_LEN == 11 ) ?  4'hA : 
					   ( TEST_LEN == 12 ) ?  4'hB : 
					   ( TEST_LEN == 13 ) ?  4'hC :
					   ( TEST_LEN == 14 ) ?  4'hD : 
					   ( TEST_LEN == 15 ) ?  4'hE : 
					   ( TEST_LEN == 16 ) ?  4'hF : 4'h0 ; 
					   
parameter ADDR_ADD =   TEST_LEN*(2**SIZE_DATA);

input I_aresetn	;
input I_aclk	;
	
// write address channel signals
output reg [DDR23AXISLV_PORT_IDWIDTH-1:0]O_mst_awid	;
output reg [31:0]O_mst_awaddr ;
output reg [3:0]O_mst_awlen   ;
output reg [2:0]O_mst_awsize  ;
output reg [1:0]O_mst_awburst ;
output reg O_mst_awvalid      ;
input I_mst_awready ;

// write data channel signals
output reg [DDR23AXISLV_PORT_IDWIDTH-1:0]O_mst_wid ;
output [DDR23AXISLV_PORT_DATABUS-1:0]O_mst_wdata ;
output reg [DDR23AXISLV_PORT_DATABUS/8-1:0]O_mst_wstrb ;
output O_mst_wlast	;
output O_mst_wvalid	;
input I_mst_wready	;

// write response channel signals
input [DDR23AXISLV_PORT_IDWIDTH-1:0]I_bid ;	// axi master do not need this input signal
input [1:0]I_bresp	;
input I_bvalid		;
output reg O_bready	;

// read address channel signals
output reg [DDR23AXISLV_PORT_IDWIDTH-1:0]O_arid	;
output reg [31:0]O_araddr ;
output reg [3:0]O_arlen   ;
output reg [2:0]O_arsize  ;
output reg [1:0]O_arburst ;
output reg O_arvalid ;
input I_arready      ;

// read data channel signals
input [DDR23AXISLV_PORT_IDWIDTH-1:0]I_rid ;	// rid is not required; AXI master send 4'b0 IDs for all in-order pipelining reads
input [DDR23AXISLV_PORT_DATABUS-1:0]I_rdata;
input [1:0]I_rresp  ;
input I_rlast  ;
input I_rvalid ;
output reg O_rready	;

output O_cmp_result;
output [2:0]O_machine;
output O_cmp_result_en ;
output reg [31:0]O_time;
output [256:0]debug;
output test;

////////////////////////////////////////////////////////////////////////////
reg [3:0]S_rvalid;
reg [4:0]S_wr_cnt;
reg [15:0]S_wr_data;
reg [15:0]S_rd_data;
reg [DDR23AXISLV_PORT_DATABUS-1:0]S_cmp_data;
reg S_dsp_cmp_result;

reg [5:0]S_wrsram_addr_rd;
wire [DDR23AXISLV_PORT_DATABUS-1:0]S_wrsram_rdata;
reg [DDR23AXISLV_PORT_DATABUS-1:0]S_wrsram_rdata_2;

reg [5:0]S_rdsram_addr_rd;

wire mst_wlast	;
wire mst_wvalid ;
wire data_rvalid;

wire [DDR23AXISLV_PORT_DATABUS-1:0] sram_128_qa;
wire [DDR23AXISLV_PORT_DATABUS-1:0] sram_128_qb;

reg mst_wvalid_d1, mst_wvalid_d2;
reg mst_wlast_d1, mst_wlast_d2;

assign O_mst_wvalid = mst_wvalid_d2 ;
assign O_mst_wlast = mst_wlast_d2 ;


always @(posedge I_aclk) begin
	mst_wvalid_d1 <= mst_wvalid ;
	mst_wvalid_d2 <= mst_wvalid_d1 ;
	
	mst_wlast_d1 <= mst_wlast ;
	mst_wlast_d2 <= mst_wlast_d1 ;
end

reg [2:0]S_machine;
localparam  IDLE  = 0;
localparam  SET_WR_ADDR = 1;
localparam  SET_WR_DATA = 2;
localparam  GET_WR_RESP = 3;
localparam  SET_RD_ADDR = 4;
localparam  GET_RD_DATA = 5;
localparam  SET_IDLE	= 6;

wire S_data_wr_done ;

assign O_machine = S_machine ;
assign O_cmp_result_en = S_rvalid[1] ;
assign O_cmp_result = S_dsp_cmp_result;

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_rvalid <= 0 ;
	else S_rvalid <= { S_rvalid ,I_rvalid };
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_machine <= IDLE ;
	else
		case ( S_machine )
			IDLE        : S_machine <= ( WREN == 1 ) ? SET_WR_ADDR : 
			                           ( RDEN == 1 ) ? SET_RD_ADDR : S_machine ;
			SET_WR_ADDR : S_machine <= ( I_mst_awready && O_mst_awvalid ) ?  SET_WR_DATA : S_machine ;
			SET_WR_DATA : S_machine <= ( I_mst_wready && mst_wvalid && mst_wlast ) ? GET_WR_RESP : S_machine ; 
			
			GET_WR_RESP : S_machine <= ( I_bvalid && O_bready ) ? ( (RDEN == 1) ? SET_RD_ADDR : IDLE ) : S_machine ; 
			
			SET_RD_ADDR : S_machine <= ( I_arready&& O_arvalid ) ? GET_RD_DATA : S_machine ;
			GET_RD_DATA : S_machine <= ( I_rvalid && O_rready && I_rlast ) ? IDLE : S_machine ;
			
			SET_IDLE : S_machine <= ( I_mst_awready == 1'b1) ? IDLE : S_machine ;
			default : S_machine <= IDLE;
		endcase
end

reg [2:0] S_machine_d1;
always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_machine_d1 <= 3'b000 ;
	else
		S_machine_d1 <= S_machine ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_wr_cnt <= 0 ;
	else
		case ( S_machine )
			SET_WR_DATA : S_wr_cnt <= S_data_wr_done ? 0 : S_wr_cnt + 1 ;
			default : S_wr_cnt <= 0 ;
		endcase
end

assign S_data_wr_done = S_wr_cnt == O_mst_awlen ;

//always @( posedge I_aclk or negedge I_aresetn ) begin
//	if( !I_aresetn ) mst_wvalid <= 1'b0 ;
//	else
//		case ( S_machine )
//			SET_WR_DATA : mst_wvalid <= 1'b1;
//			default : mst_wvalid <= 1'b0 ;
//		endcase
//	end

//always @( posedge I_aclk or negedge I_aresetn ) begin
//	if( !I_aresetn ) mst_wlast <= 1'b0 ;
//	else
//		case ( S_machine )
//			SET_WR_DATA : mst_wlast <= ( I_mst_wready && mst_wvalid && S_data_wr_done ) ? 1'b1 : 1'b0 ;
//			default : mst_wlast <= 1'b0 ;
//		endcase
//end
assign mst_wlast = S_data_wr_done;

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awvalid <= 1'b0 ;
	else
		case ( S_machine )
			SET_WR_ADDR : O_mst_awvalid <= ( I_mst_awready && O_mst_awvalid ) ?  1'b0 : 1'b1 ; //1'b1 ;
			default : O_mst_awvalid <= 1'b0 ;
		endcase
end

assign mst_wvalid = S_machine == SET_WR_DATA ? 1'b1 : 1'b0;
assign data_rvalid = S_machine == GET_RD_DATA ? 1'b1 : 1'b0;

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_bready <= 1'b0 ;
	else 
		O_bready <= 1'b1 ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_arvalid <= 1'b0 ;
	else
		case ( S_machine )
			SET_RD_ADDR : O_arvalid <= (  I_arready && O_arvalid ) ? 1'b0 : 1'B1 ; //1'b1
			default : O_arvalid <= 1'b0 ;
		endcase
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_rready <= 1'b0 ;
	else O_rready <= 1'b1 ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awsize <= 3'b000 ;
	else O_mst_awsize <= SIZE_DATA;
end
always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_arsize <= 3'b000 ;
	else O_arsize <= SIZE_DATA ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awlen <= 4'b000 ;
	else O_mst_awlen <= LEN_DATA ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_arlen <= 4'b000 ;
	else O_arlen <= LEN_DATA ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awburst <= 2'B00 ;
	else O_mst_awburst <= BURST_DATA ;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_arburst <= 2'B00 ;
	else O_arburst <= BURST_DATA;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awid <= 16'H0 ;
	else O_mst_awid <= 16'H0;
end
always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_wid <= 16'H0 ;
	else O_mst_wid <= 16'H0;
end
always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_arid <= 16'H0 ;
	else O_arid <= 16'H0;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_awaddr <= TEST_ADDR ;
	else 
//		if ( I_mst_awready && O_mst_awvalid )
//			O_mst_awaddr <= O_mst_awaddr + ADDR_ADD;
		if ( I_mst_wready && mst_wvalid )
			if (O_mst_awaddr == DDR_SIZE)
				O_mst_awaddr <= TEST_ADDR;
			else
				O_mst_awaddr <= O_mst_awaddr + 2**SIZE_DATA;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_araddr <= TEST_ADDR ;
	else 
//		if ( I_arready && O_arvalid )
//			O_araddr <= O_araddr + ADDR_ADD;
		if ( I_rvalid && O_rready )
		    if (O_araddr == DDR_SIZE)
				O_araddr <= TEST_ADDR;
			else
				O_araddr <= O_araddr + 2**SIZE_DATA;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_mst_wstrb <= 'H0 ;
	else O_mst_wstrb <= WSTRB;
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) O_time <= 'H0 ;
	else 
		case( S_machine )
			SET_WR_ADDR : O_time <= ( I_mst_awready && O_mst_awvalid ) ? ( O_time + 1'b1 ) : O_time ;
		endcase
end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_wrsram_addr_rd <= 'H0 ;
	//else S_wrsram_addr_rd <= ( I_mst_wready && mst_wvalid && mst_wlast ) ? ( S_wrsram_addr_rd + 1'b1 ) : S_wrsram_addr_rd ;
	//else S_wrsram_addr_rd <= ( I_mst_wready && mst_wvalid ) ? ( S_wrsram_addr_rd + 1'b1 ) : S_wrsram_addr_rd ;
	else S_wrsram_addr_rd <= O_mst_awaddr[9:4];
end

//always @( posedge I_aclk or negedge I_aresetn ) begin
//	if( !I_aresetn ) S_wrsram_addr_rd <= 'H0 ;
//	else
//		if( mst_wvalid )
//			if( I_mst_wready && mst_wvalid )
//				S_wrsram_addr_rd <= S_wrsram_addr_rd + 1'b1 ;
//		else
//			S_wrsram_addr_rd <= 'H0 ;
//end

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_rdsram_addr_rd <= 'H0 ;
	//else S_rdsram_addr_rd <= ( I_rvalid && O_rready && I_rlast ) ? ( S_rdsram_addr_rd + 1'b1 ) : S_rdsram_addr_rd ;
//	else S_rdsram_addr_rd <= ( I_rvalid && O_rready ) ? ( S_rdsram_addr_rd + 1'b1 ) : S_rdsram_addr_rd ;
	else 
		//if ( I_rvalid && O_rready )
			S_rdsram_addr_rd <= O_araddr[9:4] ;
end
//always @( posedge I_aclk or negedge I_aresetn ) begin
//	if( !I_aresetn ) S_rdsram_addr_rd <= 'H0 ;
//	else
//		if( data_rvalid )
//			if( I_rvalid && O_rready )
//				S_rdsram_addr_rd <= S_rdsram_addr_rd + 1'b1 ;
//		else
//			S_rdsram_addr_rd <= 'H0 ;
//end

assign O_mst_wdata =  S_wrsram_rdata_2 ;  
always @( posedge I_aclk) begin
	S_wrsram_rdata_2 <= sram_128_qa ;
	S_cmp_data <= sram_128_qb ;
end

reg I_rvalid_d1;
always @(posedge I_aclk) begin
	I_rvalid_d1 <= I_rvalid;
end

sram_128 sram_wr_inst(
	.aa   ( S_wrsram_addr_rd    ), 
	.ab   ( S_rdsram_addr_rd    ),
	.cea  ( 1'b1                ), 
	.ceb  ( 1'b1                ), 
	.clka ( I_aclk       	    ), 
	.clkb ( I_aclk				), 
	.da   ( 0				    ),
	.db   ( 0				    ), 
	.qa   ( sram_128_qa		    ), //outreg enable
	.qb   ( sram_128_qb         ), //outreg enable
	.rstna( I_aresetn          ), 
	.rstnb( I_aresetn          ), 
	.wea   ( 0   ),
	.web   ( 0   )
);

reg [DDR23AXISLV_PORT_DATABUS-1:0] I_rdata_d1;
always @(posedge I_aclk) begin
	I_rdata_d1 <= I_rdata;
end

wire matched;
app_128_comp #( .RSTRB(RSTRB) )
dsp_cmp_inst(
		.clk  ( I_aclk         ), 
		.rstn ( I_aresetn      ),
		.ce   ( I_rvalid_d1    ),
		.a    ( sram_128_qb    ),
		.b    ( I_rdata_d1     ),
		.match( matched    	   ),
		.test ( test )
	);

always @( posedge I_aclk or negedge I_aresetn ) begin
	if( !I_aresetn ) S_dsp_cmp_result <= 'b0 ;
	else 
		case( S_machine )
			GET_RD_DATA : S_dsp_cmp_result <= ( I_rvalid && O_rready ) ?  matched: S_dsp_cmp_result; 
			default : S_dsp_cmp_result <= S_dsp_cmp_result;
		endcase
end

//debugware_v2_1 debug_inst(
//    .trig_out_0( ),
//    .data_in_0( {I_rvalid, O_rready, S_dsp_cmp_result, matched, S_machine} ),
//    .ref_clk_0( I_aclk )
//);

reg [23:0]Performence_C;
reg [23:0]Performence, Perf_reg;
always @(posedge I_aclk )begin
	if (Performence_C <=24'H0F4240) begin
		Performence_C <= Performence_C + 1;
		if( O_mst_awvalid == 1'b1)                  //O_arvalid
			Performence <= Performence + 1;
		else
			Performence <= Performence;
	end
	else begin
		Performence_C <= 0;
		Performence <= 0;
	end
end
always @( posedge I_aclk ) begin
	if (Performence_C == 24'H0F423F)
		Perf_reg <= Performence ;
end

//assign debug = {S_dsp_cmp_result,S_rdsram_addr_rd,S_wrsram_addr_rd, 8'b00000000, Perf_reg, S_cmp_data[31:0]};
//assign debug = {sram_128_qb,S_data_wr_done,S_wr_cnt};
assign debug = {I_rdata_d1[15:0],sram_128_qb[15:0],matched,S_wr_cnt};
	
endmodule
