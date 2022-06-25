`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 17:25:02
// Design Name: 
// Module Name: led_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_ctrl(
    input    sys_clk,
	input    sys_rst_n,

    output   led_pin	
);

parameter LED_CTRL_CNT_VAL = 32'd50000000;

reg [31:0] ctrl_cnt;
reg        tem_led;

always @ (posedge sys_clk or negedge sys_rst_n)
begin
    if (!sys_rst_n) begin
	    ctrl_cnt <= 32'd0;
	end 
	else if (ctrl_cnt < LED_CTRL_CNT_VAL) begin 
	    ctrl_cnt <= ctrl_cnt + 1;
	end 
	else begin
	    ctrl_cnt <= 32'd0;
	end 
end 

always @ (posedge sys_clk or negedge sys_rst_n)
begin
    if (!sys_rst_n) begin
	    tem_led <= 1'b0;
	end 
	else if (ctrl_cnt == LED_CTRL_CNT_VAL) begin 
	    tem_led <= ~tem_led;
	end 
	else begin
	    tem_led <= tem_led;
	end 
end 

assign led_pin = tem_led;

endmodule