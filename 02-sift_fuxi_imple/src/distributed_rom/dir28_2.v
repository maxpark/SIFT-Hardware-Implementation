`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir28_2 
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

module dir28_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h6;
            001: spo = 5'h7;
            002: spo = 5'h7;
            003: spo = 5'h7;
            004: spo = 5'h7;
            005: spo = 5'h7;
            006: spo = 5'h8;
            007: spo = 5'h8;
            008: spo = 5'h8;
            009: spo = 5'h8;
            010: spo = 5'h8;
            011: spo = 5'h8;
            012: spo = 5'h9;
            013: spo = 5'h9;
            014: spo = 5'h9;
            015: spo = 5'h9;
            016: spo = 5'h6;
            017: spo = 5'h6;
            018: spo = 5'h6;
            019: spo = 5'h6;
            020: spo = 5'h6;
            021: spo = 5'h6;
            022: spo = 5'h7;
            023: spo = 5'h7;
            024: spo = 5'h7;
            025: spo = 5'h7;
            026: spo = 5'h7;
            027: spo = 5'h7;
            028: spo = 5'h8;
            029: spo = 5'h8;
            030: spo = 5'h8;
            031: spo = 5'h8;
            032: spo = 5'h5;
            033: spo = 5'h5;
            034: spo = 5'h5;
            035: spo = 5'h5;
            036: spo = 5'h5;
            037: spo = 5'h5;
            038: spo = 5'h6;
            039: spo = 5'h6;
            040: spo = 5'h6;
            041: spo = 5'h6;
            042: spo = 5'h6;
            043: spo = 5'h6;
            044: spo = 5'h7;
            045: spo = 5'h7;
            046: spo = 5'h7;
            047: spo = 5'h7;
            048: spo = 5'h4;
            049: spo = 5'h4;
            050: spo = 5'h4;
            051: spo = 5'h4;
            052: spo = 5'h4;
            053: spo = 5'h4;
            054: spo = 5'h5;
            055: spo = 5'h5;
            056: spo = 5'h5;
            057: spo = 5'h5;
            058: spo = 5'h5;
            059: spo = 5'h5;
            060: spo = 5'h6;
            061: spo = 5'h6;
            062: spo = 5'h6;
            063: spo = 5'h6;
            064: spo = 5'h3;
            065: spo = 5'h3;
            066: spo = 5'h3;
            067: spo = 5'h3;
            068: spo = 5'h3;
            069: spo = 5'h3;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h4;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h4;
            076: spo = 5'h5;
            077: spo = 5'h5;
            078: spo = 5'h5;
            079: spo = 5'h5;
            080: spo = 5'h2;
            081: spo = 5'h2;
            082: spo = 5'h2;
            083: spo = 5'h2;
            084: spo = 5'h2;
            085: spo = 5'h2;
            086: spo = 5'h3;
            087: spo = 5'h3;
            088: spo = 5'h3;
            089: spo = 5'h3;
            090: spo = 5'h3;
            091: spo = 5'h3;
            092: spo = 5'h4;
            093: spo = 5'h4;
            094: spo = 5'h4;
            095: spo = 5'h4;
            096: spo = 5'h1;
            097: spo = 5'h1;
            098: spo = 5'h1;
            099: spo = 5'h1;
            100: spo = 5'h1;
            101: spo = 5'h1;
            102: spo = 5'h2;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h2;
            107: spo = 5'h2;
            108: spo = 5'h3;
            109: spo = 5'h3;
            110: spo = 5'h3;
            111: spo = 5'h3;
            112: spo = 5'h0;
            113: spo = 5'h0;
            114: spo = 5'h0;
            115: spo = 5'h0;
            116: spo = 5'h0;
            117: spo = 5'h0;
            118: spo = 5'h1;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h1;
            123: spo = 5'h2;
            124: spo = 5'h2;
            125: spo = 5'h2;
            126: spo = 5'h2;
            127: spo = 5'h2;
            128: spo = 5'h1f;
            129: spo = 5'h1f;
            130: spo = 5'h1f;
            131: spo = 5'h1f;
            132: spo = 5'h1f;
            133: spo = 5'h1f;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h1;
            140: spo = 5'h1;
            141: spo = 5'h1;
            142: spo = 5'h1;
            143: spo = 5'h1;
            144: spo = 5'h1e;
            145: spo = 5'h1e;
            146: spo = 5'h1e;
            147: spo = 5'h1e;
            148: spo = 5'h1e;
            149: spo = 5'h1e;
            150: spo = 5'h1f;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1f;
            155: spo = 5'h0;
            156: spo = 5'h0;
            157: spo = 5'h0;
            158: spo = 5'h0;
            159: spo = 5'h0;
            160: spo = 5'h1d;
            161: spo = 5'h1d;
            162: spo = 5'h1d;
            163: spo = 5'h1d;
            164: spo = 5'h1d;
            165: spo = 5'h1e;
            166: spo = 5'h1e;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1e;
            171: spo = 5'h1f;
            172: spo = 5'h1f;
            173: spo = 5'h1f;
            174: spo = 5'h1f;
            175: spo = 5'h1f;
            176: spo = 5'h1c;
            177: spo = 5'h1c;
            178: spo = 5'h1c;
            179: spo = 5'h1c;
            180: spo = 5'h1c;
            181: spo = 5'h1d;
            182: spo = 5'h1d;
            183: spo = 5'h1d;
            184: spo = 5'h1d;
            185: spo = 5'h1d;
            186: spo = 5'h1d;
            187: spo = 5'h1e;
            188: spo = 5'h1e;
            189: spo = 5'h1e;
            190: spo = 5'h1e;
            191: spo = 5'h1e;
            192: spo = 5'h1b;
            193: spo = 5'h1b;
            194: spo = 5'h1b;
            195: spo = 5'h1b;
            196: spo = 5'h1b;
            197: spo = 5'h1c;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1c;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1d;
            204: spo = 5'h1d;
            205: spo = 5'h1d;
            206: spo = 5'h1d;
            207: spo = 5'h1d;
            208: spo = 5'h1a;
            209: spo = 5'h1a;
            210: spo = 5'h1a;
            211: spo = 5'h1a;
            212: spo = 5'h1a;
            213: spo = 5'h1b;
            214: spo = 5'h1b;
            215: spo = 5'h1b;
            216: spo = 5'h1b;
            217: spo = 5'h1b;
            218: spo = 5'h1b;
            219: spo = 5'h1c;
            220: spo = 5'h1c;
            221: spo = 5'h1c;
            222: spo = 5'h1c;
            223: spo = 5'h1c;
            224: spo = 5'h19;
            225: spo = 5'h19;
            226: spo = 5'h19;
            227: spo = 5'h19;
            228: spo = 5'h19;
            229: spo = 5'h1a;
            230: spo = 5'h1a;
            231: spo = 5'h1a;
            232: spo = 5'h1a;
            233: spo = 5'h1a;
            234: spo = 5'h1a;
            235: spo = 5'h1b;
            236: spo = 5'h1b;
            237: spo = 5'h1b;
            238: spo = 5'h1b;
            239: spo = 5'h1b;
            240: spo = 5'h18;
            241: spo = 5'h18;
            242: spo = 5'h18;
            243: spo = 5'h18;
            244: spo = 5'h18;
            245: spo = 5'h19;
            246: spo = 5'h19;
            247: spo = 5'h19;
            248: spo = 5'h19;
            249: spo = 5'h19;
            250: spo = 5'h19;
            251: spo = 5'h1a;
            252: spo = 5'h1a;
            253: spo = 5'h1a;
            254: spo = 5'h1a;
            255: spo = 5'h1a;
            default: spo = 5'h0;
		endcase
	end
endmodule