`timescale 1ns / 1ps


module tf_dir36to8();

reg     clk;
reg [5:0]   dir_in;
reg [5:0]   dir_main;
wire    [2:0]   dir_out;

initial begin
    clk = 1'b0;
    dir_in = 6'd0;
    dir_main = 6'd0;
end

always #10 clk <= ~clk;

always@(posedge clk)
    if(dir_in > 6'd34)
        dir_in <= 6'd0;
    else
        dir_in <= dir_in + 6'd1;

always@(posedge clk)
    if(dir_main > 6'd33)
        dir_main <= 6'd0;
    else
        dir_main <= dir_main + 6'd2;
        
        
dir36to8 tb_dir36to8
(
    .dir_in(dir_in),
	.dir_main(dir_main),
    .dir_out(dir_out)
);


endmodule
