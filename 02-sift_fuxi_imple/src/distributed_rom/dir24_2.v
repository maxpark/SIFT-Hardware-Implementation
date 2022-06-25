`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir24_2 
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

module dir24_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'hb;
            001: spo = 5'ha;
            002: spo = 5'ha;
            003: spo = 5'h9;
            004: spo = 5'h9;
            005: spo = 5'h8;
            006: spo = 5'h8;
            007: spo = 5'h7;
            008: spo = 5'h7;
            009: spo = 5'h6;
            010: spo = 5'h6;
            011: spo = 5'h5;
            012: spo = 5'h5;
            013: spo = 5'h4;
            014: spo = 5'h4;
            015: spo = 5'h3;
            016: spo = 5'ha;
            017: spo = 5'ha;
            018: spo = 5'h9;
            019: spo = 5'h9;
            020: spo = 5'h8;
            021: spo = 5'h8;
            022: spo = 5'h7;
            023: spo = 5'h7;
            024: spo = 5'h6;
            025: spo = 5'h6;
            026: spo = 5'h5;
            027: spo = 5'h5;
            028: spo = 5'h4;
            029: spo = 5'h4;
            030: spo = 5'h3;
            031: spo = 5'h3;
            032: spo = 5'h9;
            033: spo = 5'h9;
            034: spo = 5'h8;
            035: spo = 5'h8;
            036: spo = 5'h7;
            037: spo = 5'h7;
            038: spo = 5'h6;
            039: spo = 5'h6;
            040: spo = 5'h5;
            041: spo = 5'h5;
            042: spo = 5'h4;
            043: spo = 5'h4;
            044: spo = 5'h3;
            045: spo = 5'h3;
            046: spo = 5'h2;
            047: spo = 5'h2;
            048: spo = 5'h8;
            049: spo = 5'h8;
            050: spo = 5'h7;
            051: spo = 5'h7;
            052: spo = 5'h6;
            053: spo = 5'h6;
            054: spo = 5'h5;
            055: spo = 5'h5;
            056: spo = 5'h4;
            057: spo = 5'h4;
            058: spo = 5'h3;
            059: spo = 5'h3;
            060: spo = 5'h2;
            061: spo = 5'h2;
            062: spo = 5'h1;
            063: spo = 5'h1;
            064: spo = 5'h7;
            065: spo = 5'h7;
            066: spo = 5'h6;
            067: spo = 5'h6;
            068: spo = 5'h5;
            069: spo = 5'h5;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h3;
            073: spo = 5'h3;
            074: spo = 5'h2;
            075: spo = 5'h2;
            076: spo = 5'h1;
            077: spo = 5'h1;
            078: spo = 5'h0;
            079: spo = 5'h0;
            080: spo = 5'h7;
            081: spo = 5'h6;
            082: spo = 5'h6;
            083: spo = 5'h5;
            084: spo = 5'h5;
            085: spo = 5'h4;
            086: spo = 5'h4;
            087: spo = 5'h3;
            088: spo = 5'h3;
            089: spo = 5'h2;
            090: spo = 5'h2;
            091: spo = 5'h1;
            092: spo = 5'h1;
            093: spo = 5'h0;
            094: spo = 5'h0;
            095: spo = 5'h1f;
            096: spo = 5'h6;
            097: spo = 5'h5;
            098: spo = 5'h5;
            099: spo = 5'h4;
            100: spo = 5'h4;
            101: spo = 5'h3;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h1;
            106: spo = 5'h1;
            107: spo = 5'h0;
            108: spo = 5'h0;
            109: spo = 5'h1f;
            110: spo = 5'h1f;
            111: spo = 5'h1e;
            112: spo = 5'h5;
            113: spo = 5'h4;
            114: spo = 5'h4;
            115: spo = 5'h3;
            116: spo = 5'h3;
            117: spo = 5'h2;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h0;
            122: spo = 5'h0;
            123: spo = 5'h1f;
            124: spo = 5'h1f;
            125: spo = 5'h1e;
            126: spo = 5'h1e;
            127: spo = 5'h1d;
            128: spo = 5'h4;
            129: spo = 5'h4;
            130: spo = 5'h3;
            131: spo = 5'h3;
            132: spo = 5'h2;
            133: spo = 5'h2;
            134: spo = 5'h1;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1f;
            139: spo = 5'h1e;
            140: spo = 5'h1e;
            141: spo = 5'h1d;
            142: spo = 5'h1d;
            143: spo = 5'h1c;
            144: spo = 5'h3;
            145: spo = 5'h3;
            146: spo = 5'h2;
            147: spo = 5'h2;
            148: spo = 5'h1;
            149: spo = 5'h1;
            150: spo = 5'h0;
            151: spo = 5'h0;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1e;
            156: spo = 5'h1d;
            157: spo = 5'h1d;
            158: spo = 5'h1c;
            159: spo = 5'h1c;
            160: spo = 5'h2;
            161: spo = 5'h2;
            162: spo = 5'h1;
            163: spo = 5'h1;
            164: spo = 5'h0;
            165: spo = 5'h0;
            166: spo = 5'h1f;
            167: spo = 5'h1f;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1d;
            172: spo = 5'h1c;
            173: spo = 5'h1c;
            174: spo = 5'h1b;
            175: spo = 5'h1b;
            176: spo = 5'h1;
            177: spo = 5'h1;
            178: spo = 5'h0;
            179: spo = 5'h0;
            180: spo = 5'h1f;
            181: spo = 5'h1f;
            182: spo = 5'h1e;
            183: spo = 5'h1e;
            184: spo = 5'h1d;
            185: spo = 5'h1d;
            186: spo = 5'h1c;
            187: spo = 5'h1c;
            188: spo = 5'h1b;
            189: spo = 5'h1b;
            190: spo = 5'h1a;
            191: spo = 5'h1a;
            192: spo = 5'h1;
            193: spo = 5'h0;
            194: spo = 5'h0;
            195: spo = 5'h1f;
            196: spo = 5'h1f;
            197: spo = 5'h1e;
            198: spo = 5'h1e;
            199: spo = 5'h1d;
            200: spo = 5'h1d;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1b;
            204: spo = 5'h1b;
            205: spo = 5'h1a;
            206: spo = 5'h1a;
            207: spo = 5'h19;
            208: spo = 5'h0;
            209: spo = 5'h1f;
            210: spo = 5'h1f;
            211: spo = 5'h1e;
            212: spo = 5'h1e;
            213: spo = 5'h1d;
            214: spo = 5'h1d;
            215: spo = 5'h1c;
            216: spo = 5'h1c;
            217: spo = 5'h1b;
            218: spo = 5'h1b;
            219: spo = 5'h1a;
            220: spo = 5'h1a;
            221: spo = 5'h19;
            222: spo = 5'h19;
            223: spo = 5'h18;
            224: spo = 5'h1f;
            225: spo = 5'h1e;
            226: spo = 5'h1e;
            227: spo = 5'h1d;
            228: spo = 5'h1d;
            229: spo = 5'h1c;
            230: spo = 5'h1c;
            231: spo = 5'h1b;
            232: spo = 5'h1b;
            233: spo = 5'h1a;
            234: spo = 5'h1a;
            235: spo = 5'h19;
            236: spo = 5'h19;
            237: spo = 5'h18;
            238: spo = 5'h18;
            239: spo = 5'h17;
            240: spo = 5'h1e;
            241: spo = 5'h1d;
            242: spo = 5'h1d;
            243: spo = 5'h1c;
            244: spo = 5'h1c;
            245: spo = 5'h1b;
            246: spo = 5'h1b;
            247: spo = 5'h1a;
            248: spo = 5'h1a;
            249: spo = 5'h19;
            250: spo = 5'h19;
            251: spo = 5'h18;
            252: spo = 5'h18;
            253: spo = 5'h17;
            254: spo = 5'h17;
            255: spo = 5'h16;
            default: spo = 5'h0;
		endcase
	end
endmodule