`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir3_1 
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

module dir3_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1d;
            001: spo = 5'h1d;
            002: spo = 5'h1c;
            003: spo = 5'h1c;
            004: spo = 5'h1b;
            005: spo = 5'h1b;
            006: spo = 5'h1a;
            007: spo = 5'h1a;
            008: spo = 5'h19;
            009: spo = 5'h19;
            010: spo = 5'h18;
            011: spo = 5'h18;
            012: spo = 5'h17;
            013: spo = 5'h17;
            014: spo = 5'h16;
            015: spo = 5'h16;
            016: spo = 5'h1e;
            017: spo = 5'h1d;
            018: spo = 5'h1d;
            019: spo = 5'h1c;
            020: spo = 5'h1c;
            021: spo = 5'h1b;
            022: spo = 5'h1b;
            023: spo = 5'h1a;
            024: spo = 5'h1a;
            025: spo = 5'h19;
            026: spo = 5'h19;
            027: spo = 5'h18;
            028: spo = 5'h18;
            029: spo = 5'h17;
            030: spo = 5'h17;
            031: spo = 5'h16;
            032: spo = 5'h1f;
            033: spo = 5'h1e;
            034: spo = 5'h1e;
            035: spo = 5'h1d;
            036: spo = 5'h1d;
            037: spo = 5'h1c;
            038: spo = 5'h1c;
            039: spo = 5'h1b;
            040: spo = 5'h1b;
            041: spo = 5'h1a;
            042: spo = 5'h1a;
            043: spo = 5'h19;
            044: spo = 5'h19;
            045: spo = 5'h18;
            046: spo = 5'h18;
            047: spo = 5'h17;
            048: spo = 5'h0;
            049: spo = 5'h1f;
            050: spo = 5'h1f;
            051: spo = 5'h1e;
            052: spo = 5'h1e;
            053: spo = 5'h1d;
            054: spo = 5'h1d;
            055: spo = 5'h1c;
            056: spo = 5'h1c;
            057: spo = 5'h1b;
            058: spo = 5'h1b;
            059: spo = 5'h1a;
            060: spo = 5'h1a;
            061: spo = 5'h19;
            062: spo = 5'h19;
            063: spo = 5'h18;
            064: spo = 5'h1;
            065: spo = 5'h0;
            066: spo = 5'h0;
            067: spo = 5'h1f;
            068: spo = 5'h1f;
            069: spo = 5'h1e;
            070: spo = 5'h1e;
            071: spo = 5'h1d;
            072: spo = 5'h1d;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1b;
            076: spo = 5'h1b;
            077: spo = 5'h1a;
            078: spo = 5'h1a;
            079: spo = 5'h19;
            080: spo = 5'h1;
            081: spo = 5'h1;
            082: spo = 5'h0;
            083: spo = 5'h0;
            084: spo = 5'h1f;
            085: spo = 5'h1f;
            086: spo = 5'h1e;
            087: spo = 5'h1e;
            088: spo = 5'h1d;
            089: spo = 5'h1d;
            090: spo = 5'h1c;
            091: spo = 5'h1c;
            092: spo = 5'h1b;
            093: spo = 5'h1b;
            094: spo = 5'h1a;
            095: spo = 5'h1a;
            096: spo = 5'h2;
            097: spo = 5'h2;
            098: spo = 5'h1;
            099: spo = 5'h1;
            100: spo = 5'h0;
            101: spo = 5'h0;
            102: spo = 5'h1f;
            103: spo = 5'h1f;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1d;
            107: spo = 5'h1d;
            108: spo = 5'h1c;
            109: spo = 5'h1c;
            110: spo = 5'h1b;
            111: spo = 5'h1b;
            112: spo = 5'h3;
            113: spo = 5'h3;
            114: spo = 5'h2;
            115: spo = 5'h2;
            116: spo = 5'h1;
            117: spo = 5'h1;
            118: spo = 5'h0;
            119: spo = 5'h0;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1e;
            124: spo = 5'h1d;
            125: spo = 5'h1d;
            126: spo = 5'h1c;
            127: spo = 5'h1c;
            128: spo = 5'h4;
            129: spo = 5'h3;
            130: spo = 5'h3;
            131: spo = 5'h2;
            132: spo = 5'h2;
            133: spo = 5'h1;
            134: spo = 5'h1;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1f;
            139: spo = 5'h1f;
            140: spo = 5'h1e;
            141: spo = 5'h1e;
            142: spo = 5'h1d;
            143: spo = 5'h1d;
            144: spo = 5'h5;
            145: spo = 5'h4;
            146: spo = 5'h4;
            147: spo = 5'h3;
            148: spo = 5'h3;
            149: spo = 5'h2;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h0;
            154: spo = 5'h0;
            155: spo = 5'h1f;
            156: spo = 5'h1f;
            157: spo = 5'h1e;
            158: spo = 5'h1e;
            159: spo = 5'h1d;
            160: spo = 5'h6;
            161: spo = 5'h5;
            162: spo = 5'h5;
            163: spo = 5'h4;
            164: spo = 5'h4;
            165: spo = 5'h3;
            166: spo = 5'h3;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h1;
            170: spo = 5'h1;
            171: spo = 5'h0;
            172: spo = 5'h0;
            173: spo = 5'h1f;
            174: spo = 5'h1f;
            175: spo = 5'h1e;
            176: spo = 5'h7;
            177: spo = 5'h6;
            178: spo = 5'h6;
            179: spo = 5'h5;
            180: spo = 5'h5;
            181: spo = 5'h4;
            182: spo = 5'h4;
            183: spo = 5'h3;
            184: spo = 5'h3;
            185: spo = 5'h2;
            186: spo = 5'h2;
            187: spo = 5'h1;
            188: spo = 5'h1;
            189: spo = 5'h0;
            190: spo = 5'h0;
            191: spo = 5'h1f;
            192: spo = 5'h7;
            193: spo = 5'h7;
            194: spo = 5'h6;
            195: spo = 5'h6;
            196: spo = 5'h5;
            197: spo = 5'h5;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h3;
            201: spo = 5'h3;
            202: spo = 5'h2;
            203: spo = 5'h2;
            204: spo = 5'h1;
            205: spo = 5'h1;
            206: spo = 5'h0;
            207: spo = 5'h0;
            208: spo = 5'h8;
            209: spo = 5'h8;
            210: spo = 5'h7;
            211: spo = 5'h7;
            212: spo = 5'h6;
            213: spo = 5'h6;
            214: spo = 5'h5;
            215: spo = 5'h5;
            216: spo = 5'h4;
            217: spo = 5'h4;
            218: spo = 5'h3;
            219: spo = 5'h3;
            220: spo = 5'h2;
            221: spo = 5'h2;
            222: spo = 5'h1;
            223: spo = 5'h1;
            224: spo = 5'h9;
            225: spo = 5'h9;
            226: spo = 5'h8;
            227: spo = 5'h8;
            228: spo = 5'h7;
            229: spo = 5'h7;
            230: spo = 5'h6;
            231: spo = 5'h6;
            232: spo = 5'h5;
            233: spo = 5'h5;
            234: spo = 5'h4;
            235: spo = 5'h4;
            236: spo = 5'h3;
            237: spo = 5'h3;
            238: spo = 5'h2;
            239: spo = 5'h2;
            240: spo = 5'ha;
            241: spo = 5'ha;
            242: spo = 5'h9;
            243: spo = 5'h9;
            244: spo = 5'h8;
            245: spo = 5'h8;
            246: spo = 5'h7;
            247: spo = 5'h7;
            248: spo = 5'h6;
            249: spo = 5'h6;
            250: spo = 5'h5;
            251: spo = 5'h5;
            252: spo = 5'h4;
            253: spo = 5'h4;
            254: spo = 5'h3;
            255: spo = 5'h3;
            default: spo = 5'h0;
		endcase
	end
endmodule