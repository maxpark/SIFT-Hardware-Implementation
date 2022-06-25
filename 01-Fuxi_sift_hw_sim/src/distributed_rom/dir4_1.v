`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir4_1 
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

module dir4_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1f;
            001: spo = 5'h1e;
            002: spo = 5'h1e;
            003: spo = 5'h1d;
            004: spo = 5'h1c;
            005: spo = 5'h1c;
            006: spo = 5'h1b;
            007: spo = 5'h1b;
            008: spo = 5'h1a;
            009: spo = 5'h19;
            010: spo = 5'h19;
            011: spo = 5'h18;
            012: spo = 5'h17;
            013: spo = 5'h17;
            014: spo = 5'h16;
            015: spo = 5'h15;
            016: spo = 5'h0;
            017: spo = 5'h1f;
            018: spo = 5'h1e;
            019: spo = 5'h1e;
            020: spo = 5'h1d;
            021: spo = 5'h1d;
            022: spo = 5'h1c;
            023: spo = 5'h1b;
            024: spo = 5'h1b;
            025: spo = 5'h1a;
            026: spo = 5'h19;
            027: spo = 5'h19;
            028: spo = 5'h18;
            029: spo = 5'h17;
            030: spo = 5'h17;
            031: spo = 5'h16;
            032: spo = 5'h1;
            033: spo = 5'h0;
            034: spo = 5'h1f;
            035: spo = 5'h1f;
            036: spo = 5'h1e;
            037: spo = 5'h1d;
            038: spo = 5'h1d;
            039: spo = 5'h1c;
            040: spo = 5'h1b;
            041: spo = 5'h1b;
            042: spo = 5'h1a;
            043: spo = 5'h19;
            044: spo = 5'h19;
            045: spo = 5'h18;
            046: spo = 5'h18;
            047: spo = 5'h17;
            048: spo = 5'h1;
            049: spo = 5'h1;
            050: spo = 5'h0;
            051: spo = 5'h1f;
            052: spo = 5'h1f;
            053: spo = 5'h1e;
            054: spo = 5'h1d;
            055: spo = 5'h1d;
            056: spo = 5'h1c;
            057: spo = 5'h1c;
            058: spo = 5'h1b;
            059: spo = 5'h1a;
            060: spo = 5'h1a;
            061: spo = 5'h19;
            062: spo = 5'h18;
            063: spo = 5'h18;
            064: spo = 5'h2;
            065: spo = 5'h1;
            066: spo = 5'h1;
            067: spo = 5'h0;
            068: spo = 5'h0;
            069: spo = 5'h1f;
            070: spo = 5'h1e;
            071: spo = 5'h1e;
            072: spo = 5'h1d;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1b;
            076: spo = 5'h1a;
            077: spo = 5'h1a;
            078: spo = 5'h19;
            079: spo = 5'h18;
            080: spo = 5'h3;
            081: spo = 5'h2;
            082: spo = 5'h2;
            083: spo = 5'h1;
            084: spo = 5'h0;
            085: spo = 5'h0;
            086: spo = 5'h1f;
            087: spo = 5'h1e;
            088: spo = 5'h1e;
            089: spo = 5'h1d;
            090: spo = 5'h1c;
            091: spo = 5'h1c;
            092: spo = 5'h1b;
            093: spo = 5'h1a;
            094: spo = 5'h1a;
            095: spo = 5'h19;
            096: spo = 5'h4;
            097: spo = 5'h3;
            098: spo = 5'h2;
            099: spo = 5'h2;
            100: spo = 5'h1;
            101: spo = 5'h0;
            102: spo = 5'h0;
            103: spo = 5'h1f;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1d;
            107: spo = 5'h1d;
            108: spo = 5'h1c;
            109: spo = 5'h1b;
            110: spo = 5'h1b;
            111: spo = 5'h1a;
            112: spo = 5'h4;
            113: spo = 5'h4;
            114: spo = 5'h3;
            115: spo = 5'h2;
            116: spo = 5'h2;
            117: spo = 5'h1;
            118: spo = 5'h1;
            119: spo = 5'h0;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1d;
            124: spo = 5'h1d;
            125: spo = 5'h1c;
            126: spo = 5'h1b;
            127: spo = 5'h1b;
            128: spo = 5'h5;
            129: spo = 5'h4;
            130: spo = 5'h4;
            131: spo = 5'h3;
            132: spo = 5'h3;
            133: spo = 5'h2;
            134: spo = 5'h1;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1f;
            139: spo = 5'h1e;
            140: spo = 5'h1d;
            141: spo = 5'h1d;
            142: spo = 5'h1c;
            143: spo = 5'h1c;
            144: spo = 5'h6;
            145: spo = 5'h5;
            146: spo = 5'h5;
            147: spo = 5'h4;
            148: spo = 5'h3;
            149: spo = 5'h3;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h0;
            154: spo = 5'h1f;
            155: spo = 5'h1f;
            156: spo = 5'h1e;
            157: spo = 5'h1e;
            158: spo = 5'h1d;
            159: spo = 5'h1c;
            160: spo = 5'h7;
            161: spo = 5'h6;
            162: spo = 5'h5;
            163: spo = 5'h5;
            164: spo = 5'h4;
            165: spo = 5'h3;
            166: spo = 5'h3;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h1;
            170: spo = 5'h0;
            171: spo = 5'h0;
            172: spo = 5'h1f;
            173: spo = 5'h1e;
            174: spo = 5'h1e;
            175: spo = 5'h1d;
            176: spo = 5'h7;
            177: spo = 5'h7;
            178: spo = 5'h6;
            179: spo = 5'h6;
            180: spo = 5'h5;
            181: spo = 5'h4;
            182: spo = 5'h4;
            183: spo = 5'h3;
            184: spo = 5'h2;
            185: spo = 5'h2;
            186: spo = 5'h1;
            187: spo = 5'h0;
            188: spo = 5'h0;
            189: spo = 5'h1f;
            190: spo = 5'h1e;
            191: spo = 5'h1e;
            192: spo = 5'h8;
            193: spo = 5'h8;
            194: spo = 5'h7;
            195: spo = 5'h6;
            196: spo = 5'h6;
            197: spo = 5'h5;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h3;
            201: spo = 5'h2;
            202: spo = 5'h2;
            203: spo = 5'h1;
            204: spo = 5'h0;
            205: spo = 5'h0;
            206: spo = 5'h1f;
            207: spo = 5'h1f;
            208: spo = 5'h9;
            209: spo = 5'h8;
            210: spo = 5'h8;
            211: spo = 5'h7;
            212: spo = 5'h6;
            213: spo = 5'h6;
            214: spo = 5'h5;
            215: spo = 5'h4;
            216: spo = 5'h4;
            217: spo = 5'h3;
            218: spo = 5'h3;
            219: spo = 5'h2;
            220: spo = 5'h1;
            221: spo = 5'h1;
            222: spo = 5'h0;
            223: spo = 5'h1f;
            224: spo = 5'ha;
            225: spo = 5'h9;
            226: spo = 5'h8;
            227: spo = 5'h8;
            228: spo = 5'h7;
            229: spo = 5'h7;
            230: spo = 5'h6;
            231: spo = 5'h5;
            232: spo = 5'h5;
            233: spo = 5'h4;
            234: spo = 5'h3;
            235: spo = 5'h3;
            236: spo = 5'h2;
            237: spo = 5'h1;
            238: spo = 5'h1;
            239: spo = 5'h0;
            240: spo = 5'hb;
            241: spo = 5'ha;
            242: spo = 5'h9;
            243: spo = 5'h9;
            244: spo = 5'h8;
            245: spo = 5'h7;
            246: spo = 5'h7;
            247: spo = 5'h6;
            248: spo = 5'h5;
            249: spo = 5'h5;
            250: spo = 5'h4;
            251: spo = 5'h3;
            252: spo = 5'h3;
            253: spo = 5'h2;
            254: spo = 5'h2;
            255: spo = 5'h1;
            default: spo = 5'h0;
		endcase
	end
endmodule