`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir17_1 
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

module dir17_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h9;
            001: spo = 5'h9;
            002: spo = 5'h9;
            003: spo = 5'h9;
            004: spo = 5'h9;
            005: spo = 5'h8;
            006: spo = 5'h8;
            007: spo = 5'h8;
            008: spo = 5'h8;
            009: spo = 5'h8;
            010: spo = 5'h8;
            011: spo = 5'h7;
            012: spo = 5'h7;
            013: spo = 5'h7;
            014: spo = 5'h7;
            015: spo = 5'h7;
            016: spo = 5'h8;
            017: spo = 5'h8;
            018: spo = 5'h8;
            019: spo = 5'h8;
            020: spo = 5'h8;
            021: spo = 5'h7;
            022: spo = 5'h7;
            023: spo = 5'h7;
            024: spo = 5'h7;
            025: spo = 5'h7;
            026: spo = 5'h7;
            027: spo = 5'h6;
            028: spo = 5'h6;
            029: spo = 5'h6;
            030: spo = 5'h6;
            031: spo = 5'h6;
            032: spo = 5'h7;
            033: spo = 5'h7;
            034: spo = 5'h7;
            035: spo = 5'h7;
            036: spo = 5'h7;
            037: spo = 5'h6;
            038: spo = 5'h6;
            039: spo = 5'h6;
            040: spo = 5'h6;
            041: spo = 5'h6;
            042: spo = 5'h6;
            043: spo = 5'h5;
            044: spo = 5'h5;
            045: spo = 5'h5;
            046: spo = 5'h5;
            047: spo = 5'h5;
            048: spo = 5'h6;
            049: spo = 5'h6;
            050: spo = 5'h6;
            051: spo = 5'h6;
            052: spo = 5'h6;
            053: spo = 5'h5;
            054: spo = 5'h5;
            055: spo = 5'h5;
            056: spo = 5'h5;
            057: spo = 5'h5;
            058: spo = 5'h5;
            059: spo = 5'h4;
            060: spo = 5'h4;
            061: spo = 5'h4;
            062: spo = 5'h4;
            063: spo = 5'h4;
            064: spo = 5'h5;
            065: spo = 5'h5;
            066: spo = 5'h5;
            067: spo = 5'h5;
            068: spo = 5'h5;
            069: spo = 5'h4;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h4;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h3;
            076: spo = 5'h3;
            077: spo = 5'h3;
            078: spo = 5'h3;
            079: spo = 5'h3;
            080: spo = 5'h4;
            081: spo = 5'h4;
            082: spo = 5'h4;
            083: spo = 5'h4;
            084: spo = 5'h4;
            085: spo = 5'h3;
            086: spo = 5'h3;
            087: spo = 5'h3;
            088: spo = 5'h3;
            089: spo = 5'h3;
            090: spo = 5'h3;
            091: spo = 5'h2;
            092: spo = 5'h2;
            093: spo = 5'h2;
            094: spo = 5'h2;
            095: spo = 5'h2;
            096: spo = 5'h3;
            097: spo = 5'h3;
            098: spo = 5'h3;
            099: spo = 5'h3;
            100: spo = 5'h3;
            101: spo = 5'h2;
            102: spo = 5'h2;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h2;
            107: spo = 5'h1;
            108: spo = 5'h1;
            109: spo = 5'h1;
            110: spo = 5'h1;
            111: spo = 5'h1;
            112: spo = 5'h2;
            113: spo = 5'h2;
            114: spo = 5'h2;
            115: spo = 5'h2;
            116: spo = 5'h2;
            117: spo = 5'h2;
            118: spo = 5'h1;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h1;
            123: spo = 5'h0;
            124: spo = 5'h0;
            125: spo = 5'h0;
            126: spo = 5'h0;
            127: spo = 5'h0;
            128: spo = 5'h1;
            129: spo = 5'h1;
            130: spo = 5'h1;
            131: spo = 5'h1;
            132: spo = 5'h1;
            133: spo = 5'h1;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h1f;
            140: spo = 5'h1f;
            141: spo = 5'h1f;
            142: spo = 5'h1f;
            143: spo = 5'h1f;
            144: spo = 5'h0;
            145: spo = 5'h0;
            146: spo = 5'h0;
            147: spo = 5'h0;
            148: spo = 5'h0;
            149: spo = 5'h0;
            150: spo = 5'h1f;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1f;
            155: spo = 5'h1e;
            156: spo = 5'h1e;
            157: spo = 5'h1e;
            158: spo = 5'h1e;
            159: spo = 5'h1e;
            160: spo = 5'h1f;
            161: spo = 5'h1f;
            162: spo = 5'h1f;
            163: spo = 5'h1f;
            164: spo = 5'h1f;
            165: spo = 5'h1f;
            166: spo = 5'h1e;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1e;
            171: spo = 5'h1e;
            172: spo = 5'h1d;
            173: spo = 5'h1d;
            174: spo = 5'h1d;
            175: spo = 5'h1d;
            176: spo = 5'h1e;
            177: spo = 5'h1e;
            178: spo = 5'h1e;
            179: spo = 5'h1e;
            180: spo = 5'h1e;
            181: spo = 5'h1e;
            182: spo = 5'h1d;
            183: spo = 5'h1d;
            184: spo = 5'h1d;
            185: spo = 5'h1d;
            186: spo = 5'h1d;
            187: spo = 5'h1d;
            188: spo = 5'h1c;
            189: spo = 5'h1c;
            190: spo = 5'h1c;
            191: spo = 5'h1c;
            192: spo = 5'h1d;
            193: spo = 5'h1d;
            194: spo = 5'h1d;
            195: spo = 5'h1d;
            196: spo = 5'h1d;
            197: spo = 5'h1d;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1c;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1c;
            204: spo = 5'h1b;
            205: spo = 5'h1b;
            206: spo = 5'h1b;
            207: spo = 5'h1b;
            208: spo = 5'h1c;
            209: spo = 5'h1c;
            210: spo = 5'h1c;
            211: spo = 5'h1c;
            212: spo = 5'h1c;
            213: spo = 5'h1c;
            214: spo = 5'h1b;
            215: spo = 5'h1b;
            216: spo = 5'h1b;
            217: spo = 5'h1b;
            218: spo = 5'h1b;
            219: spo = 5'h1b;
            220: spo = 5'h1a;
            221: spo = 5'h1a;
            222: spo = 5'h1a;
            223: spo = 5'h1a;
            224: spo = 5'h1b;
            225: spo = 5'h1b;
            226: spo = 5'h1b;
            227: spo = 5'h1b;
            228: spo = 5'h1b;
            229: spo = 5'h1b;
            230: spo = 5'h1a;
            231: spo = 5'h1a;
            232: spo = 5'h1a;
            233: spo = 5'h1a;
            234: spo = 5'h1a;
            235: spo = 5'h1a;
            236: spo = 5'h19;
            237: spo = 5'h19;
            238: spo = 5'h19;
            239: spo = 5'h19;
            240: spo = 5'h1a;
            241: spo = 5'h1a;
            242: spo = 5'h1a;
            243: spo = 5'h1a;
            244: spo = 5'h1a;
            245: spo = 5'h1a;
            246: spo = 5'h19;
            247: spo = 5'h19;
            248: spo = 5'h19;
            249: spo = 5'h19;
            250: spo = 5'h19;
            251: spo = 5'h19;
            252: spo = 5'h18;
            253: spo = 5'h18;
            254: spo = 5'h18;
            255: spo = 5'h18;
            default: spo = 5'h0;
		endcase
	end
endmodule