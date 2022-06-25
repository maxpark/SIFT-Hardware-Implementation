`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir33_1 
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

module dir33_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h15;
            001: spo = 5'h16;
            002: spo = 5'h16;
            003: spo = 5'h17;
            004: spo = 5'h17;
            005: spo = 5'h18;
            006: spo = 5'h18;
            007: spo = 5'h19;
            008: spo = 5'h19;
            009: spo = 5'h1a;
            010: spo = 5'h1a;
            011: spo = 5'h1b;
            012: spo = 5'h1b;
            013: spo = 5'h1c;
            014: spo = 5'h1c;
            015: spo = 5'h1d;
            016: spo = 5'h16;
            017: spo = 5'h16;
            018: spo = 5'h17;
            019: spo = 5'h17;
            020: spo = 5'h18;
            021: spo = 5'h18;
            022: spo = 5'h19;
            023: spo = 5'h19;
            024: spo = 5'h1a;
            025: spo = 5'h1a;
            026: spo = 5'h1b;
            027: spo = 5'h1b;
            028: spo = 5'h1c;
            029: spo = 5'h1c;
            030: spo = 5'h1d;
            031: spo = 5'h1d;
            032: spo = 5'h17;
            033: spo = 5'h17;
            034: spo = 5'h18;
            035: spo = 5'h18;
            036: spo = 5'h19;
            037: spo = 5'h19;
            038: spo = 5'h1a;
            039: spo = 5'h1a;
            040: spo = 5'h1b;
            041: spo = 5'h1b;
            042: spo = 5'h1c;
            043: spo = 5'h1c;
            044: spo = 5'h1d;
            045: spo = 5'h1d;
            046: spo = 5'h1e;
            047: spo = 5'h1e;
            048: spo = 5'h18;
            049: spo = 5'h18;
            050: spo = 5'h19;
            051: spo = 5'h19;
            052: spo = 5'h1a;
            053: spo = 5'h1a;
            054: spo = 5'h1b;
            055: spo = 5'h1b;
            056: spo = 5'h1c;
            057: spo = 5'h1c;
            058: spo = 5'h1d;
            059: spo = 5'h1d;
            060: spo = 5'h1e;
            061: spo = 5'h1e;
            062: spo = 5'h1f;
            063: spo = 5'h1f;
            064: spo = 5'h19;
            065: spo = 5'h19;
            066: spo = 5'h1a;
            067: spo = 5'h1a;
            068: spo = 5'h1b;
            069: spo = 5'h1b;
            070: spo = 5'h1c;
            071: spo = 5'h1c;
            072: spo = 5'h1d;
            073: spo = 5'h1d;
            074: spo = 5'h1e;
            075: spo = 5'h1e;
            076: spo = 5'h1f;
            077: spo = 5'h1f;
            078: spo = 5'h0;
            079: spo = 5'h0;
            080: spo = 5'h19;
            081: spo = 5'h1a;
            082: spo = 5'h1a;
            083: spo = 5'h1b;
            084: spo = 5'h1b;
            085: spo = 5'h1c;
            086: spo = 5'h1c;
            087: spo = 5'h1d;
            088: spo = 5'h1d;
            089: spo = 5'h1e;
            090: spo = 5'h1e;
            091: spo = 5'h1f;
            092: spo = 5'h1f;
            093: spo = 5'h0;
            094: spo = 5'h0;
            095: spo = 5'h1;
            096: spo = 5'h1a;
            097: spo = 5'h1b;
            098: spo = 5'h1b;
            099: spo = 5'h1c;
            100: spo = 5'h1c;
            101: spo = 5'h1d;
            102: spo = 5'h1d;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1f;
            106: spo = 5'h1f;
            107: spo = 5'h0;
            108: spo = 5'h0;
            109: spo = 5'h1;
            110: spo = 5'h1;
            111: spo = 5'h2;
            112: spo = 5'h1b;
            113: spo = 5'h1c;
            114: spo = 5'h1c;
            115: spo = 5'h1d;
            116: spo = 5'h1d;
            117: spo = 5'h1e;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h0;
            122: spo = 5'h0;
            123: spo = 5'h1;
            124: spo = 5'h1;
            125: spo = 5'h2;
            126: spo = 5'h2;
            127: spo = 5'h3;
            128: spo = 5'h1c;
            129: spo = 5'h1c;
            130: spo = 5'h1d;
            131: spo = 5'h1d;
            132: spo = 5'h1e;
            133: spo = 5'h1e;
            134: spo = 5'h1f;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h1;
            139: spo = 5'h2;
            140: spo = 5'h2;
            141: spo = 5'h3;
            142: spo = 5'h3;
            143: spo = 5'h4;
            144: spo = 5'h1d;
            145: spo = 5'h1d;
            146: spo = 5'h1e;
            147: spo = 5'h1e;
            148: spo = 5'h1f;
            149: spo = 5'h1f;
            150: spo = 5'h0;
            151: spo = 5'h0;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h2;
            156: spo = 5'h3;
            157: spo = 5'h3;
            158: spo = 5'h4;
            159: spo = 5'h4;
            160: spo = 5'h1e;
            161: spo = 5'h1e;
            162: spo = 5'h1f;
            163: spo = 5'h1f;
            164: spo = 5'h0;
            165: spo = 5'h0;
            166: spo = 5'h1;
            167: spo = 5'h1;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h3;
            171: spo = 5'h3;
            172: spo = 5'h4;
            173: spo = 5'h4;
            174: spo = 5'h5;
            175: spo = 5'h5;
            176: spo = 5'h1f;
            177: spo = 5'h1f;
            178: spo = 5'h0;
            179: spo = 5'h0;
            180: spo = 5'h1;
            181: spo = 5'h1;
            182: spo = 5'h2;
            183: spo = 5'h2;
            184: spo = 5'h3;
            185: spo = 5'h3;
            186: spo = 5'h4;
            187: spo = 5'h4;
            188: spo = 5'h5;
            189: spo = 5'h5;
            190: spo = 5'h6;
            191: spo = 5'h6;
            192: spo = 5'h1f;
            193: spo = 5'h0;
            194: spo = 5'h0;
            195: spo = 5'h1;
            196: spo = 5'h1;
            197: spo = 5'h2;
            198: spo = 5'h2;
            199: spo = 5'h3;
            200: spo = 5'h3;
            201: spo = 5'h4;
            202: spo = 5'h4;
            203: spo = 5'h5;
            204: spo = 5'h5;
            205: spo = 5'h6;
            206: spo = 5'h6;
            207: spo = 5'h7;
            208: spo = 5'h0;
            209: spo = 5'h1;
            210: spo = 5'h1;
            211: spo = 5'h2;
            212: spo = 5'h2;
            213: spo = 5'h3;
            214: spo = 5'h3;
            215: spo = 5'h4;
            216: spo = 5'h4;
            217: spo = 5'h5;
            218: spo = 5'h5;
            219: spo = 5'h6;
            220: spo = 5'h6;
            221: spo = 5'h7;
            222: spo = 5'h7;
            223: spo = 5'h8;
            224: spo = 5'h1;
            225: spo = 5'h2;
            226: spo = 5'h2;
            227: spo = 5'h3;
            228: spo = 5'h3;
            229: spo = 5'h4;
            230: spo = 5'h4;
            231: spo = 5'h5;
            232: spo = 5'h5;
            233: spo = 5'h6;
            234: spo = 5'h6;
            235: spo = 5'h7;
            236: spo = 5'h7;
            237: spo = 5'h8;
            238: spo = 5'h8;
            239: spo = 5'h9;
            240: spo = 5'h2;
            241: spo = 5'h3;
            242: spo = 5'h3;
            243: spo = 5'h4;
            244: spo = 5'h4;
            245: spo = 5'h5;
            246: spo = 5'h5;
            247: spo = 5'h6;
            248: spo = 5'h6;
            249: spo = 5'h7;
            250: spo = 5'h7;
            251: spo = 5'h8;
            252: spo = 5'h8;
            253: spo = 5'h9;
            254: spo = 5'h9;
            255: spo = 5'ha;
            default: spo = 5'h0;
		endcase
	end
endmodule