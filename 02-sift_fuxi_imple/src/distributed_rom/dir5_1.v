`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir5_1 
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

module dir5_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1;
            001: spo = 5'h0;
            002: spo = 5'h1f;
            003: spo = 5'h1f;
            004: spo = 5'h1e;
            005: spo = 5'h1d;
            006: spo = 5'h1c;
            007: spo = 5'h1c;
            008: spo = 5'h1b;
            009: spo = 5'h1a;
            010: spo = 5'h19;
            011: spo = 5'h19;
            012: spo = 5'h18;
            013: spo = 5'h17;
            014: spo = 5'h16;
            015: spo = 5'h15;
            016: spo = 5'h2;
            017: spo = 5'h1;
            018: spo = 5'h0;
            019: spo = 5'h1f;
            020: spo = 5'h1f;
            021: spo = 5'h1e;
            022: spo = 5'h1d;
            023: spo = 5'h1c;
            024: spo = 5'h1c;
            025: spo = 5'h1b;
            026: spo = 5'h1a;
            027: spo = 5'h19;
            028: spo = 5'h18;
            029: spo = 5'h18;
            030: spo = 5'h17;
            031: spo = 5'h16;
            032: spo = 5'h2;
            033: spo = 5'h2;
            034: spo = 5'h1;
            035: spo = 5'h0;
            036: spo = 5'h1f;
            037: spo = 5'h1e;
            038: spo = 5'h1e;
            039: spo = 5'h1d;
            040: spo = 5'h1c;
            041: spo = 5'h1b;
            042: spo = 5'h1b;
            043: spo = 5'h1a;
            044: spo = 5'h19;
            045: spo = 5'h18;
            046: spo = 5'h18;
            047: spo = 5'h17;
            048: spo = 5'h3;
            049: spo = 5'h2;
            050: spo = 5'h1;
            051: spo = 5'h1;
            052: spo = 5'h0;
            053: spo = 5'h1f;
            054: spo = 5'h1e;
            055: spo = 5'h1e;
            056: spo = 5'h1d;
            057: spo = 5'h1c;
            058: spo = 5'h1b;
            059: spo = 5'h1a;
            060: spo = 5'h1a;
            061: spo = 5'h19;
            062: spo = 5'h18;
            063: spo = 5'h17;
            064: spo = 5'h4;
            065: spo = 5'h3;
            066: spo = 5'h2;
            067: spo = 5'h1;
            068: spo = 5'h0;
            069: spo = 5'h0;
            070: spo = 5'h1f;
            071: spo = 5'h1e;
            072: spo = 5'h1d;
            073: spo = 5'h1d;
            074: spo = 5'h1c;
            075: spo = 5'h1b;
            076: spo = 5'h1a;
            077: spo = 5'h1a;
            078: spo = 5'h19;
            079: spo = 5'h18;
            080: spo = 5'h4;
            081: spo = 5'h3;
            082: spo = 5'h3;
            083: spo = 5'h2;
            084: spo = 5'h1;
            085: spo = 5'h0;
            086: spo = 5'h0;
            087: spo = 5'h1f;
            088: spo = 5'h1e;
            089: spo = 5'h1d;
            090: spo = 5'h1d;
            091: spo = 5'h1c;
            092: spo = 5'h1b;
            093: spo = 5'h1a;
            094: spo = 5'h19;
            095: spo = 5'h19;
            096: spo = 5'h5;
            097: spo = 5'h4;
            098: spo = 5'h3;
            099: spo = 5'h3;
            100: spo = 5'h2;
            101: spo = 5'h1;
            102: spo = 5'h0;
            103: spo = 5'h1f;
            104: spo = 5'h1f;
            105: spo = 5'h1e;
            106: spo = 5'h1d;
            107: spo = 5'h1c;
            108: spo = 5'h1c;
            109: spo = 5'h1b;
            110: spo = 5'h1a;
            111: spo = 5'h19;
            112: spo = 5'h5;
            113: spo = 5'h5;
            114: spo = 5'h4;
            115: spo = 5'h3;
            116: spo = 5'h2;
            117: spo = 5'h2;
            118: spo = 5'h1;
            119: spo = 5'h0;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1d;
            124: spo = 5'h1c;
            125: spo = 5'h1c;
            126: spo = 5'h1b;
            127: spo = 5'h1a;
            128: spo = 5'h6;
            129: spo = 5'h5;
            130: spo = 5'h5;
            131: spo = 5'h4;
            132: spo = 5'h3;
            133: spo = 5'h2;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1e;
            140: spo = 5'h1d;
            141: spo = 5'h1c;
            142: spo = 5'h1b;
            143: spo = 5'h1b;
            144: spo = 5'h7;
            145: spo = 5'h6;
            146: spo = 5'h5;
            147: spo = 5'h4;
            148: spo = 5'h4;
            149: spo = 5'h3;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h0;
            154: spo = 5'h1f;
            155: spo = 5'h1e;
            156: spo = 5'h1e;
            157: spo = 5'h1d;
            158: spo = 5'h1c;
            159: spo = 5'h1b;
            160: spo = 5'h7;
            161: spo = 5'h7;
            162: spo = 5'h6;
            163: spo = 5'h5;
            164: spo = 5'h4;
            165: spo = 5'h4;
            166: spo = 5'h3;
            167: spo = 5'h2;
            168: spo = 5'h1;
            169: spo = 5'h1;
            170: spo = 5'h0;
            171: spo = 5'h1f;
            172: spo = 5'h1e;
            173: spo = 5'h1d;
            174: spo = 5'h1d;
            175: spo = 5'h1c;
            176: spo = 5'h8;
            177: spo = 5'h7;
            178: spo = 5'h7;
            179: spo = 5'h6;
            180: spo = 5'h5;
            181: spo = 5'h4;
            182: spo = 5'h3;
            183: spo = 5'h3;
            184: spo = 5'h2;
            185: spo = 5'h1;
            186: spo = 5'h0;
            187: spo = 5'h0;
            188: spo = 5'h1f;
            189: spo = 5'h1e;
            190: spo = 5'h1d;
            191: spo = 5'h1d;
            192: spo = 5'h9;
            193: spo = 5'h8;
            194: spo = 5'h7;
            195: spo = 5'h6;
            196: spo = 5'h6;
            197: spo = 5'h5;
            198: spo = 5'h4;
            199: spo = 5'h3;
            200: spo = 5'h3;
            201: spo = 5'h2;
            202: spo = 5'h1;
            203: spo = 5'h0;
            204: spo = 5'h0;
            205: spo = 5'h1f;
            206: spo = 5'h1e;
            207: spo = 5'h1d;
            208: spo = 5'h9;
            209: spo = 5'h9;
            210: spo = 5'h8;
            211: spo = 5'h7;
            212: spo = 5'h6;
            213: spo = 5'h6;
            214: spo = 5'h5;
            215: spo = 5'h4;
            216: spo = 5'h3;
            217: spo = 5'h2;
            218: spo = 5'h2;
            219: spo = 5'h1;
            220: spo = 5'h0;
            221: spo = 5'h1f;
            222: spo = 5'h1f;
            223: spo = 5'h1e;
            224: spo = 5'ha;
            225: spo = 5'h9;
            226: spo = 5'h8;
            227: spo = 5'h8;
            228: spo = 5'h7;
            229: spo = 5'h6;
            230: spo = 5'h5;
            231: spo = 5'h5;
            232: spo = 5'h4;
            233: spo = 5'h3;
            234: spo = 5'h2;
            235: spo = 5'h2;
            236: spo = 5'h1;
            237: spo = 5'h0;
            238: spo = 5'h1f;
            239: spo = 5'h1e;
            240: spo = 5'hb;
            241: spo = 5'ha;
            242: spo = 5'h9;
            243: spo = 5'h8;
            244: spo = 5'h8;
            245: spo = 5'h7;
            246: spo = 5'h6;
            247: spo = 5'h5;
            248: spo = 5'h4;
            249: spo = 5'h4;
            250: spo = 5'h3;
            251: spo = 5'h2;
            252: spo = 5'h1;
            253: spo = 5'h1;
            254: spo = 5'h0;
            255: spo = 5'h1f;
            default: spo = 5'h0;
		endcase
	end
endmodule