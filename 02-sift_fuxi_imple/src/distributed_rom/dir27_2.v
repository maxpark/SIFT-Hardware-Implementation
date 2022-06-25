`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir27_2 
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

module dir27_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h8;
            001: spo = 5'h8;
            002: spo = 5'h8;
            003: spo = 5'h8;
            004: spo = 5'h8;
            005: spo = 5'h8;
            006: spo = 5'h8;
            007: spo = 5'h8;
            008: spo = 5'h8;
            009: spo = 5'h8;
            010: spo = 5'h8;
            011: spo = 5'h8;
            012: spo = 5'h8;
            013: spo = 5'h8;
            014: spo = 5'h8;
            015: spo = 5'h8;
            016: spo = 5'h7;
            017: spo = 5'h7;
            018: spo = 5'h7;
            019: spo = 5'h7;
            020: spo = 5'h7;
            021: spo = 5'h7;
            022: spo = 5'h7;
            023: spo = 5'h7;
            024: spo = 5'h7;
            025: spo = 5'h7;
            026: spo = 5'h7;
            027: spo = 5'h7;
            028: spo = 5'h7;
            029: spo = 5'h7;
            030: spo = 5'h7;
            031: spo = 5'h7;
            032: spo = 5'h6;
            033: spo = 5'h6;
            034: spo = 5'h6;
            035: spo = 5'h6;
            036: spo = 5'h6;
            037: spo = 5'h6;
            038: spo = 5'h6;
            039: spo = 5'h6;
            040: spo = 5'h6;
            041: spo = 5'h6;
            042: spo = 5'h6;
            043: spo = 5'h6;
            044: spo = 5'h6;
            045: spo = 5'h6;
            046: spo = 5'h6;
            047: spo = 5'h6;
            048: spo = 5'h5;
            049: spo = 5'h5;
            050: spo = 5'h5;
            051: spo = 5'h5;
            052: spo = 5'h5;
            053: spo = 5'h5;
            054: spo = 5'h5;
            055: spo = 5'h5;
            056: spo = 5'h5;
            057: spo = 5'h5;
            058: spo = 5'h5;
            059: spo = 5'h5;
            060: spo = 5'h5;
            061: spo = 5'h5;
            062: spo = 5'h5;
            063: spo = 5'h5;
            064: spo = 5'h4;
            065: spo = 5'h4;
            066: spo = 5'h4;
            067: spo = 5'h4;
            068: spo = 5'h4;
            069: spo = 5'h4;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h4;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h4;
            076: spo = 5'h4;
            077: spo = 5'h4;
            078: spo = 5'h4;
            079: spo = 5'h4;
            080: spo = 5'h3;
            081: spo = 5'h3;
            082: spo = 5'h3;
            083: spo = 5'h3;
            084: spo = 5'h3;
            085: spo = 5'h3;
            086: spo = 5'h3;
            087: spo = 5'h3;
            088: spo = 5'h3;
            089: spo = 5'h3;
            090: spo = 5'h3;
            091: spo = 5'h3;
            092: spo = 5'h3;
            093: spo = 5'h3;
            094: spo = 5'h3;
            095: spo = 5'h3;
            096: spo = 5'h2;
            097: spo = 5'h2;
            098: spo = 5'h2;
            099: spo = 5'h2;
            100: spo = 5'h2;
            101: spo = 5'h2;
            102: spo = 5'h2;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h2;
            107: spo = 5'h2;
            108: spo = 5'h2;
            109: spo = 5'h2;
            110: spo = 5'h2;
            111: spo = 5'h2;
            112: spo = 5'h1;
            113: spo = 5'h1;
            114: spo = 5'h1;
            115: spo = 5'h1;
            116: spo = 5'h1;
            117: spo = 5'h1;
            118: spo = 5'h1;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h1;
            123: spo = 5'h1;
            124: spo = 5'h1;
            125: spo = 5'h1;
            126: spo = 5'h1;
            127: spo = 5'h1;
            128: spo = 5'h0;
            129: spo = 5'h0;
            130: spo = 5'h0;
            131: spo = 5'h0;
            132: spo = 5'h0;
            133: spo = 5'h0;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h0;
            140: spo = 5'h0;
            141: spo = 5'h0;
            142: spo = 5'h0;
            143: spo = 5'h0;
            144: spo = 5'h1f;
            145: spo = 5'h1f;
            146: spo = 5'h1f;
            147: spo = 5'h1f;
            148: spo = 5'h1f;
            149: spo = 5'h1f;
            150: spo = 5'h1f;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1f;
            155: spo = 5'h1f;
            156: spo = 5'h1f;
            157: spo = 5'h1f;
            158: spo = 5'h1f;
            159: spo = 5'h1f;
            160: spo = 5'h1e;
            161: spo = 5'h1e;
            162: spo = 5'h1e;
            163: spo = 5'h1e;
            164: spo = 5'h1e;
            165: spo = 5'h1e;
            166: spo = 5'h1e;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1e;
            171: spo = 5'h1e;
            172: spo = 5'h1e;
            173: spo = 5'h1e;
            174: spo = 5'h1e;
            175: spo = 5'h1e;
            176: spo = 5'h1d;
            177: spo = 5'h1d;
            178: spo = 5'h1d;
            179: spo = 5'h1d;
            180: spo = 5'h1d;
            181: spo = 5'h1d;
            182: spo = 5'h1d;
            183: spo = 5'h1d;
            184: spo = 5'h1d;
            185: spo = 5'h1d;
            186: spo = 5'h1d;
            187: spo = 5'h1d;
            188: spo = 5'h1d;
            189: spo = 5'h1d;
            190: spo = 5'h1d;
            191: spo = 5'h1d;
            192: spo = 5'h1c;
            193: spo = 5'h1c;
            194: spo = 5'h1c;
            195: spo = 5'h1c;
            196: spo = 5'h1c;
            197: spo = 5'h1c;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1c;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1c;
            204: spo = 5'h1c;
            205: spo = 5'h1c;
            206: spo = 5'h1c;
            207: spo = 5'h1c;
            208: spo = 5'h1b;
            209: spo = 5'h1b;
            210: spo = 5'h1b;
            211: spo = 5'h1b;
            212: spo = 5'h1b;
            213: spo = 5'h1b;
            214: spo = 5'h1b;
            215: spo = 5'h1b;
            216: spo = 5'h1b;
            217: spo = 5'h1b;
            218: spo = 5'h1b;
            219: spo = 5'h1b;
            220: spo = 5'h1b;
            221: spo = 5'h1b;
            222: spo = 5'h1b;
            223: spo = 5'h1b;
            224: spo = 5'h1a;
            225: spo = 5'h1a;
            226: spo = 5'h1a;
            227: spo = 5'h1a;
            228: spo = 5'h1a;
            229: spo = 5'h1a;
            230: spo = 5'h1a;
            231: spo = 5'h1a;
            232: spo = 5'h1a;
            233: spo = 5'h1a;
            234: spo = 5'h1a;
            235: spo = 5'h1a;
            236: spo = 5'h1a;
            237: spo = 5'h1a;
            238: spo = 5'h1a;
            239: spo = 5'h1a;
            240: spo = 5'h19;
            241: spo = 5'h19;
            242: spo = 5'h19;
            243: spo = 5'h19;
            244: spo = 5'h19;
            245: spo = 5'h19;
            246: spo = 5'h19;
            247: spo = 5'h19;
            248: spo = 5'h19;
            249: spo = 5'h19;
            250: spo = 5'h19;
            251: spo = 5'h19;
            252: spo = 5'h19;
            253: spo = 5'h19;
            254: spo = 5'h19;
            255: spo = 5'h19;
            default: spo = 5'h0;
		endcase
	end
endmodule