`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir7_1 
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

module dir7_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h5;
            001: spo = 5'h4;
            002: spo = 5'h3;
            003: spo = 5'h2;
            004: spo = 5'h1;
            005: spo = 5'h0;
            006: spo = 5'h1f;
            007: spo = 5'h1e;
            008: spo = 5'h1d;
            009: spo = 5'h1c;
            010: spo = 5'h1b;
            011: spo = 5'h1a;
            012: spo = 5'h1a;
            013: spo = 5'h19;
            014: spo = 5'h18;
            015: spo = 5'h17;
            016: spo = 5'h5;
            017: spo = 5'h4;
            018: spo = 5'h3;
            019: spo = 5'h2;
            020: spo = 5'h1;
            021: spo = 5'h0;
            022: spo = 5'h1f;
            023: spo = 5'h1f;
            024: spo = 5'h1e;
            025: spo = 5'h1d;
            026: spo = 5'h1c;
            027: spo = 5'h1b;
            028: spo = 5'h1a;
            029: spo = 5'h19;
            030: spo = 5'h18;
            031: spo = 5'h17;
            032: spo = 5'h5;
            033: spo = 5'h5;
            034: spo = 5'h4;
            035: spo = 5'h3;
            036: spo = 5'h2;
            037: spo = 5'h1;
            038: spo = 5'h0;
            039: spo = 5'h1f;
            040: spo = 5'h1e;
            041: spo = 5'h1d;
            042: spo = 5'h1c;
            043: spo = 5'h1b;
            044: spo = 5'h1a;
            045: spo = 5'h19;
            046: spo = 5'h18;
            047: spo = 5'h17;
            048: spo = 5'h6;
            049: spo = 5'h5;
            050: spo = 5'h4;
            051: spo = 5'h3;
            052: spo = 5'h2;
            053: spo = 5'h1;
            054: spo = 5'h0;
            055: spo = 5'h1f;
            056: spo = 5'h1e;
            057: spo = 5'h1d;
            058: spo = 5'h1c;
            059: spo = 5'h1b;
            060: spo = 5'h1b;
            061: spo = 5'h1a;
            062: spo = 5'h19;
            063: spo = 5'h18;
            064: spo = 5'h6;
            065: spo = 5'h5;
            066: spo = 5'h4;
            067: spo = 5'h3;
            068: spo = 5'h2;
            069: spo = 5'h1;
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
            080: spo = 5'h6;
            081: spo = 5'h6;
            082: spo = 5'h5;
            083: spo = 5'h4;
            084: spo = 5'h3;
            085: spo = 5'h2;
            086: spo = 5'h1;
            087: spo = 5'h0;
            088: spo = 5'h1f;
            089: spo = 5'h1e;
            090: spo = 5'h1d;
            091: spo = 5'h1c;
            092: spo = 5'h1b;
            093: spo = 5'h1a;
            094: spo = 5'h19;
            095: spo = 5'h18;
            096: spo = 5'h7;
            097: spo = 5'h6;
            098: spo = 5'h5;
            099: spo = 5'h4;
            100: spo = 5'h3;
            101: spo = 5'h2;
            102: spo = 5'h1;
            103: spo = 5'h0;
            104: spo = 5'h1f;
            105: spo = 5'h1e;
            106: spo = 5'h1d;
            107: spo = 5'h1c;
            108: spo = 5'h1c;
            109: spo = 5'h1b;
            110: spo = 5'h1a;
            111: spo = 5'h19;
            112: spo = 5'h7;
            113: spo = 5'h6;
            114: spo = 5'h5;
            115: spo = 5'h4;
            116: spo = 5'h3;
            117: spo = 5'h2;
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
            155: spo = 5'h1e;
            156: spo = 5'h1d;
            157: spo = 5'h1c;
            158: spo = 5'h1b;
            159: spo = 5'h1a;
            160: spo = 5'h8;
            161: spo = 5'h7;
            162: spo = 5'h6;
            163: spo = 5'h5;
            164: spo = 5'h4;
            165: spo = 5'h4;
            166: spo = 5'h3;
            167: spo = 5'h2;
            168: spo = 5'h1;
            169: spo = 5'h0;
            170: spo = 5'h1f;
            171: spo = 5'h1e;
            172: spo = 5'h1d;
            173: spo = 5'h1c;
            174: spo = 5'h1b;
            175: spo = 5'h1a;
            176: spo = 5'h9;
            177: spo = 5'h8;
            178: spo = 5'h7;
            179: spo = 5'h6;
            180: spo = 5'h5;
            181: spo = 5'h4;
            182: spo = 5'h3;
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
            203: spo = 5'h1f;
            204: spo = 5'h1e;
            205: spo = 5'h1d;
            206: spo = 5'h1c;
            207: spo = 5'h1b;
            208: spo = 5'h9;
            209: spo = 5'h8;
            210: spo = 5'h7;
            211: spo = 5'h6;
            212: spo = 5'h5;
            213: spo = 5'h5;
            214: spo = 5'h4;
            215: spo = 5'h3;
            216: spo = 5'h2;
            217: spo = 5'h1;
            218: spo = 5'h0;
            219: spo = 5'h1f;
            220: spo = 5'h1e;
            221: spo = 5'h1d;
            222: spo = 5'h1c;
            223: spo = 5'h1b;
            224: spo = 5'ha;
            225: spo = 5'h9;
            226: spo = 5'h8;
            227: spo = 5'h7;
            228: spo = 5'h6;
            229: spo = 5'h5;
            230: spo = 5'h4;
            231: spo = 5'h3;
            232: spo = 5'h2;
            233: spo = 5'h1;
            234: spo = 5'h0;
            235: spo = 5'h1f;
            236: spo = 5'h1e;
            237: spo = 5'h1d;
            238: spo = 5'h1c;
            239: spo = 5'h1b;
            240: spo = 5'ha;
            241: spo = 5'h9;
            242: spo = 5'h8;
            243: spo = 5'h7;
            244: spo = 5'h6;
            245: spo = 5'h5;
            246: spo = 5'h4;
            247: spo = 5'h3;
            248: spo = 5'h2;
            249: spo = 5'h1;
            250: spo = 5'h1;
            251: spo = 5'h0;
            252: spo = 5'h1f;
            253: spo = 5'h1e;
            254: spo = 5'h1d;
            255: spo = 5'h1c;
            default: spo = 5'h0;
		endcase
	end
endmodule