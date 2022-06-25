`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir9_1 
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

module dir9_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h8;
            001: spo = 5'h7;
            002: spo = 5'h6;
            003: spo = 5'h5;
            004: spo = 5'h4;
            005: spo = 5'h3;
            006: spo = 5'h2;
            007: spo = 5'h1;
            008: spo = 5'h0;
            009: spo = 5'h1f;
            010: spo = 5'h1e;
            011: spo = 5'h1d;
            012: spo = 5'h1c;
            013: spo = 5'h1b;
            014: spo = 5'h1a;
            015: spo = 5'h19;
            016: spo = 5'h8;
            017: spo = 5'h7;
            018: spo = 5'h6;
            019: spo = 5'h5;
            020: spo = 5'h4;
            021: spo = 5'h3;
            022: spo = 5'h2;
            023: spo = 5'h1;
            024: spo = 5'h0;
            025: spo = 5'h1f;
            026: spo = 5'h1e;
            027: spo = 5'h1d;
            028: spo = 5'h1c;
            029: spo = 5'h1b;
            030: spo = 5'h1a;
            031: spo = 5'h19;
            032: spo = 5'h8;
            033: spo = 5'h7;
            034: spo = 5'h6;
            035: spo = 5'h5;
            036: spo = 5'h4;
            037: spo = 5'h3;
            038: spo = 5'h2;
            039: spo = 5'h1;
            040: spo = 5'h0;
            041: spo = 5'h1f;
            042: spo = 5'h1e;
            043: spo = 5'h1d;
            044: spo = 5'h1c;
            045: spo = 5'h1b;
            046: spo = 5'h1a;
            047: spo = 5'h19;
            048: spo = 5'h8;
            049: spo = 5'h7;
            050: spo = 5'h6;
            051: spo = 5'h5;
            052: spo = 5'h4;
            053: spo = 5'h3;
            054: spo = 5'h2;
            055: spo = 5'h1;
            056: spo = 5'h0;
            057: spo = 5'h1f;
            058: spo = 5'h1e;
            059: spo = 5'h1d;
            060: spo = 5'h1c;
            061: spo = 5'h1b;
            062: spo = 5'h1a;
            063: spo = 5'h19;
            064: spo = 5'h8;
            065: spo = 5'h7;
            066: spo = 5'h6;
            067: spo = 5'h5;
            068: spo = 5'h4;
            069: spo = 5'h3;
            070: spo = 5'h2;
            071: spo = 5'h1;
            072: spo = 5'h0;
            073: spo = 5'h1f;
            074: spo = 5'h1e;
            075: spo = 5'h1d;
            076: spo = 5'h1c;
            077: spo = 5'h1b;
            078: spo = 5'h1a;
            079: spo = 5'h19;
            080: spo = 5'h8;
            081: spo = 5'h7;
            082: spo = 5'h6;
            083: spo = 5'h5;
            084: spo = 5'h4;
            085: spo = 5'h3;
            086: spo = 5'h2;
            087: spo = 5'h1;
            088: spo = 5'h0;
            089: spo = 5'h1f;
            090: spo = 5'h1e;
            091: spo = 5'h1d;
            092: spo = 5'h1c;
            093: spo = 5'h1b;
            094: spo = 5'h1a;
            095: spo = 5'h19;
            096: spo = 5'h8;
            097: spo = 5'h7;
            098: spo = 5'h6;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h3;
            102: spo = 5'h2;
            103: spo = 5'h1;
            104: spo = 5'h0;
            105: spo = 5'h1f;
            106: spo = 5'h1e;
            107: spo = 5'h1d;
            108: spo = 5'h1c;
            109: spo = 5'h1b;
            110: spo = 5'h1a;
            111: spo = 5'h19;
            112: spo = 5'h8;
            113: spo = 5'h7;
            114: spo = 5'h6;
            115: spo = 5'h5;
            116: spo = 5'h4;
            117: spo = 5'h3;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h0;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1d;
            124: spo = 5'h1c;
            125: spo = 5'h1b;
            126: spo = 5'h1a;
            127: spo = 5'h19;
            128: spo = 5'h8;
            129: spo = 5'h7;
            130: spo = 5'h6;
            131: spo = 5'h5;
            132: spo = 5'h4;
            133: spo = 5'h3;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1d;
            140: spo = 5'h1c;
            141: spo = 5'h1b;
            142: spo = 5'h1a;
            143: spo = 5'h19;
            144: spo = 5'h8;
            145: spo = 5'h7;
            146: spo = 5'h6;
            147: spo = 5'h5;
            148: spo = 5'h4;
            149: spo = 5'h3;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h0;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1d;
            156: spo = 5'h1c;
            157: spo = 5'h1b;
            158: spo = 5'h1a;
            159: spo = 5'h19;
            160: spo = 5'h8;
            161: spo = 5'h7;
            162: spo = 5'h6;
            163: spo = 5'h5;
            164: spo = 5'h4;
            165: spo = 5'h3;
            166: spo = 5'h2;
            167: spo = 5'h1;
            168: spo = 5'h0;
            169: spo = 5'h1f;
            170: spo = 5'h1e;
            171: spo = 5'h1d;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1a;
            175: spo = 5'h19;
            176: spo = 5'h8;
            177: spo = 5'h7;
            178: spo = 5'h6;
            179: spo = 5'h5;
            180: spo = 5'h4;
            181: spo = 5'h3;
            182: spo = 5'h2;
            183: spo = 5'h1;
            184: spo = 5'h0;
            185: spo = 5'h1f;
            186: spo = 5'h1e;
            187: spo = 5'h1d;
            188: spo = 5'h1c;
            189: spo = 5'h1b;
            190: spo = 5'h1a;
            191: spo = 5'h19;
            192: spo = 5'h8;
            193: spo = 5'h7;
            194: spo = 5'h6;
            195: spo = 5'h5;
            196: spo = 5'h4;
            197: spo = 5'h3;
            198: spo = 5'h2;
            199: spo = 5'h1;
            200: spo = 5'h0;
            201: spo = 5'h1f;
            202: spo = 5'h1e;
            203: spo = 5'h1d;
            204: spo = 5'h1c;
            205: spo = 5'h1b;
            206: spo = 5'h1a;
            207: spo = 5'h19;
            208: spo = 5'h8;
            209: spo = 5'h7;
            210: spo = 5'h6;
            211: spo = 5'h5;
            212: spo = 5'h4;
            213: spo = 5'h3;
            214: spo = 5'h2;
            215: spo = 5'h1;
            216: spo = 5'h0;
            217: spo = 5'h1f;
            218: spo = 5'h1e;
            219: spo = 5'h1d;
            220: spo = 5'h1c;
            221: spo = 5'h1b;
            222: spo = 5'h1a;
            223: spo = 5'h19;
            224: spo = 5'h8;
            225: spo = 5'h7;
            226: spo = 5'h6;
            227: spo = 5'h5;
            228: spo = 5'h4;
            229: spo = 5'h3;
            230: spo = 5'h2;
            231: spo = 5'h1;
            232: spo = 5'h0;
            233: spo = 5'h1f;
            234: spo = 5'h1e;
            235: spo = 5'h1d;
            236: spo = 5'h1c;
            237: spo = 5'h1b;
            238: spo = 5'h1a;
            239: spo = 5'h19;
            240: spo = 5'h8;
            241: spo = 5'h7;
            242: spo = 5'h6;
            243: spo = 5'h5;
            244: spo = 5'h4;
            245: spo = 5'h3;
            246: spo = 5'h2;
            247: spo = 5'h1;
            248: spo = 5'h0;
            249: spo = 5'h1f;
            250: spo = 5'h1e;
            251: spo = 5'h1d;
            252: spo = 5'h1c;
            253: spo = 5'h1b;
            254: spo = 5'h1a;
            255: spo = 5'h19;
            default: spo = 5'h0;
		endcase
	end
endmodule