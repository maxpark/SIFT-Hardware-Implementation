`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:16 06/14/2022 
// Design Name: 
// Module Name:    main_ori_rom_distr
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
//////////////////////////////////////////////////////////////////////////////////

module main_ori_rom_distr
(
    input   [6:0]       a,  // Addr.
	output  reg [5:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 6'h0;
            001: spo = 6'h0;
            002: spo = 6'h0;
            003: spo = 6'h1;
            004: spo = 6'h1;
            005: spo = 6'h2;
            006: spo = 6'h1;
            007: spo = 6'h1;
            008: spo = 6'h0;
            009: spo = 6'h0;
            010: spo = 6'h0;
            011: spo = 6'h0;
            012: spo = 6'h1;
            013: spo = 6'h2;
            014: spo = 6'h3;
            015: spo = 6'h5;
            016: spo = 6'h5;
            017: spo = 6'h5;
            018: spo = 6'h3;
            019: spo = 6'h2;
            020: spo = 6'h1;
            021: spo = 6'h0;
            022: spo = 6'h0;
            023: spo = 6'h2;
            024: spo = 6'h4;
            025: spo = 6'h8;
            026: spo = 6'hc;
            027: spo = 6'hd;
            028: spo = 6'hc;
            029: spo = 6'h8;
            030: spo = 6'h4;
            031: spo = 6'h2;
            032: spo = 6'h0;
            033: spo = 6'h1;
            034: spo = 6'h3;
            035: spo = 6'h8;
            036: spo = 6'hf;
            037: spo = 6'h16;
            038: spo = 6'h1a;
            039: spo = 6'h16;
            040: spo = 6'hf;
            041: spo = 6'h8;
            042: spo = 6'h3;
            043: spo = 6'h1;
            044: spo = 6'h1;
            045: spo = 6'h5;
            046: spo = 6'hc;
            047: spo = 6'h16;
            048: spo = 6'h21;
            049: spo = 6'h26;
            050: spo = 6'h21;
            051: spo = 6'h16;
            052: spo = 6'hc;
            053: spo = 6'h5;
            054: spo = 6'h1;
            055: spo = 6'h2;
            056: spo = 6'h5;
            057: spo = 6'hd;
            058: spo = 6'h1a;
            059: spo = 6'h26;
            060: spo = 6'h2b;
            061: spo = 6'h26;
            062: spo = 6'h1a;
            063: spo = 6'hd;
            064: spo = 6'h5;
            065: spo = 6'h2;
            066: spo = 6'h1;
            067: spo = 6'h5;
            068: spo = 6'hc;
            069: spo = 6'h16;
            070: spo = 6'h21;
            071: spo = 6'h26;
            072: spo = 6'h21;
            073: spo = 6'h16;
            074: spo = 6'hc;
            075: spo = 6'h5;
            076: spo = 6'h1;
            077: spo = 6'h1;
            078: spo = 6'h3;
            079: spo = 6'h8;
            080: spo = 6'hf;
            081: spo = 6'h16;
            082: spo = 6'h1a;
            083: spo = 6'h16;
            084: spo = 6'hf;
            085: spo = 6'h8;
            086: spo = 6'h3;
            087: spo = 6'h1;
            088: spo = 6'h0;
            089: spo = 6'h2;
            090: spo = 6'h4;
            091: spo = 6'h8;
            092: spo = 6'hc;
            093: spo = 6'hd;
            094: spo = 6'hc;
            095: spo = 6'h8;
            096: spo = 6'h4;
            097: spo = 6'h2;
            098: spo = 6'h0;
            099: spo = 6'h0;
            100: spo = 6'h1;
            101: spo = 6'h2;
            102: spo = 6'h3;
            103: spo = 6'h5;
            104: spo = 6'h5;
            105: spo = 6'h5;
            106: spo = 6'h3;
            107: spo = 6'h2;
            108: spo = 6'h1;
            109: spo = 6'h0;
            110: spo = 6'h0;
            111: spo = 6'h0;
            112: spo = 6'h0;
            113: spo = 6'h1;
            114: spo = 6'h1;
            115: spo = 6'h2;
            116: spo = 6'h1;
            117: spo = 6'h1;
            118: spo = 6'h0;
            119: spo = 6'h0;
            120: spo = 6'h0;
            121: spo = 6'h0;
            122: spo = 6'h0;
            123: spo = 6'h0;
            124: spo = 6'h0;
            125: spo = 6'h0;
            126: spo = 6'h0;
            127: spo = 6'h0;
            default: spo = 6'h0;
		endcase
	end
endmodule