`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir29_1 
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

module dir29_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h16;
            001: spo = 5'h17;
            002: spo = 5'h18;
            003: spo = 5'h19;
            004: spo = 5'h1a;
            005: spo = 5'h1a;
            006: spo = 5'h1b;
            007: spo = 5'h1c;
            008: spo = 5'h1d;
            009: spo = 5'h1e;
            010: spo = 5'h1f;
            011: spo = 5'h0;
            012: spo = 5'h1;
            013: spo = 5'h2;
            014: spo = 5'h3;
            015: spo = 5'h4;
            016: spo = 5'h16;
            017: spo = 5'h17;
            018: spo = 5'h18;
            019: spo = 5'h19;
            020: spo = 5'h1a;
            021: spo = 5'h1b;
            022: spo = 5'h1c;
            023: spo = 5'h1d;
            024: spo = 5'h1e;
            025: spo = 5'h1f;
            026: spo = 5'h1f;
            027: spo = 5'h0;
            028: spo = 5'h1;
            029: spo = 5'h2;
            030: spo = 5'h3;
            031: spo = 5'h4;
            032: spo = 5'h16;
            033: spo = 5'h17;
            034: spo = 5'h18;
            035: spo = 5'h19;
            036: spo = 5'h1a;
            037: spo = 5'h1b;
            038: spo = 5'h1c;
            039: spo = 5'h1d;
            040: spo = 5'h1e;
            041: spo = 5'h1f;
            042: spo = 5'h0;
            043: spo = 5'h1;
            044: spo = 5'h2;
            045: spo = 5'h3;
            046: spo = 5'h4;
            047: spo = 5'h5;
            048: spo = 5'h17;
            049: spo = 5'h18;
            050: spo = 5'h19;
            051: spo = 5'h1a;
            052: spo = 5'h1b;
            053: spo = 5'h1b;
            054: spo = 5'h1c;
            055: spo = 5'h1d;
            056: spo = 5'h1e;
            057: spo = 5'h1f;
            058: spo = 5'h0;
            059: spo = 5'h1;
            060: spo = 5'h2;
            061: spo = 5'h3;
            062: spo = 5'h4;
            063: spo = 5'h5;
            064: spo = 5'h17;
            065: spo = 5'h18;
            066: spo = 5'h19;
            067: spo = 5'h1a;
            068: spo = 5'h1b;
            069: spo = 5'h1c;
            070: spo = 5'h1d;
            071: spo = 5'h1e;
            072: spo = 5'h1f;
            073: spo = 5'h0;
            074: spo = 5'h1;
            075: spo = 5'h1;
            076: spo = 5'h2;
            077: spo = 5'h3;
            078: spo = 5'h4;
            079: spo = 5'h5;
            080: spo = 5'h17;
            081: spo = 5'h18;
            082: spo = 5'h19;
            083: spo = 5'h1a;
            084: spo = 5'h1b;
            085: spo = 5'h1c;
            086: spo = 5'h1d;
            087: spo = 5'h1e;
            088: spo = 5'h1f;
            089: spo = 5'h0;
            090: spo = 5'h1;
            091: spo = 5'h2;
            092: spo = 5'h3;
            093: spo = 5'h4;
            094: spo = 5'h5;
            095: spo = 5'h6;
            096: spo = 5'h18;
            097: spo = 5'h19;
            098: spo = 5'h1a;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1c;
            102: spo = 5'h1d;
            103: spo = 5'h1e;
            104: spo = 5'h1f;
            105: spo = 5'h0;
            106: spo = 5'h1;
            107: spo = 5'h2;
            108: spo = 5'h3;
            109: spo = 5'h4;
            110: spo = 5'h5;
            111: spo = 5'h6;
            112: spo = 5'h18;
            113: spo = 5'h19;
            114: spo = 5'h1a;
            115: spo = 5'h1b;
            116: spo = 5'h1c;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h0;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h2;
            124: spo = 5'h3;
            125: spo = 5'h4;
            126: spo = 5'h5;
            127: spo = 5'h6;
            128: spo = 5'h18;
            129: spo = 5'h19;
            130: spo = 5'h1a;
            131: spo = 5'h1b;
            132: spo = 5'h1c;
            133: spo = 5'h1d;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h3;
            140: spo = 5'h4;
            141: spo = 5'h5;
            142: spo = 5'h6;
            143: spo = 5'h7;
            144: spo = 5'h19;
            145: spo = 5'h1a;
            146: spo = 5'h1b;
            147: spo = 5'h1c;
            148: spo = 5'h1d;
            149: spo = 5'h1e;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h0;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h4;
            157: spo = 5'h5;
            158: spo = 5'h6;
            159: spo = 5'h7;
            160: spo = 5'h19;
            161: spo = 5'h1a;
            162: spo = 5'h1b;
            163: spo = 5'h1c;
            164: spo = 5'h1d;
            165: spo = 5'h1e;
            166: spo = 5'h1f;
            167: spo = 5'h0;
            168: spo = 5'h1;
            169: spo = 5'h2;
            170: spo = 5'h3;
            171: spo = 5'h4;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h6;
            175: spo = 5'h7;
            176: spo = 5'h1a;
            177: spo = 5'h1a;
            178: spo = 5'h1b;
            179: spo = 5'h1c;
            180: spo = 5'h1d;
            181: spo = 5'h1e;
            182: spo = 5'h1f;
            183: spo = 5'h0;
            184: spo = 5'h1;
            185: spo = 5'h2;
            186: spo = 5'h3;
            187: spo = 5'h4;
            188: spo = 5'h5;
            189: spo = 5'h6;
            190: spo = 5'h7;
            191: spo = 5'h8;
            192: spo = 5'h1a;
            193: spo = 5'h1b;
            194: spo = 5'h1c;
            195: spo = 5'h1d;
            196: spo = 5'h1e;
            197: spo = 5'h1f;
            198: spo = 5'h1f;
            199: spo = 5'h0;
            200: spo = 5'h1;
            201: spo = 5'h2;
            202: spo = 5'h3;
            203: spo = 5'h4;
            204: spo = 5'h5;
            205: spo = 5'h6;
            206: spo = 5'h7;
            207: spo = 5'h8;
            208: spo = 5'h1a;
            209: spo = 5'h1b;
            210: spo = 5'h1c;
            211: spo = 5'h1d;
            212: spo = 5'h1e;
            213: spo = 5'h1f;
            214: spo = 5'h0;
            215: spo = 5'h1;
            216: spo = 5'h2;
            217: spo = 5'h3;
            218: spo = 5'h4;
            219: spo = 5'h5;
            220: spo = 5'h5;
            221: spo = 5'h6;
            222: spo = 5'h7;
            223: spo = 5'h8;
            224: spo = 5'h1b;
            225: spo = 5'h1b;
            226: spo = 5'h1c;
            227: spo = 5'h1d;
            228: spo = 5'h1e;
            229: spo = 5'h1f;
            230: spo = 5'h0;
            231: spo = 5'h1;
            232: spo = 5'h2;
            233: spo = 5'h3;
            234: spo = 5'h4;
            235: spo = 5'h5;
            236: spo = 5'h6;
            237: spo = 5'h7;
            238: spo = 5'h8;
            239: spo = 5'h9;
            240: spo = 5'h1b;
            241: spo = 5'h1c;
            242: spo = 5'h1d;
            243: spo = 5'h1e;
            244: spo = 5'h1f;
            245: spo = 5'h0;
            246: spo = 5'h1;
            247: spo = 5'h1;
            248: spo = 5'h2;
            249: spo = 5'h3;
            250: spo = 5'h4;
            251: spo = 5'h5;
            252: spo = 5'h6;
            253: spo = 5'h7;
            254: spo = 5'h8;
            255: spo = 5'h9;
            default: spo = 5'h0;
		endcase
	end
endmodule