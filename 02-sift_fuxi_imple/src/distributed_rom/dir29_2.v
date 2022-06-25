`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir29_2 
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

module dir29_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h5;
            001: spo = 5'h5;
            002: spo = 5'h5;
            003: spo = 5'h6;
            004: spo = 5'h6;
            005: spo = 5'h6;
            006: spo = 5'h7;
            007: spo = 5'h7;
            008: spo = 5'h8;
            009: spo = 5'h8;
            010: spo = 5'h8;
            011: spo = 5'h9;
            012: spo = 5'h9;
            013: spo = 5'h9;
            014: spo = 5'ha;
            015: spo = 5'ha;
            016: spo = 5'h4;
            017: spo = 5'h4;
            018: spo = 5'h5;
            019: spo = 5'h5;
            020: spo = 5'h5;
            021: spo = 5'h6;
            022: spo = 5'h6;
            023: spo = 5'h6;
            024: spo = 5'h7;
            025: spo = 5'h7;
            026: spo = 5'h7;
            027: spo = 5'h8;
            028: spo = 5'h8;
            029: spo = 5'h8;
            030: spo = 5'h9;
            031: spo = 5'h9;
            032: spo = 5'h3;
            033: spo = 5'h3;
            034: spo = 5'h4;
            035: spo = 5'h4;
            036: spo = 5'h4;
            037: spo = 5'h5;
            038: spo = 5'h5;
            039: spo = 5'h5;
            040: spo = 5'h6;
            041: spo = 5'h6;
            042: spo = 5'h6;
            043: spo = 5'h7;
            044: spo = 5'h7;
            045: spo = 5'h7;
            046: spo = 5'h8;
            047: spo = 5'h8;
            048: spo = 5'h2;
            049: spo = 5'h2;
            050: spo = 5'h3;
            051: spo = 5'h3;
            052: spo = 5'h3;
            053: spo = 5'h4;
            054: spo = 5'h4;
            055: spo = 5'h4;
            056: spo = 5'h5;
            057: spo = 5'h5;
            058: spo = 5'h5;
            059: spo = 5'h6;
            060: spo = 5'h6;
            061: spo = 5'h6;
            062: spo = 5'h7;
            063: spo = 5'h7;
            064: spo = 5'h1;
            065: spo = 5'h1;
            066: spo = 5'h2;
            067: spo = 5'h2;
            068: spo = 5'h2;
            069: spo = 5'h3;
            070: spo = 5'h3;
            071: spo = 5'h3;
            072: spo = 5'h4;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h5;
            076: spo = 5'h5;
            077: spo = 5'h5;
            078: spo = 5'h6;
            079: spo = 5'h6;
            080: spo = 5'h0;
            081: spo = 5'h0;
            082: spo = 5'h1;
            083: spo = 5'h1;
            084: spo = 5'h1;
            085: spo = 5'h2;
            086: spo = 5'h2;
            087: spo = 5'h2;
            088: spo = 5'h3;
            089: spo = 5'h3;
            090: spo = 5'h4;
            091: spo = 5'h4;
            092: spo = 5'h4;
            093: spo = 5'h5;
            094: spo = 5'h5;
            095: spo = 5'h5;
            096: spo = 5'h1f;
            097: spo = 5'h1f;
            098: spo = 5'h0;
            099: spo = 5'h0;
            100: spo = 5'h1;
            101: spo = 5'h1;
            102: spo = 5'h1;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h3;
            107: spo = 5'h3;
            108: spo = 5'h3;
            109: spo = 5'h4;
            110: spo = 5'h4;
            111: spo = 5'h4;
            112: spo = 5'h1e;
            113: spo = 5'h1f;
            114: spo = 5'h1f;
            115: spo = 5'h1f;
            116: spo = 5'h0;
            117: spo = 5'h0;
            118: spo = 5'h0;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h2;
            124: spo = 5'h2;
            125: spo = 5'h3;
            126: spo = 5'h3;
            127: spo = 5'h3;
            128: spo = 5'h1d;
            129: spo = 5'h1e;
            130: spo = 5'h1e;
            131: spo = 5'h1e;
            132: spo = 5'h1f;
            133: spo = 5'h1f;
            134: spo = 5'h1f;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h1;
            139: spo = 5'h1;
            140: spo = 5'h1;
            141: spo = 5'h2;
            142: spo = 5'h2;
            143: spo = 5'h2;
            144: spo = 5'h1c;
            145: spo = 5'h1d;
            146: spo = 5'h1d;
            147: spo = 5'h1d;
            148: spo = 5'h1e;
            149: spo = 5'h1e;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h0;
            155: spo = 5'h0;
            156: spo = 5'h0;
            157: spo = 5'h1;
            158: spo = 5'h1;
            159: spo = 5'h1;
            160: spo = 5'h1b;
            161: spo = 5'h1c;
            162: spo = 5'h1c;
            163: spo = 5'h1c;
            164: spo = 5'h1d;
            165: spo = 5'h1d;
            166: spo = 5'h1d;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1f;
            171: spo = 5'h1f;
            172: spo = 5'h1f;
            173: spo = 5'h0;
            174: spo = 5'h0;
            175: spo = 5'h1;
            176: spo = 5'h1a;
            177: spo = 5'h1b;
            178: spo = 5'h1b;
            179: spo = 5'h1b;
            180: spo = 5'h1c;
            181: spo = 5'h1c;
            182: spo = 5'h1c;
            183: spo = 5'h1d;
            184: spo = 5'h1d;
            185: spo = 5'h1e;
            186: spo = 5'h1e;
            187: spo = 5'h1e;
            188: spo = 5'h1f;
            189: spo = 5'h1f;
            190: spo = 5'h1f;
            191: spo = 5'h0;
            192: spo = 5'h1a;
            193: spo = 5'h1a;
            194: spo = 5'h1a;
            195: spo = 5'h1b;
            196: spo = 5'h1b;
            197: spo = 5'h1b;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1c;
            201: spo = 5'h1d;
            202: spo = 5'h1d;
            203: spo = 5'h1d;
            204: spo = 5'h1e;
            205: spo = 5'h1e;
            206: spo = 5'h1e;
            207: spo = 5'h1f;
            208: spo = 5'h19;
            209: spo = 5'h19;
            210: spo = 5'h19;
            211: spo = 5'h1a;
            212: spo = 5'h1a;
            213: spo = 5'h1a;
            214: spo = 5'h1b;
            215: spo = 5'h1b;
            216: spo = 5'h1b;
            217: spo = 5'h1c;
            218: spo = 5'h1c;
            219: spo = 5'h1c;
            220: spo = 5'h1d;
            221: spo = 5'h1d;
            222: spo = 5'h1d;
            223: spo = 5'h1e;
            224: spo = 5'h18;
            225: spo = 5'h18;
            226: spo = 5'h18;
            227: spo = 5'h19;
            228: spo = 5'h19;
            229: spo = 5'h19;
            230: spo = 5'h1a;
            231: spo = 5'h1a;
            232: spo = 5'h1a;
            233: spo = 5'h1b;
            234: spo = 5'h1b;
            235: spo = 5'h1b;
            236: spo = 5'h1c;
            237: spo = 5'h1c;
            238: spo = 5'h1c;
            239: spo = 5'h1d;
            240: spo = 5'h17;
            241: spo = 5'h17;
            242: spo = 5'h17;
            243: spo = 5'h18;
            244: spo = 5'h18;
            245: spo = 5'h18;
            246: spo = 5'h19;
            247: spo = 5'h19;
            248: spo = 5'h19;
            249: spo = 5'h1a;
            250: spo = 5'h1a;
            251: spo = 5'h1a;
            252: spo = 5'h1b;
            253: spo = 5'h1b;
            254: spo = 5'h1b;
            255: spo = 5'h1c;
            default: spo = 5'h0;
		endcase
	end
endmodule