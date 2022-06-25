`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir6_1 
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

module dir6_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h3;
            001: spo = 5'h2;
            002: spo = 5'h1;
            003: spo = 5'h0;
            004: spo = 5'h1f;
            005: spo = 5'h1f;
            006: spo = 5'h1e;
            007: spo = 5'h1d;
            008: spo = 5'h1c;
            009: spo = 5'h1b;
            010: spo = 5'h1a;
            011: spo = 5'h19;
            012: spo = 5'h19;
            013: spo = 5'h18;
            014: spo = 5'h17;
            015: spo = 5'h16;
            016: spo = 5'h3;
            017: spo = 5'h3;
            018: spo = 5'h2;
            019: spo = 5'h1;
            020: spo = 5'h0;
            021: spo = 5'h1f;
            022: spo = 5'h1e;
            023: spo = 5'h1d;
            024: spo = 5'h1c;
            025: spo = 5'h1c;
            026: spo = 5'h1b;
            027: spo = 5'h1a;
            028: spo = 5'h19;
            029: spo = 5'h18;
            030: spo = 5'h17;
            031: spo = 5'h16;
            032: spo = 5'h4;
            033: spo = 5'h3;
            034: spo = 5'h2;
            035: spo = 5'h1;
            036: spo = 5'h0;
            037: spo = 5'h0;
            038: spo = 5'h1f;
            039: spo = 5'h1e;
            040: spo = 5'h1d;
            041: spo = 5'h1c;
            042: spo = 5'h1b;
            043: spo = 5'h1a;
            044: spo = 5'h1a;
            045: spo = 5'h19;
            046: spo = 5'h18;
            047: spo = 5'h17;
            048: spo = 5'h4;
            049: spo = 5'h4;
            050: spo = 5'h3;
            051: spo = 5'h2;
            052: spo = 5'h1;
            053: spo = 5'h0;
            054: spo = 5'h1f;
            055: spo = 5'h1e;
            056: spo = 5'h1d;
            057: spo = 5'h1d;
            058: spo = 5'h1c;
            059: spo = 5'h1b;
            060: spo = 5'h1a;
            061: spo = 5'h19;
            062: spo = 5'h18;
            063: spo = 5'h17;
            064: spo = 5'h5;
            065: spo = 5'h4;
            066: spo = 5'h3;
            067: spo = 5'h2;
            068: spo = 5'h1;
            069: spo = 5'h1;
            070: spo = 5'h0;
            071: spo = 5'h1f;
            072: spo = 5'h1e;
            073: spo = 5'h1d;
            074: spo = 5'h1c;
            075: spo = 5'h1b;
            076: spo = 5'h1b;
            077: spo = 5'h1a;
            078: spo = 5'h19;
            079: spo = 5'h18;
            080: spo = 5'h5;
            081: spo = 5'h5;
            082: spo = 5'h4;
            083: spo = 5'h3;
            084: spo = 5'h2;
            085: spo = 5'h1;
            086: spo = 5'h0;
            087: spo = 5'h1f;
            088: spo = 5'h1e;
            089: spo = 5'h1e;
            090: spo = 5'h1d;
            091: spo = 5'h1c;
            092: spo = 5'h1b;
            093: spo = 5'h1a;
            094: spo = 5'h19;
            095: spo = 5'h18;
            096: spo = 5'h6;
            097: spo = 5'h5;
            098: spo = 5'h4;
            099: spo = 5'h3;
            100: spo = 5'h2;
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
            112: spo = 5'h6;
            113: spo = 5'h6;
            114: spo = 5'h5;
            115: spo = 5'h4;
            116: spo = 5'h3;
            117: spo = 5'h2;
            118: spo = 5'h1;
            119: spo = 5'h0;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1d;
            124: spo = 5'h1c;
            125: spo = 5'h1b;
            126: spo = 5'h1a;
            127: spo = 5'h19;
            128: spo = 5'h7;
            129: spo = 5'h6;
            130: spo = 5'h5;
            131: spo = 5'h4;
            132: spo = 5'h3;
            133: spo = 5'h3;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1d;
            140: spo = 5'h1d;
            141: spo = 5'h1c;
            142: spo = 5'h1b;
            143: spo = 5'h1a;
            144: spo = 5'h7;
            145: spo = 5'h7;
            146: spo = 5'h6;
            147: spo = 5'h5;
            148: spo = 5'h4;
            149: spo = 5'h3;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h0;
            154: spo = 5'h1f;
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
            172: spo = 5'h1e;
            173: spo = 5'h1d;
            174: spo = 5'h1c;
            175: spo = 5'h1b;
            176: spo = 5'h8;
            177: spo = 5'h8;
            178: spo = 5'h7;
            179: spo = 5'h6;
            180: spo = 5'h5;
            181: spo = 5'h4;
            182: spo = 5'h3;
            183: spo = 5'h2;
            184: spo = 5'h2;
            185: spo = 5'h1;
            186: spo = 5'h0;
            187: spo = 5'h1f;
            188: spo = 5'h1e;
            189: spo = 5'h1d;
            190: spo = 5'h1c;
            191: spo = 5'h1b;
            192: spo = 5'h9;
            193: spo = 5'h8;
            194: spo = 5'h7;
            195: spo = 5'h6;
            196: spo = 5'h5;
            197: spo = 5'h5;
            198: spo = 5'h4;
            199: spo = 5'h3;
            200: spo = 5'h2;
            201: spo = 5'h1;
            202: spo = 5'h0;
            203: spo = 5'h1f;
            204: spo = 5'h1f;
            205: spo = 5'h1e;
            206: spo = 5'h1d;
            207: spo = 5'h1c;
            208: spo = 5'h9;
            209: spo = 5'h9;
            210: spo = 5'h8;
            211: spo = 5'h7;
            212: spo = 5'h6;
            213: spo = 5'h5;
            214: spo = 5'h4;
            215: spo = 5'h3;
            216: spo = 5'h3;
            217: spo = 5'h2;
            218: spo = 5'h1;
            219: spo = 5'h0;
            220: spo = 5'h1f;
            221: spo = 5'h1e;
            222: spo = 5'h1d;
            223: spo = 5'h1c;
            224: spo = 5'ha;
            225: spo = 5'h9;
            226: spo = 5'h8;
            227: spo = 5'h7;
            228: spo = 5'h6;
            229: spo = 5'h6;
            230: spo = 5'h5;
            231: spo = 5'h4;
            232: spo = 5'h3;
            233: spo = 5'h2;
            234: spo = 5'h1;
            235: spo = 5'h0;
            236: spo = 5'h0;
            237: spo = 5'h1f;
            238: spo = 5'h1e;
            239: spo = 5'h1d;
            240: spo = 5'ha;
            241: spo = 5'ha;
            242: spo = 5'h9;
            243: spo = 5'h8;
            244: spo = 5'h7;
            245: spo = 5'h6;
            246: spo = 5'h5;
            247: spo = 5'h4;
            248: spo = 5'h4;
            249: spo = 5'h3;
            250: spo = 5'h2;
            251: spo = 5'h1;
            252: spo = 5'h0;
            253: spo = 5'h1f;
            254: spo = 5'h1e;
            255: spo = 5'h1d;
            default: spo = 5'h0;
		endcase
	end
endmodule