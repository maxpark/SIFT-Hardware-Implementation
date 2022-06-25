`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir12_1 
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

module dir12_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'hb;
            001: spo = 5'ha;
            002: spo = 5'h9;
            003: spo = 5'h8;
            004: spo = 5'h7;
            005: spo = 5'h7;
            006: spo = 5'h6;
            007: spo = 5'h5;
            008: spo = 5'h4;
            009: spo = 5'h3;
            010: spo = 5'h2;
            011: spo = 5'h1;
            012: spo = 5'h1;
            013: spo = 5'h0;
            014: spo = 5'h1f;
            015: spo = 5'h1e;
            016: spo = 5'ha;
            017: spo = 5'ha;
            018: spo = 5'h9;
            019: spo = 5'h8;
            020: spo = 5'h7;
            021: spo = 5'h6;
            022: spo = 5'h5;
            023: spo = 5'h4;
            024: spo = 5'h3;
            025: spo = 5'h3;
            026: spo = 5'h2;
            027: spo = 5'h1;
            028: spo = 5'h0;
            029: spo = 5'h1f;
            030: spo = 5'h1e;
            031: spo = 5'h1d;
            032: spo = 5'ha;
            033: spo = 5'h9;
            034: spo = 5'h8;
            035: spo = 5'h7;
            036: spo = 5'h6;
            037: spo = 5'h6;
            038: spo = 5'h5;
            039: spo = 5'h4;
            040: spo = 5'h3;
            041: spo = 5'h2;
            042: spo = 5'h1;
            043: spo = 5'h0;
            044: spo = 5'h0;
            045: spo = 5'h1f;
            046: spo = 5'h1e;
            047: spo = 5'h1d;
            048: spo = 5'h9;
            049: spo = 5'h9;
            050: spo = 5'h8;
            051: spo = 5'h7;
            052: spo = 5'h6;
            053: spo = 5'h5;
            054: spo = 5'h4;
            055: spo = 5'h3;
            056: spo = 5'h2;
            057: spo = 5'h2;
            058: spo = 5'h1;
            059: spo = 5'h0;
            060: spo = 5'h1f;
            061: spo = 5'h1e;
            062: spo = 5'h1d;
            063: spo = 5'h1c;
            064: spo = 5'h9;
            065: spo = 5'h8;
            066: spo = 5'h7;
            067: spo = 5'h6;
            068: spo = 5'h5;
            069: spo = 5'h5;
            070: spo = 5'h4;
            071: spo = 5'h3;
            072: spo = 5'h2;
            073: spo = 5'h1;
            074: spo = 5'h0;
            075: spo = 5'h1f;
            076: spo = 5'h1f;
            077: spo = 5'h1e;
            078: spo = 5'h1d;
            079: spo = 5'h1c;
            080: spo = 5'h8;
            081: spo = 5'h8;
            082: spo = 5'h7;
            083: spo = 5'h6;
            084: spo = 5'h5;
            085: spo = 5'h4;
            086: spo = 5'h3;
            087: spo = 5'h2;
            088: spo = 5'h1;
            089: spo = 5'h1;
            090: spo = 5'h0;
            091: spo = 5'h1f;
            092: spo = 5'h1e;
            093: spo = 5'h1d;
            094: spo = 5'h1c;
            095: spo = 5'h1b;
            096: spo = 5'h8;
            097: spo = 5'h7;
            098: spo = 5'h6;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h4;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h1;
            105: spo = 5'h0;
            106: spo = 5'h1f;
            107: spo = 5'h1e;
            108: spo = 5'h1e;
            109: spo = 5'h1d;
            110: spo = 5'h1c;
            111: spo = 5'h1b;
            112: spo = 5'h7;
            113: spo = 5'h7;
            114: spo = 5'h6;
            115: spo = 5'h5;
            116: spo = 5'h4;
            117: spo = 5'h3;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h0;
            121: spo = 5'h0;
            122: spo = 5'h1f;
            123: spo = 5'h1e;
            124: spo = 5'h1d;
            125: spo = 5'h1c;
            126: spo = 5'h1b;
            127: spo = 5'h1a;
            128: spo = 5'h7;
            129: spo = 5'h6;
            130: spo = 5'h5;
            131: spo = 5'h4;
            132: spo = 5'h3;
            133: spo = 5'h3;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1d;
            140: spo = 5'h1d;
            141: spo = 5'h1c;
            142: spo = 5'h1b;
            143: spo = 5'h1a;
            144: spo = 5'h6;
            145: spo = 5'h6;
            146: spo = 5'h5;
            147: spo = 5'h4;
            148: spo = 5'h3;
            149: spo = 5'h2;
            150: spo = 5'h1;
            151: spo = 5'h0;
            152: spo = 5'h0;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1d;
            156: spo = 5'h1c;
            157: spo = 5'h1b;
            158: spo = 5'h1a;
            159: spo = 5'h19;
            160: spo = 5'h6;
            161: spo = 5'h5;
            162: spo = 5'h4;
            163: spo = 5'h3;
            164: spo = 5'h2;
            165: spo = 5'h2;
            166: spo = 5'h1;
            167: spo = 5'h0;
            168: spo = 5'h1f;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1c;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1a;
            175: spo = 5'h19;
            176: spo = 5'h5;
            177: spo = 5'h5;
            178: spo = 5'h4;
            179: spo = 5'h3;
            180: spo = 5'h2;
            181: spo = 5'h1;
            182: spo = 5'h0;
            183: spo = 5'h1f;
            184: spo = 5'h1f;
            185: spo = 5'h1e;
            186: spo = 5'h1d;
            187: spo = 5'h1c;
            188: spo = 5'h1b;
            189: spo = 5'h1a;
            190: spo = 5'h19;
            191: spo = 5'h18;
            192: spo = 5'h5;
            193: spo = 5'h4;
            194: spo = 5'h3;
            195: spo = 5'h2;
            196: spo = 5'h1;
            197: spo = 5'h1;
            198: spo = 5'h0;
            199: spo = 5'h1f;
            200: spo = 5'h1e;
            201: spo = 5'h1d;
            202: spo = 5'h1c;
            203: spo = 5'h1b;
            204: spo = 5'h1b;
            205: spo = 5'h1a;
            206: spo = 5'h19;
            207: spo = 5'h18;
            208: spo = 5'h4;
            209: spo = 5'h4;
            210: spo = 5'h3;
            211: spo = 5'h2;
            212: spo = 5'h1;
            213: spo = 5'h0;
            214: spo = 5'h1f;
            215: spo = 5'h1e;
            216: spo = 5'h1e;
            217: spo = 5'h1d;
            218: spo = 5'h1c;
            219: spo = 5'h1b;
            220: spo = 5'h1a;
            221: spo = 5'h19;
            222: spo = 5'h18;
            223: spo = 5'h17;
            224: spo = 5'h4;
            225: spo = 5'h3;
            226: spo = 5'h2;
            227: spo = 5'h1;
            228: spo = 5'h0;
            229: spo = 5'h0;
            230: spo = 5'h1f;
            231: spo = 5'h1e;
            232: spo = 5'h1d;
            233: spo = 5'h1c;
            234: spo = 5'h1b;
            235: spo = 5'h1a;
            236: spo = 5'h1a;
            237: spo = 5'h19;
            238: spo = 5'h18;
            239: spo = 5'h17;
            240: spo = 5'h3;
            241: spo = 5'h3;
            242: spo = 5'h2;
            243: spo = 5'h1;
            244: spo = 5'h0;
            245: spo = 5'h1f;
            246: spo = 5'h1e;
            247: spo = 5'h1d;
            248: spo = 5'h1d;
            249: spo = 5'h1c;
            250: spo = 5'h1b;
            251: spo = 5'h1a;
            252: spo = 5'h19;
            253: spo = 5'h18;
            254: spo = 5'h17;
            255: spo = 5'h16;
            default: spo = 5'h0;
		endcase
	end
endmodule