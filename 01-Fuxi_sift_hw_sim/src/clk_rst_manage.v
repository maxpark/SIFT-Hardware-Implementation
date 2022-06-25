// ============================================================
//
// Company:
// Engineer:
//
// Create Date: 10/30/2021 15:42:17   
// Design Name:
// Module Name: clk_rst_manage
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
module clk_rst_manage(
    input        CLK_25M,
    input        CLK_12M,
    input        RST_N,
	
	output       o_sys_clk,	
	output       o_core_clk,
	output       o_debounce_clk,
	output       o_memory_clk,
	
	output       o_core_reset,
	output       o_sys_rstn,
	
	output       o_clk_ddr,      
    output       o_ddr_rstn, 
      
    output       o_clk_ddr_cfg,  
    output       o_ddr_cfg_rstn		
);

wire  core_clk;   
wire  sys_clk;    
wire  memory_clk; 
wire  clk_ddr;    
wire  clk_ddr_cfg;

wire  rstn_sig;

pll_main  pll_main(
    .clkin0     ( CLK_25M      ),
    .clkout0    ( core_clk     ),		//80M 
    .clkout1    ( sys_clk      ),		//100M
    .clkout2    ( memory_clk   ),		//80M
	.clkout3    ( clk_ddr      ),		//200M
    .clkout4    ( clk_ddr_cfg  ),		//25M

    .locked     ( locked       )
);

assign rstn_sig = RST_N & locked;

reg [7:0] rst_wait_cnt;
reg       rstn_flag;

always @ (posedge CLK_25M or negedge rstn_sig) 
begin
    if (rstn_sig == 1'b0) begin
        rst_wait_cnt <= 8'd0;
	end 
	else if (rst_wait_cnt < 8'd100) begin
        rst_wait_cnt <= rst_wait_cnt + 1;
	end 
	else begin
	    rst_wait_cnt <= rst_wait_cnt;
	end 
end  

always @ (posedge CLK_25M or negedge rstn_sig) 
begin
    if (rstn_sig == 1'b0) begin
        rstn_flag <= 1'b0;
	end 
	else if (rst_wait_cnt == 8'd100) begin
        rstn_flag <= 1'b1;
	end 
	else begin
	    rstn_flag <= rstn_flag;
	end 
end 


reg [7:0] ddr_cfg_rst_wait_cnt;
reg       ddr_cfg_rstn_flag;

always @ (posedge clk_ddr_cfg or negedge rstn_flag) 
begin
    if (rstn_flag == 1'b0) begin
        ddr_cfg_rst_wait_cnt <= 8'd0;
	end 
	else if (ddr_cfg_rst_wait_cnt < 8'd100) begin
        ddr_cfg_rst_wait_cnt <= ddr_cfg_rst_wait_cnt + 1;
	end 
	else begin
	    ddr_cfg_rst_wait_cnt <= ddr_cfg_rst_wait_cnt;
	end 
end  

always @ (posedge clk_ddr_cfg or negedge rstn_flag) 
begin
    if (rstn_flag == 1'b0) begin
        ddr_cfg_rstn_flag <= 1'b0;
	end 
	else if (ddr_cfg_rst_wait_cnt == 8'd100) begin
        ddr_cfg_rstn_flag <= 1'b1;
	end 
	else begin
	    ddr_cfg_rstn_flag <= ddr_cfg_rstn_flag;
	end 
end


reg [7:0] ddr_rst_wait_cnt;
reg       ddr_rstn_flag;

always @ (posedge clk_ddr or negedge ddr_cfg_rstn_flag) 
begin
    if (ddr_cfg_rstn_flag == 1'b0) begin
        ddr_rst_wait_cnt <= 8'd0;
	end 
	else if (ddr_rst_wait_cnt < 8'd100) begin
        ddr_rst_wait_cnt <= ddr_rst_wait_cnt + 1;
	end 
	else begin
	    ddr_rst_wait_cnt <= ddr_rst_wait_cnt;
	end 
end  

always @ (posedge clk_ddr or negedge ddr_cfg_rstn_flag) 
begin
    if (ddr_cfg_rstn_flag == 1'b0) begin
        ddr_rstn_flag <= 1'b0;
	end 
	else if (ddr_rst_wait_cnt == 8'd100) begin
        ddr_rstn_flag <= 1'b1;
	end 
	else begin
	    ddr_rstn_flag <= ddr_rstn_flag;
	end 
end


reg [7:0] sys_rst_wait_cnt;
reg       sys_rstn_flag;

always @ (posedge sys_clk or negedge ddr_rstn_flag) 
begin
    if (ddr_rstn_flag == 1'b0) begin
        sys_rst_wait_cnt <= 8'd0;
	end 
	else if (sys_rst_wait_cnt < 8'd100) begin
        sys_rst_wait_cnt <= sys_rst_wait_cnt + 1;
	end 
	else begin
	    sys_rst_wait_cnt <= sys_rst_wait_cnt;
	end 
end  

always @ (posedge sys_clk or negedge ddr_rstn_flag) 
begin
    if (ddr_rstn_flag == 1'b0) begin
        sys_rstn_flag <= 1'b0;
	end 
	else if (sys_rst_wait_cnt == 8'd100) begin
        sys_rstn_flag <= 1'b1;
	end 
	else begin
	    sys_rstn_flag <= sys_rstn_flag;
	end 
end


reg [7:0] core_rst_wait_cnt;
reg       core_rst_flag;

always @ (posedge core_clk or negedge sys_rstn_flag) 
begin
    if (sys_rstn_flag == 1'b0) begin
        core_rst_wait_cnt <= 8'd0;
	end 
	else if (core_rst_wait_cnt < 8'd100) begin
        core_rst_wait_cnt <= core_rst_wait_cnt + 1;
	end 
	else begin
	    core_rst_wait_cnt <= core_rst_wait_cnt;
	end 
end  

always @ (posedge core_clk or negedge sys_rstn_flag) 
begin
    if (sys_rstn_flag == 1'b0) begin
        core_rst_flag <= 1'b1;
	end 
	else if (core_rst_wait_cnt == 8'd100) begin
        core_rst_flag <= 1'b0;
	end 
	else begin
	    core_rst_flag <= core_rst_flag;
	end 
end

assign o_core_clk       = core_clk;   
assign o_sys_clk        = sys_clk;    
assign o_clk_ddr        = clk_ddr;    
assign o_clk_ddr_cfg    = clk_ddr_cfg;
assign o_debounce_clk   = clk_ddr_cfg;


assign o_core_reset     = core_rst_flag;
assign o_sys_rstn       = sys_rstn_flag;
assign o_ddr_rstn       = ddr_rstn_flag;
assign o_ddr_cfg_rstn   = ddr_cfg_rstn_flag;
assign o_memory_clk     = memory_clk;



endmodule
