module fifo2ddr_emb_v1 (clkr, clkw, cer, cew, rstnr, ar, aw, dw, qr);
input clkr;
input clkw;
input cer;
input cew;
input rstnr;
input [5:0] ar;
input [6:0] aw;
input [63:0] dw;
output [127:0] qr;

wire vcc_net;
wire gnd_net;
wire net_114;
wire net_115;
wire nc28161;
wire nc28162;
wire nc28163;
wire nc28164;
wire nc28165;
wire nc28166;
wire nc28167;
wire nc28168;
wire nc28169;
wire nc28170;
wire nc28171;
wire nc28172;
wire nc28173;
wire nc28174;
wire nc28175;
wire nc28176;
wire nc28177;
wire nc28178;
wire nc28179;
wire nc28180;
wire nc28181;
wire nc28182;
wire nc28183;
wire nc28184;
wire nc28185;
wire nc28186;
wire nc28187;
wire nc28188;
wire nc28189;
wire nc28190;
wire nc28191;
wire nc28192;
wire nc28193;
wire nc28194;
wire nc28195;
wire nc28196;
wire nc28197;
wire nc28198;
wire nc28199;
wire nc28200;
wire nc28201;
wire nc28202;
wire nc28203;
wire nc28204;
wire nc28205;
wire nc28206;
wire nc28207;
wire nc28208;
wire nc28209;
wire nc28210;
wire nc28211;
wire nc28212;
wire nc28213;
wire nc28214;
wire nc28215;
wire nc28216;
wire nc28217;
wire nc28218;
wire nc28219;
wire nc28220;
wire nc28221;
wire nc28222;
wire nc28223;
wire nc28224;

