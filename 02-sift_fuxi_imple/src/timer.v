`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/12 10:37:24
// Design Name: 
// Module Name: timer
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
// INSTANTIATION TEMPLATE
// 
// timer
// #(
//     .CLK_FREQUENCY(50_000_000), // Clock frequency. Maximum: 4294967295.
//     .TIME_UNIT(1)               // 0: ms, 1: us, default: us.
// ) inst_name (
//     .rst(),         // Input. Active low. Low: reset.
//     .clk(),         // Input. 
//     .start_flag(),  // Input. Active high.
//     .stop_flag(),   // Input. Active high.
//     .time_cost(),   // Output. [29:0]. Unit: TIME_UNIT. Maximum: 1000 seconds.
//     .overflow()     // Output. Active high.
// );
//////////////////////////////////////////////////////////////////////////////////


module timer
#(
    parameter CLK_FREQUENCY = 50_000_000,   // Clock frequency. Maximum: 4294967295.
    parameter TIME_UNIT     = 1             // 0: ms, 1: us, default: us.
)(
    input           rst,        // Input. Active low. Low: reset.
    input           clk,        // Input. 
    input           start_flag, // Input. Active high.
    input           stop_flag,  // Input. Active high.
    output  [29:0]  time_cost,  // Output. [29:0]. Unit: TIME_UNIT. Maximum: 1000 seconds.
    output  reg     overflow    // Output. Active high.
);

    localparam MAX_SECONDS = 1000;    // Maximum seconds of timer.
    localparam [41:0] MAX_CNT = CLK_FREQUENCY * MAX_SECONDS;

    reg is_counting;
    reg [clogb2(MAX_CNT+1)-1:0] clk_cnt;

    wire [clogb2(MAX_CNT+1)+20-1:0] time_cost_long;
    assign time_cost_long = clk_cnt * (TIME_UNIT == 0 ? 1000 : 1_000_000) / CLK_FREQUENCY;
    assign time_cost = time_cost_long[29:0];

    always @(posedge clk or negedge rst) begin
        if (!rst)
            is_counting <= 0;
        else begin
            if (!is_counting && start_flag)
                is_counting <= 1;
            else if (is_counting && stop_flag)
                is_counting <= 0;
            else
                is_counting <= is_counting;
        end
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            clk_cnt <= 0;
        else begin
            if (is_counting) begin
                if (stop_flag)
                    clk_cnt <= clk_cnt;
                else
                    clk_cnt <= clk_cnt + 1;
            end
            else begin
                if (start_flag)
                    clk_cnt <= 1;
                else
                    clk_cnt <= clk_cnt;
            end
        end
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            overflow <= 0;
        else begin
            if (!is_counting && start_flag)
                overflow <= 0;
            else if (clk_cnt == MAX_CNT)
                overflow <= 1;
            else
                overflow <= overflow;
        end
    end

function integer clogb2 (input integer bit_depth);              
begin                                                           
	 for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
	 bit_depth = bit_depth >> 1;                                 
end                                                           
endfunction   

endmodule
