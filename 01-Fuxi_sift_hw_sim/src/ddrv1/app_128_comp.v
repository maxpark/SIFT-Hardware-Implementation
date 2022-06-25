module app_128_comp(
	clk, 
	rstn,
	ce,
	a,
	b,
	match,
	test
);
parameter RSTRB = 16'hFFFF;
	
input   clk;
input   rstn;
input   ce;
input [127:0] a;
input [127:0] b;
output match;
output test;

reg [15:0]S_cmp_result_0;
reg [15:0]S_cmp_result_0_d1;
reg S_cmp_result_1;
reg [127:0] a_d1;
reg [127:0] b_d1;

always @( posedge clk ) begin 
	if (ce) begin 
		a_d1 <= a;
		b_d1 <= b;
	end
end

generate
genvar i;
	for(i=0; i<16; i=i+1)begin                        //16
		always @( posedge clk ) begin 
			if (ce) begin 
				if(RSTRB[i])
					if(i==13)
						S_cmp_result_0[i] <= ( {a_d1[8*i+6: 8*i ]} == b_d1[8*i+7: 8*i ]);//axi bit111 has bug,nto fix
					else
						S_cmp_result_0[i] <= ( a_d1[8*i+7: 8*i ] == b_d1[8*i+7: 8*i ]);
				else
					S_cmp_result_0[i] <= 1'b1;
			end
		end
		
		
	end
endgenerate


always @( posedge clk ) begin 
	S_cmp_result_1 <= &S_cmp_result_0;
end

assign match = S_cmp_result_1;


endmodule