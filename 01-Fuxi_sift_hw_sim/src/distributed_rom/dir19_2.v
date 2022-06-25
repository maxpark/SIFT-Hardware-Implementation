`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir19_2 
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

module dir19_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h9;
            001: spo = 5'h8;
            002: spo = 5'h7;
            003: spo = 5'h6;
            004: spo = 5'h5;
            005: spo = 5'h4;
            006: spo = 5'h3;
            007: spo = 5'h2;
            008: spo = 5'h1;
            009: spo = 5'h0;
            010: spo = 5'h1f;
            011: spo = 5'h1e;
            012: spo = 5'h1d;
            013: spo = 5'h1c;
            014: spo = 5'h1b;
            015: spo = 5'h1a;
            016: spo = 5'h9;
            017: spo = 5'h8;
            018: spo = 5'h7;
            019: spo = 5'h6;
            020: spo = 5'h5;
            021: spo = 5'h4;
            022: spo = 5'h3;
            023: spo = 5'h2;
            024: spo = 5'h1;
            025: spo = 5'h0;
            026: spo = 5'h1f;
            027: spo = 5'h1e;
            028: spo = 5'h1d;
            029: spo = 5'h1c;
            030: spo = 5'h1b;
            031: spo = 5'h1a;
            032: spo = 5'h9;
            033: spo = 5'h8;
            034: spo = 5'h7;
            035: spo = 5'h6;
            036: spo = 5'h5;
            037: spo = 5'h4;
            038: spo = 5'h3;
            039: spo = 5'h2;
            040: spo = 5'h1;
            041: spo = 5'h0;
            042: spo = 5'h1f;
            043: spo = 5'h1e;
            044: spo = 5'h1d;
            045: spo = 5'h1c;
            046: spo = 5'h1b;
            047: spo = 5'h1a;
            048: spo = 5'h9;
            049: spo = 5'h8;
            050: spo = 5'h7;
            051: spo = 5'h6;
            052: spo = 5'h5;
            053: spo = 5'h4;
            054: spo = 5'h3;
            055: spo = 5'h2;
            056: spo = 5'h1;
            057: spo = 5'h0;
            058: spo = 5'h1f;
            059: spo = 5'h1e;
            060: spo = 5'h1d;
            061: spo = 5'h1c;
            062: spo = 5'h1b;
            063: spo = 5'h1a;
            064: spo = 5'h9;
            065: spo = 5'h8;
            066: spo = 5'h7;
            067: spo = 5'h6;
            068: spo = 5'h5;
            069: spo = 5'h4;
            070: spo = 5'h3;
            071: spo = 5'h2;
            072: spo = 5'h1;
            073: spo = 5'h0;
            074: spo = 5'h1f;
            075: spo = 5'h1e;
            076: spo = 5'h1d;
            077: spo = 5'h1c;
            078: spo = 5'h1b;
            079: spo = 5'h1a;
            080: spo = 5'h8;
            081: spo = 5'h7;
            082: spo = 5'h6;
            083: spo = 5'h5;
            084: spo = 5'h4;
            085: spo = 5'h3;
            086: spo = 5'h2;
            087: spo = 5'h2;
            088: spo = 5'h1;
            089: spo = 5'h0;
            090: spo = 5'h1f;
            091: spo = 5'h1e;
            092: spo = 5'h1d;
            093: spo = 5'h1c;
            094: spo = 5'h1b;
            095: spo = 5'h1a;
            096: spo = 5'h8;
            097: spo = 5'h7;
            098: spo = 5'h6;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h3;
            102: spo = 5'h2;
            103: spo = 5'h1;
            104: spo = 5'h0;
            105: spo = 5'h1f;
            106: spo = 5'h1e;
            107: spo = 5'h1d;
            108: spo = 5'h1c;
            109: spo = 5'h1b;
            110: spo = 5'h1a;
            111: spo = 5'h19;
            112: spo = 5'h8;
            113: spo = 5'h7;
            114: spo = 5'h6;
            115: spo = 5'h5;
            116: spo = 5'h4;
            117: spo = 5'h3;
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
            155: spo = 5'h1d;
            156: spo = 5'h1c;
            157: spo = 5'h1b;
            158: spo = 5'h1a;
            159: spo = 5'h19;
            160: spo = 5'h8;
            161: spo = 5'h7;
            162: spo = 5'h6;
            163: spo = 5'h5;
            164: spo = 5'h4;
            165: spo = 5'h3;
            166: spo = 5'h2;
            167: spo = 5'h1;
            168: spo = 5'h0;
            169: spo = 5'h1f;
            170: spo = 5'h1e;
            171: spo = 5'h1d;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1a;
            175: spo = 5'h19;
            176: spo = 5'h7;
            177: spo = 5'h6;
            178: spo = 5'h5;
            179: spo = 5'h4;
            180: spo = 5'h3;
            181: spo = 5'h2;
            182: spo = 5'h1;
            183: spo = 5'h0;
            184: spo = 5'h1f;
            185: spo = 5'h1e;
            186: spo = 5'h1e;
            187: spo = 5'h1d;
            188: spo = 5'h1c;
            189: spo = 5'h1b;
            190: spo = 5'h1a;
            191: spo = 5'h19;
            192: spo = 5'h7;
            193: spo = 5'h6;
            194: spo = 5'h5;
            195: spo = 5'h4;
            196: spo = 5'h3;
            197: spo = 5'h2;
            198: spo = 5'h1;
            199: spo = 5'h0;
            200: spo = 5'h1f;
            201: spo = 5'h1e;
            202: spo = 5'h1d;
            203: spo = 5'h1c;
            204: spo = 5'h1b;
            205: spo = 5'h1a;
            206: spo = 5'h19;
            207: spo = 5'h18;
            208: spo = 5'h7;
            209: spo = 5'h6;
            210: spo = 5'h5;
            211: spo = 5'h4;
            212: spo = 5'h3;
            213: spo = 5'h2;
            214: spo = 5'h1;
            215: spo = 5'h0;
            216: spo = 5'h1f;
            217: spo = 5'h1e;
            218: spo = 5'h1d;
            219: spo = 5'h1c;
            220: spo = 5'h1b;
            221: spo = 5'h1a;
            222: spo = 5'h19;
            223: spo = 5'h18;
            224: spo = 5'h7;
            225: spo = 5'h6;
            226: spo = 5'h5;
            227: spo = 5'h4;
            228: spo = 5'h3;
            229: spo = 5'h2;
            230: spo = 5'h1;
            231: spo = 5'h0;
            232: spo = 5'h1f;
            233: spo = 5'h1e;
            234: spo = 5'h1d;
            235: spo = 5'h1c;
            236: spo = 5'h1b;
            237: spo = 5'h1a;
            238: spo = 5'h19;
            239: spo = 5'h18;
            240: spo = 5'h7;
            241: spo = 5'h6;
            242: spo = 5'h5;
            243: spo = 5'h4;
            244: spo = 5'h3;
            245: spo = 5'h2;
            246: spo = 5'h1;
            247: spo = 5'h0;
            248: spo = 5'h1f;
            249: spo = 5'h1e;
            250: spo = 5'h1d;
            251: spo = 5'h1c;
            252: spo = 5'h1b;
            253: spo = 5'h1a;
            254: spo = 5'h19;
            255: spo = 5'h18;
            default: spo = 5'h0;
		endcase
	end
endmodule