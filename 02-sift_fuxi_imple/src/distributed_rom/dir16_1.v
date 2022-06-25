`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir16_1 
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

module dir16_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'ha;
            001: spo = 5'ha;
            002: spo = 5'ha;
            003: spo = 5'h9;
            004: spo = 5'h9;
            005: spo = 5'h9;
            006: spo = 5'h8;
            007: spo = 5'h8;
            008: spo = 5'h8;
            009: spo = 5'h7;
            010: spo = 5'h7;
            011: spo = 5'h6;
            012: spo = 5'h6;
            013: spo = 5'h6;
            014: spo = 5'h5;
            015: spo = 5'h5;
            016: spo = 5'h9;
            017: spo = 5'h9;
            018: spo = 5'h9;
            019: spo = 5'h8;
            020: spo = 5'h8;
            021: spo = 5'h8;
            022: spo = 5'h7;
            023: spo = 5'h7;
            024: spo = 5'h7;
            025: spo = 5'h6;
            026: spo = 5'h6;
            027: spo = 5'h6;
            028: spo = 5'h5;
            029: spo = 5'h5;
            030: spo = 5'h5;
            031: spo = 5'h4;
            032: spo = 5'h8;
            033: spo = 5'h8;
            034: spo = 5'h8;
            035: spo = 5'h7;
            036: spo = 5'h7;
            037: spo = 5'h7;
            038: spo = 5'h6;
            039: spo = 5'h6;
            040: spo = 5'h6;
            041: spo = 5'h5;
            042: spo = 5'h5;
            043: spo = 5'h5;
            044: spo = 5'h4;
            045: spo = 5'h4;
            046: spo = 5'h4;
            047: spo = 5'h3;
            048: spo = 5'h7;
            049: spo = 5'h7;
            050: spo = 5'h7;
            051: spo = 5'h6;
            052: spo = 5'h6;
            053: spo = 5'h6;
            054: spo = 5'h5;
            055: spo = 5'h5;
            056: spo = 5'h5;
            057: spo = 5'h4;
            058: spo = 5'h4;
            059: spo = 5'h4;
            060: spo = 5'h3;
            061: spo = 5'h3;
            062: spo = 5'h3;
            063: spo = 5'h2;
            064: spo = 5'h6;
            065: spo = 5'h6;
            066: spo = 5'h6;
            067: spo = 5'h5;
            068: spo = 5'h5;
            069: spo = 5'h5;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h4;
            073: spo = 5'h3;
            074: spo = 5'h3;
            075: spo = 5'h3;
            076: spo = 5'h2;
            077: spo = 5'h2;
            078: spo = 5'h2;
            079: spo = 5'h1;
            080: spo = 5'h6;
            081: spo = 5'h5;
            082: spo = 5'h5;
            083: spo = 5'h5;
            084: spo = 5'h4;
            085: spo = 5'h4;
            086: spo = 5'h4;
            087: spo = 5'h3;
            088: spo = 5'h3;
            089: spo = 5'h2;
            090: spo = 5'h2;
            091: spo = 5'h2;
            092: spo = 5'h1;
            093: spo = 5'h1;
            094: spo = 5'h1;
            095: spo = 5'h0;
            096: spo = 5'h5;
            097: spo = 5'h4;
            098: spo = 5'h4;
            099: spo = 5'h4;
            100: spo = 5'h3;
            101: spo = 5'h3;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h1;
            107: spo = 5'h1;
            108: spo = 5'h1;
            109: spo = 5'h0;
            110: spo = 5'h0;
            111: spo = 5'h1f;
            112: spo = 5'h4;
            113: spo = 5'h3;
            114: spo = 5'h3;
            115: spo = 5'h3;
            116: spo = 5'h2;
            117: spo = 5'h2;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h0;
            123: spo = 5'h0;
            124: spo = 5'h0;
            125: spo = 5'h1f;
            126: spo = 5'h1f;
            127: spo = 5'h1f;
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
            144: spo = 5'h2;
            145: spo = 5'h1;
            146: spo = 5'h1;
            147: spo = 5'h1;
            148: spo = 5'h0;
            149: spo = 5'h0;
            150: spo = 5'h0;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1e;
            156: spo = 5'h1e;
            157: spo = 5'h1d;
            158: spo = 5'h1d;
            159: spo = 5'h1d;
            160: spo = 5'h1;
            161: spo = 5'h1;
            162: spo = 5'h0;
            163: spo = 5'h0;
            164: spo = 5'h1f;
            165: spo = 5'h1f;
            166: spo = 5'h1f;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1d;
            172: spo = 5'h1d;
            173: spo = 5'h1c;
            174: spo = 5'h1c;
            175: spo = 5'h1c;
            176: spo = 5'h0;
            177: spo = 5'h0;
            178: spo = 5'h1f;
            179: spo = 5'h1f;
            180: spo = 5'h1f;
            181: spo = 5'h1e;
            182: spo = 5'h1e;
            183: spo = 5'h1e;
            184: spo = 5'h1d;
            185: spo = 5'h1d;
            186: spo = 5'h1c;
            187: spo = 5'h1c;
            188: spo = 5'h1c;
            189: spo = 5'h1b;
            190: spo = 5'h1b;
            191: spo = 5'h1b;
            192: spo = 5'h1f;
            193: spo = 5'h1f;
            194: spo = 5'h1e;
            195: spo = 5'h1e;
            196: spo = 5'h1e;
            197: spo = 5'h1d;
            198: spo = 5'h1d;
            199: spo = 5'h1d;
            200: spo = 5'h1c;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1b;
            204: spo = 5'h1b;
            205: spo = 5'h1b;
            206: spo = 5'h1a;
            207: spo = 5'h1a;
            208: spo = 5'h1e;
            209: spo = 5'h1e;
            210: spo = 5'h1d;
            211: spo = 5'h1d;
            212: spo = 5'h1d;
            213: spo = 5'h1c;
            214: spo = 5'h1c;
            215: spo = 5'h1c;
            216: spo = 5'h1b;
            217: spo = 5'h1b;
            218: spo = 5'h1b;
            219: spo = 5'h1a;
            220: spo = 5'h1a;
            221: spo = 5'h1a;
            222: spo = 5'h19;
            223: spo = 5'h19;
            224: spo = 5'h1d;
            225: spo = 5'h1d;
            226: spo = 5'h1c;
            227: spo = 5'h1c;
            228: spo = 5'h1c;
            229: spo = 5'h1b;
            230: spo = 5'h1b;
            231: spo = 5'h1b;
            232: spo = 5'h1a;
            233: spo = 5'h1a;
            234: spo = 5'h1a;
            235: spo = 5'h19;
            236: spo = 5'h19;
            237: spo = 5'h19;
            238: spo = 5'h18;
            239: spo = 5'h18;
            240: spo = 5'h1c;
            241: spo = 5'h1c;
            242: spo = 5'h1b;
            243: spo = 5'h1b;
            244: spo = 5'h1b;
            245: spo = 5'h1a;
            246: spo = 5'h1a;
            247: spo = 5'h1a;
            248: spo = 5'h19;
            249: spo = 5'h19;
            250: spo = 5'h19;
            251: spo = 5'h18;
            252: spo = 5'h18;
            253: spo = 5'h18;
            254: spo = 5'h17;
            255: spo = 5'h17;
            default: spo = 5'h0;
		endcase
	end
endmodule