assign vcc_net = 1;
assign gnd_net = 0;
EMB18K #(
		.clka_inv (1'b0),
		.clkb_inv (1'b0),
		.eccreaden (1'b0),
		.eccwriteen (1'b0),
		.emb5k_1_init_file (""),
		.emb5k_2_init_file (""),
		.emb5k_3_init_file (""),
		.emb5k_4_init_file (""),
		.extension_mode ("area"),
		.init_file ("none"),
		.outreg_a (1'b0),
		.outreg_b (1'b0),
		.rammode ("sdp"),
		.use_parity (1'b0),
		.width_a (72),
		.width_b (36),
		.writemode_a ("write_first"),
		.writemode_b ("write_first")
	)
	emb_0 (
		.doa ({qr[95], qr[94], qr[93], qr[92], qr[91], qr[90], qr[89], qr[88], qr[87], qr[86], qr[85], qr[84], qr[83], qr[82], qr[81], qr[80], qr[79], qr[78], qr[77], qr[76], qr[75], qr[74], qr[73], qr[72], qr[71], qr[70], qr[69], qr[68], qr[67], qr[66], qr[65], qr[64], qr[31], qr[30], qr[29], qr[28], qr[27], qr[26], qr[25], qr[24], qr[23], qr[22], qr[21], qr[20], qr[19], qr[18], qr[17], qr[16], qr[15], qr[14], qr[13], qr[12], qr[11], qr[10], qr[9], qr[8], qr[7], qr[6], qr[5], qr[4], qr[3], qr[2], qr[1], qr[0]}),
		.dob (),
		.dopa (),
		.dopb (),
		.addra ({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, ar[5], ar[4], ar[3], ar[2], ar[1], ar[0]}),
		.addrb ({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, aw[6], aw[5], aw[4], aw[3], aw[2], aw[1], aw[0]}),
		.clka (clkr),
		.clkb (clkw),
		.dia (),
		.dib ({nc28161, nc28162, nc28163, nc28164, nc28165, nc28166, nc28167, nc28168, nc28169, nc28170, nc28171, nc28172, nc28173, nc28174, nc28175, nc28176, nc28177, nc28178, nc28179, nc28180, nc28181, nc28182, nc28183, nc28184, nc28185, nc28186, nc28187, nc28188, nc28189, nc28190, nc28191, nc28192, dw[31], dw[30], dw[29], dw[28], dw[27], dw[26], dw[25], dw[24], dw[23], dw[22], dw[21], dw[20], dw[19], dw[18], dw[17], dw[16], dw[15], dw[14], dw[13], dw[12], dw[11], dw[10], dw[9], dw[8], dw[7], dw[6], dw[5], dw[4], dw[3], dw[2], dw[1], dw[0]}),
		.dipa (),
		.dipb (),
		.cea (cer),
		.ceb (cew),
		.regcea (vcc_net),
		.regceb (),
		.regsra (rstnr),
		.regsrb (),
		.wea ({gnd_net, gnd_net, gnd_net, gnd_net}),
		.web ({vcc_net, vcc_net, vcc_net, vcc_net}),
		.eccoutdberr (),
		.eccoutsberr (),
		.eccreadaddr (),
		.eccindberr (gnd_net),
		.eccinsberr (gnd_net)
	);
EMB18K #(
		.clka_inv (1'b0),
		.clkb_inv (1'b0),
		.eccreaden (1'b0),
		.eccwriteen (1'b0),
		.emb5k_1_init_file (""),
		.emb5k_2_init_file (""),
		.emb5k_3_init_file (""),
		.emb5k_4_init_file (""),
		.extension_mode ("area"),
		.init_file ("none"),
		.outreg_a (1'b0),
		.outreg_b (1'b0),
		.rammode ("sdp"),
		.use_parity (1'b0),
		.width_a (72),
		.width_b (36),
		.writemode_a ("write_first"),
		.writemode_b ("write_first")
	)
	emb_4 (
		.doa ({qr[127], qr[126], qr[125], qr[124], qr[123], qr[122], qr[121], qr[120], qr[119], qr[118], qr[117], qr[116], qr[115], qr[114], qr[113], qr[112], qr[111], qr[110], qr[109], qr[108], qr[107], qr[106], qr[105], qr[104], qr[103], qr[102], qr[101], qr[100], qr[99], qr[98], qr[97], qr[96], qr[63], qr[62], qr[61], qr[60], qr[59], qr[58], qr[57], qr[56], qr[55], qr[54], qr[53], qr[52], qr[51], qr[50], qr[49], qr[48], qr[47], qr[46], qr[45], qr[44], qr[43], qr[42], qr[41], qr[40], qr[39], qr[38], qr[37], qr[36], qr[35], qr[34], qr[33], qr[32]}),
		.dob (),
		.dopa (),
		.dopb (),
		.addra ({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, ar[5], ar[4], ar[3], ar[2], ar[1], ar[0]}),
		.addrb ({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, aw[6], aw[5], aw[4], aw[3], aw[2], aw[1], aw[0]}),
		.clka (clkr),
		.clkb (clkw),
		.dia (),
		.dib ({nc28193, nc28194, nc28195, nc28196, nc28197, nc28198, nc28199, nc28200, nc28201, nc28202, nc28203, nc28204, nc28205, nc28206, nc28207, nc28208, nc28209, nc28210, nc28211, nc28212, nc28213, nc28214, nc28215, nc28216, nc28217, nc28218, nc28219, nc28220, nc28221, nc28222, nc28223, nc28224, dw[63], dw[62], dw[61], dw[60], dw[59], dw[58], dw[57], dw[56], dw[55], dw[54], dw[53], dw[52], dw[51], dw[50], dw[49], dw[48], dw[47], dw[46], dw[45], dw[44], dw[43], dw[42], dw[41], dw[40], dw[39], dw[38], dw[37], dw[36], dw[35], dw[34], dw[33], dw[32]}),
		.dipa (),
		.dipb (),
		.cea (cer),
		.ceb (cew),
		.regcea (vcc_net),
		.regceb (),
		.regsra (rstnr),
		.regsrb (),
		.wea ({gnd_net, gnd_net, gnd_net, gnd_net}),
		.web ({vcc_net, vcc_net, vcc_net, vcc_net}),
		.eccoutdberr (),
		.eccoutsberr (),
		.eccreadaddr (),
		.eccindberr (gnd_net),
		.eccinsberr (gnd_net)
	);

endmodule
