`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir24_1 
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

module dir24_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1d;
            001: spo = 5'h1e;
            002: spo = 5'h1f;
            003: spo = 5'h0;
            004: spo = 5'h1;
            005: spo = 5'h1;
            006: spo = 5'h2;
            007: spo = 5'h3;
            008: spo = 5'h4;
            009: spo = 5'h5;
            010: spo = 5'h6;
            011: spo = 5'h7;
            012: spo = 5'h7;
            013: spo = 5'h8;
            014: spo = 5'h9;
            015: spo = 5'ha;
            016: spo = 5'h1d;
            017: spo = 5'h1d;
            018: spo = 5'h1e;
            019: spo = 5'h1f;
            020: spo = 5'h0;
            021: spo = 5'h1;
            022: spo = 5'h2;
            023: spo = 5'h3;
            024: spo = 5'h4;
            025: spo = 5'h4;
            026: spo = 5'h5;
            027: spo = 5'h6;
            028: spo = 5'h7;
            029: spo = 5'h8;
            030: spo = 5'h9;
            031: spo = 5'ha;
            032: spo = 5'h1c;
            033: spo = 5'h1d;
            034: spo = 5'h1e;
            035: spo = 5'h1f;
            036: spo = 5'h0;
            037: spo = 5'h0;
            038: spo = 5'h1;
            039: spo = 5'h2;
            040: spo = 5'h3;
            041: spo = 5'h4;
            042: spo = 5'h5;
            043: spo = 5'h6;
            044: spo = 5'h6;
            045: spo = 5'h7;
            046: spo = 5'h8;
            047: spo = 5'h9;
            048: spo = 5'h1c;
            049: spo = 5'h1c;
            050: spo = 5'h1d;
            051: spo = 5'h1e;
            052: spo = 5'h1f;
            053: spo = 5'h0;
            054: spo = 5'h1;
            055: spo = 5'h2;
            056: spo = 5'h3;
            057: spo = 5'h3;
            058: spo = 5'h4;
            059: spo = 5'h5;
            060: spo = 5'h6;
            061: spo = 5'h7;
            062: spo = 5'h8;
            063: spo = 5'h9;
            064: spo = 5'h1b;
            065: spo = 5'h1c;
            066: spo = 5'h1d;
            067: spo = 5'h1e;
            068: spo = 5'h1f;
            069: spo = 5'h1f;
            070: spo = 5'h0;
            071: spo = 5'h1;
            072: spo = 5'h2;
            073: spo = 5'h3;
            074: spo = 5'h4;
            075: spo = 5'h5;
            076: spo = 5'h5;
            077: spo = 5'h6;
            078: spo = 5'h7;
            079: spo = 5'h8;
            080: spo = 5'h1b;
            081: spo = 5'h1b;
            082: spo = 5'h1c;
            083: spo = 5'h1d;
            084: spo = 5'h1e;
            085: spo = 5'h1f;
            086: spo = 5'h0;
            087: spo = 5'h1;
            088: spo = 5'h2;
            089: spo = 5'h2;
            090: spo = 5'h3;
            091: spo = 5'h4;
            092: spo = 5'h5;
            093: spo = 5'h6;
            094: spo = 5'h7;
            095: spo = 5'h8;
            096: spo = 5'h1a;
            097: spo = 5'h1b;
            098: spo = 5'h1c;
            099: spo = 5'h1d;
            100: spo = 5'h1e;
            101: spo = 5'h1e;
            102: spo = 5'h1f;
            103: spo = 5'h0;
            104: spo = 5'h1;
            105: spo = 5'h2;
            106: spo = 5'h3;
            107: spo = 5'h4;
            108: spo = 5'h4;
            109: spo = 5'h5;
            110: spo = 5'h6;
            111: spo = 5'h7;
            112: spo = 5'h1a;
            113: spo = 5'h1a;
            114: spo = 5'h1b;
            115: spo = 5'h1c;
            116: spo = 5'h1d;
            117: spo = 5'h1e;
            118: spo = 5'h1f;
            119: spo = 5'h0;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h3;
            124: spo = 5'h4;
            125: spo = 5'h5;
            126: spo = 5'h6;
            127: spo = 5'h7;
            128: spo = 5'h19;
            129: spo = 5'h1a;
            130: spo = 5'h1b;
            131: spo = 5'h1c;
            132: spo = 5'h1d;
            133: spo = 5'h1d;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h3;
            140: spo = 5'h3;
            141: spo = 5'h4;
            142: spo = 5'h5;
            143: spo = 5'h6;
            144: spo = 5'h19;
            145: spo = 5'h19;
            146: spo = 5'h1a;
            147: spo = 5'h1b;
            148: spo = 5'h1c;
            149: spo = 5'h1d;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h0;
            154: spo = 5'h1;
            155: spo = 5'h2;
            156: spo = 5'h3;
            157: spo = 5'h4;
            158: spo = 5'h5;
            159: spo = 5'h6;
            160: spo = 5'h18;
            161: spo = 5'h19;
            162: spo = 5'h1a;
            163: spo = 5'h1b;
            164: spo = 5'h1c;
            165: spo = 5'h1c;
            166: spo = 5'h1d;
            167: spo = 5'h1e;
            168: spo = 5'h1f;
            169: spo = 5'h0;
            170: spo = 5'h1;
            171: spo = 5'h2;
            172: spo = 5'h2;
            173: spo = 5'h3;
            174: spo = 5'h4;
            175: spo = 5'h5;
            176: spo = 5'h18;
            177: spo = 5'h18;
            178: spo = 5'h19;
            179: spo = 5'h1a;
            180: spo = 5'h1b;
            181: spo = 5'h1c;
            182: spo = 5'h1d;
            183: spo = 5'h1e;
            184: spo = 5'h1e;
            185: spo = 5'h1f;
            186: spo = 5'h0;
            187: spo = 5'h1;
            188: spo = 5'h2;
            189: spo = 5'h3;
            190: spo = 5'h4;
            191: spo = 5'h5;
            192: spo = 5'h17;
            193: spo = 5'h18;
            194: spo = 5'h19;
            195: spo = 5'h1a;
            196: spo = 5'h1b;
            197: spo = 5'h1b;
            198: spo = 5'h1c;
            199: spo = 5'h1d;
            200: spo = 5'h1e;
            201: spo = 5'h1f;
            202: spo = 5'h0;
            203: spo = 5'h1;
            204: spo = 5'h1;
            205: spo = 5'h2;
            206: spo = 5'h3;
            207: spo = 5'h4;
            208: spo = 5'h17;
            209: spo = 5'h17;
            210: spo = 5'h18;
            211: spo = 5'h19;
            212: spo = 5'h1a;
            213: spo = 5'h1b;
            214: spo = 5'h1c;
            215: spo = 5'h1d;
            216: spo = 5'h1d;
            217: spo = 5'h1e;
            218: spo = 5'h1f;
            219: spo = 5'h0;
            220: spo = 5'h1;
            221: spo = 5'h2;
            222: spo = 5'h3;
            223: spo = 5'h4;
            224: spo = 5'h16;
            225: spo = 5'h17;
            226: spo = 5'h18;
            227: spo = 5'h19;
            228: spo = 5'h1a;
            229: spo = 5'h1a;
            230: spo = 5'h1b;
            231: spo = 5'h1c;
            232: spo = 5'h1d;
            233: spo = 5'h1e;
            234: spo = 5'h1f;
            235: spo = 5'h0;
            236: spo = 5'h0;
            237: spo = 5'h1;
            238: spo = 5'h2;
            239: spo = 5'h3;
            240: spo = 5'h16;
            241: spo = 5'h16;
            242: spo = 5'h17;
            243: spo = 5'h18;
            244: spo = 5'h19;
            245: spo = 5'h1a;
            246: spo = 5'h1b;
            247: spo = 5'h1c;
            248: spo = 5'h1c;
            249: spo = 5'h1d;
            250: spo = 5'h1e;
            251: spo = 5'h1f;
            252: spo = 5'h0;
            253: spo = 5'h1;
            254: spo = 5'h2;
            255: spo = 5'h3;
            default: spo = 5'h0;
		endcase
	end
endmodule