`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir2_1 
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

module dir2_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1b;
            001: spo = 5'h1b;
            002: spo = 5'h1b;
            003: spo = 5'h1a;
            004: spo = 5'h1a;
            005: spo = 5'h1a;
            006: spo = 5'h19;
            007: spo = 5'h19;
            008: spo = 5'h18;
            009: spo = 5'h18;
            010: spo = 5'h18;
            011: spo = 5'h17;
            012: spo = 5'h17;
            013: spo = 5'h17;
            014: spo = 5'h16;
            015: spo = 5'h16;
            016: spo = 5'h1c;
            017: spo = 5'h1c;
            018: spo = 5'h1b;
            019: spo = 5'h1b;
            020: spo = 5'h1b;
            021: spo = 5'h1a;
            022: spo = 5'h1a;
            023: spo = 5'h1a;
            024: spo = 5'h19;
            025: spo = 5'h19;
            026: spo = 5'h19;
            027: spo = 5'h18;
            028: spo = 5'h18;
            029: spo = 5'h18;
            030: spo = 5'h17;
            031: spo = 5'h17;
            032: spo = 5'h1d;
            033: spo = 5'h1d;
            034: spo = 5'h1c;
            035: spo = 5'h1c;
            036: spo = 5'h1c;
            037: spo = 5'h1b;
            038: spo = 5'h1b;
            039: spo = 5'h1b;
            040: spo = 5'h1a;
            041: spo = 5'h1a;
            042: spo = 5'h1a;
            043: spo = 5'h19;
            044: spo = 5'h19;
            045: spo = 5'h19;
            046: spo = 5'h18;
            047: spo = 5'h18;
            048: spo = 5'h1e;
            049: spo = 5'h1e;
            050: spo = 5'h1d;
            051: spo = 5'h1d;
            052: spo = 5'h1d;
            053: spo = 5'h1c;
            054: spo = 5'h1c;
            055: spo = 5'h1c;
            056: spo = 5'h1b;
            057: spo = 5'h1b;
            058: spo = 5'h1b;
            059: spo = 5'h1a;
            060: spo = 5'h1a;
            061: spo = 5'h1a;
            062: spo = 5'h19;
            063: spo = 5'h19;
            064: spo = 5'h1f;
            065: spo = 5'h1f;
            066: spo = 5'h1e;
            067: spo = 5'h1e;
            068: spo = 5'h1e;
            069: spo = 5'h1d;
            070: spo = 5'h1d;
            071: spo = 5'h1d;
            072: spo = 5'h1c;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1b;
            076: spo = 5'h1b;
            077: spo = 5'h1b;
            078: spo = 5'h1a;
            079: spo = 5'h1a;
            080: spo = 5'h0;
            081: spo = 5'h0;
            082: spo = 5'h1f;
            083: spo = 5'h1f;
            084: spo = 5'h1f;
            085: spo = 5'h1e;
            086: spo = 5'h1e;
            087: spo = 5'h1e;
            088: spo = 5'h1d;
            089: spo = 5'h1d;
            090: spo = 5'h1c;
            091: spo = 5'h1c;
            092: spo = 5'h1c;
            093: spo = 5'h1b;
            094: spo = 5'h1b;
            095: spo = 5'h1b;
            096: spo = 5'h1;
            097: spo = 5'h1;
            098: spo = 5'h0;
            099: spo = 5'h0;
            100: spo = 5'h1f;
            101: spo = 5'h1f;
            102: spo = 5'h1f;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1d;
            107: spo = 5'h1d;
            108: spo = 5'h1d;
            109: spo = 5'h1c;
            110: spo = 5'h1c;
            111: spo = 5'h1c;
            112: spo = 5'h2;
            113: spo = 5'h1;
            114: spo = 5'h1;
            115: spo = 5'h1;
            116: spo = 5'h0;
            117: spo = 5'h0;
            118: spo = 5'h0;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1e;
            124: spo = 5'h1e;
            125: spo = 5'h1d;
            126: spo = 5'h1d;
            127: spo = 5'h1d;
            128: spo = 5'h3;
            129: spo = 5'h2;
            130: spo = 5'h2;
            131: spo = 5'h2;
            132: spo = 5'h1;
            133: spo = 5'h1;
            134: spo = 5'h1;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h1f;
            139: spo = 5'h1f;
            140: spo = 5'h1f;
            141: spo = 5'h1e;
            142: spo = 5'h1e;
            143: spo = 5'h1e;
            144: spo = 5'h4;
            145: spo = 5'h3;
            146: spo = 5'h3;
            147: spo = 5'h3;
            148: spo = 5'h2;
            149: spo = 5'h2;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h0;
            155: spo = 5'h0;
            156: spo = 5'h0;
            157: spo = 5'h1f;
            158: spo = 5'h1f;
            159: spo = 5'h1f;
            160: spo = 5'h5;
            161: spo = 5'h4;
            162: spo = 5'h4;
            163: spo = 5'h4;
            164: spo = 5'h3;
            165: spo = 5'h3;
            166: spo = 5'h3;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h1;
            171: spo = 5'h1;
            172: spo = 5'h1;
            173: spo = 5'h0;
            174: spo = 5'h0;
            175: spo = 5'h1f;
            176: spo = 5'h6;
            177: spo = 5'h5;
            178: spo = 5'h5;
            179: spo = 5'h5;
            180: spo = 5'h4;
            181: spo = 5'h4;
            182: spo = 5'h4;
            183: spo = 5'h3;
            184: spo = 5'h3;
            185: spo = 5'h2;
            186: spo = 5'h2;
            187: spo = 5'h2;
            188: spo = 5'h1;
            189: spo = 5'h1;
            190: spo = 5'h1;
            191: spo = 5'h0;
            192: spo = 5'h6;
            193: spo = 5'h6;
            194: spo = 5'h6;
            195: spo = 5'h5;
            196: spo = 5'h5;
            197: spo = 5'h5;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h4;
            201: spo = 5'h3;
            202: spo = 5'h3;
            203: spo = 5'h3;
            204: spo = 5'h2;
            205: spo = 5'h2;
            206: spo = 5'h2;
            207: spo = 5'h1;
            208: spo = 5'h7;
            209: spo = 5'h7;
            210: spo = 5'h7;
            211: spo = 5'h6;
            212: spo = 5'h6;
            213: spo = 5'h6;
            214: spo = 5'h5;
            215: spo = 5'h5;
            216: spo = 5'h5;
            217: spo = 5'h4;
            218: spo = 5'h4;
            219: spo = 5'h4;
            220: spo = 5'h3;
            221: spo = 5'h3;
            222: spo = 5'h3;
            223: spo = 5'h2;
            224: spo = 5'h8;
            225: spo = 5'h8;
            226: spo = 5'h8;
            227: spo = 5'h7;
            228: spo = 5'h7;
            229: spo = 5'h7;
            230: spo = 5'h6;
            231: spo = 5'h6;
            232: spo = 5'h6;
            233: spo = 5'h5;
            234: spo = 5'h5;
            235: spo = 5'h5;
            236: spo = 5'h4;
            237: spo = 5'h4;
            238: spo = 5'h4;
            239: spo = 5'h3;
            240: spo = 5'h9;
            241: spo = 5'h9;
            242: spo = 5'h9;
            243: spo = 5'h8;
            244: spo = 5'h8;
            245: spo = 5'h8;
            246: spo = 5'h7;
            247: spo = 5'h7;
            248: spo = 5'h7;
            249: spo = 5'h6;
            250: spo = 5'h6;
            251: spo = 5'h6;
            252: spo = 5'h5;
            253: spo = 5'h5;
            254: spo = 5'h5;
            255: spo = 5'h4;
            default: spo = 5'h0;
		endcase
	end
endmodule