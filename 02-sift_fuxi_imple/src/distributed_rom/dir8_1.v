`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir8_1 
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

module dir8_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h6;
            001: spo = 5'h6;
            002: spo = 5'h5;
            003: spo = 5'h4;
            004: spo = 5'h3;
            005: spo = 5'h2;
            006: spo = 5'h1;
            007: spo = 5'h0;
            008: spo = 5'h1f;
            009: spo = 5'h1e;
            010: spo = 5'h1d;
            011: spo = 5'h1c;
            012: spo = 5'h1b;
            013: spo = 5'h1a;
            014: spo = 5'h19;
            015: spo = 5'h18;
            016: spo = 5'h7;
            017: spo = 5'h6;
            018: spo = 5'h5;
            019: spo = 5'h4;
            020: spo = 5'h3;
            021: spo = 5'h2;
            022: spo = 5'h1;
            023: spo = 5'h0;
            024: spo = 5'h1f;
            025: spo = 5'h1e;
            026: spo = 5'h1d;
            027: spo = 5'h1c;
            028: spo = 5'h1b;
            029: spo = 5'h1a;
            030: spo = 5'h19;
            031: spo = 5'h18;
            032: spo = 5'h7;
            033: spo = 5'h6;
            034: spo = 5'h5;
            035: spo = 5'h4;
            036: spo = 5'h3;
            037: spo = 5'h2;
            038: spo = 5'h1;
            039: spo = 5'h0;
            040: spo = 5'h1f;
            041: spo = 5'h1e;
            042: spo = 5'h1d;
            043: spo = 5'h1c;
            044: spo = 5'h1b;
            045: spo = 5'h1a;
            046: spo = 5'h19;
            047: spo = 5'h18;
            048: spo = 5'h7;
            049: spo = 5'h6;
            050: spo = 5'h5;
            051: spo = 5'h4;
            052: spo = 5'h3;
            053: spo = 5'h2;
            054: spo = 5'h1;
            055: spo = 5'h0;
            056: spo = 5'h1f;
            057: spo = 5'h1e;
            058: spo = 5'h1d;
            059: spo = 5'h1c;
            060: spo = 5'h1b;
            061: spo = 5'h1a;
            062: spo = 5'h19;
            063: spo = 5'h18;
            064: spo = 5'h7;
            065: spo = 5'h6;
            066: spo = 5'h5;
            067: spo = 5'h4;
            068: spo = 5'h3;
            069: spo = 5'h2;
            070: spo = 5'h1;
            071: spo = 5'h0;
            072: spo = 5'h1f;
            073: spo = 5'h1e;
            074: spo = 5'h1d;
            075: spo = 5'h1c;
            076: spo = 5'h1b;
            077: spo = 5'h1a;
            078: spo = 5'h19;
            079: spo = 5'h18;
            080: spo = 5'h7;
            081: spo = 5'h6;
            082: spo = 5'h5;
            083: spo = 5'h4;
            084: spo = 5'h3;
            085: spo = 5'h2;
            086: spo = 5'h1;
            087: spo = 5'h0;
            088: spo = 5'h1f;
            089: spo = 5'h1e;
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
            183: spo = 5'h2;
            184: spo = 5'h1;
            185: spo = 5'h0;
            186: spo = 5'h1f;
            187: spo = 5'h1e;
            188: spo = 5'h1d;
            189: spo = 5'h1c;
            190: spo = 5'h1b;
            191: spo = 5'h1a;
            192: spo = 5'h9;
            193: spo = 5'h8;
            194: spo = 5'h7;
            195: spo = 5'h6;
            196: spo = 5'h5;
            197: spo = 5'h4;
            198: spo = 5'h3;
            199: spo = 5'h2;
            200: spo = 5'h1;
            201: spo = 5'h0;
            202: spo = 5'h1f;
            203: spo = 5'h1e;
            204: spo = 5'h1d;
            205: spo = 5'h1c;
            206: spo = 5'h1b;
            207: spo = 5'h1a;
            208: spo = 5'h9;
            209: spo = 5'h8;
            210: spo = 5'h7;
            211: spo = 5'h6;
            212: spo = 5'h5;
            213: spo = 5'h4;
            214: spo = 5'h3;
            215: spo = 5'h2;
            216: spo = 5'h1;
            217: spo = 5'h0;
            218: spo = 5'h1f;
            219: spo = 5'h1e;
            220: spo = 5'h1d;
            221: spo = 5'h1c;
            222: spo = 5'h1b;
            223: spo = 5'h1a;
            224: spo = 5'h9;
            225: spo = 5'h8;
            226: spo = 5'h7;
            227: spo = 5'h6;
            228: spo = 5'h5;
            229: spo = 5'h4;
            230: spo = 5'h3;
            231: spo = 5'h2;
            232: spo = 5'h1;
            233: spo = 5'h0;
            234: spo = 5'h1f;
            235: spo = 5'h1e;
            236: spo = 5'h1d;
            237: spo = 5'h1c;
            238: spo = 5'h1b;
            239: spo = 5'h1a;
            240: spo = 5'h9;
            241: spo = 5'h8;
            242: spo = 5'h7;
            243: spo = 5'h6;
            244: spo = 5'h5;
            245: spo = 5'h4;
            246: spo = 5'h3;
            247: spo = 5'h2;
            248: spo = 5'h1;
            249: spo = 5'h0;
            250: spo = 5'h1f;
            251: spo = 5'h1e;
            252: spo = 5'h1d;
            253: spo = 5'h1c;
            254: spo = 5'h1b;
            255: spo = 5'h1a;
            default: spo = 5'h0;
		endcase
	end
endmodule