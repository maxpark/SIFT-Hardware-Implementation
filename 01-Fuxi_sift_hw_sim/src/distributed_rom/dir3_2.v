`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir3_2 
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

module dir3_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h15;
            001: spo = 5'h16;
            002: spo = 5'h17;
            003: spo = 5'h18;
            004: spo = 5'h19;
            005: spo = 5'h19;
            006: spo = 5'h1a;
            007: spo = 5'h1b;
            008: spo = 5'h1c;
            009: spo = 5'h1d;
            010: spo = 5'h1e;
            011: spo = 5'h1f;
            012: spo = 5'h1f;
            013: spo = 5'h0;
            014: spo = 5'h1;
            015: spo = 5'h2;
            016: spo = 5'h16;
            017: spo = 5'h16;
            018: spo = 5'h17;
            019: spo = 5'h18;
            020: spo = 5'h19;
            021: spo = 5'h1a;
            022: spo = 5'h1b;
            023: spo = 5'h1c;
            024: spo = 5'h1d;
            025: spo = 5'h1d;
            026: spo = 5'h1e;
            027: spo = 5'h1f;
            028: spo = 5'h0;
            029: spo = 5'h1;
            030: spo = 5'h2;
            031: spo = 5'h3;
            032: spo = 5'h16;
            033: spo = 5'h17;
            034: spo = 5'h18;
            035: spo = 5'h19;
            036: spo = 5'h1a;
            037: spo = 5'h1a;
            038: spo = 5'h1b;
            039: spo = 5'h1c;
            040: spo = 5'h1d;
            041: spo = 5'h1e;
            042: spo = 5'h1f;
            043: spo = 5'h0;
            044: spo = 5'h0;
            045: spo = 5'h1;
            046: spo = 5'h2;
            047: spo = 5'h3;
            048: spo = 5'h17;
            049: spo = 5'h17;
            050: spo = 5'h18;
            051: spo = 5'h19;
            052: spo = 5'h1a;
            053: spo = 5'h1b;
            054: spo = 5'h1c;
            055: spo = 5'h1d;
            056: spo = 5'h1e;
            057: spo = 5'h1e;
            058: spo = 5'h1f;
            059: spo = 5'h0;
            060: spo = 5'h1;
            061: spo = 5'h2;
            062: spo = 5'h3;
            063: spo = 5'h4;
            064: spo = 5'h17;
            065: spo = 5'h18;
            066: spo = 5'h19;
            067: spo = 5'h1a;
            068: spo = 5'h1b;
            069: spo = 5'h1b;
            070: spo = 5'h1c;
            071: spo = 5'h1d;
            072: spo = 5'h1e;
            073: spo = 5'h1f;
            074: spo = 5'h0;
            075: spo = 5'h1;
            076: spo = 5'h1;
            077: spo = 5'h2;
            078: spo = 5'h3;
            079: spo = 5'h4;
            080: spo = 5'h18;
            081: spo = 5'h18;
            082: spo = 5'h19;
            083: spo = 5'h1a;
            084: spo = 5'h1b;
            085: spo = 5'h1c;
            086: spo = 5'h1d;
            087: spo = 5'h1e;
            088: spo = 5'h1f;
            089: spo = 5'h1f;
            090: spo = 5'h0;
            091: spo = 5'h1;
            092: spo = 5'h2;
            093: spo = 5'h3;
            094: spo = 5'h4;
            095: spo = 5'h5;
            096: spo = 5'h18;
            097: spo = 5'h19;
            098: spo = 5'h1a;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1c;
            102: spo = 5'h1d;
            103: spo = 5'h1e;
            104: spo = 5'h1f;
            105: spo = 5'h0;
            106: spo = 5'h1;
            107: spo = 5'h2;
            108: spo = 5'h2;
            109: spo = 5'h3;
            110: spo = 5'h4;
            111: spo = 5'h5;
            112: spo = 5'h19;
            113: spo = 5'h19;
            114: spo = 5'h1a;
            115: spo = 5'h1b;
            116: spo = 5'h1c;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h0;
            122: spo = 5'h1;
            123: spo = 5'h2;
            124: spo = 5'h3;
            125: spo = 5'h4;
            126: spo = 5'h5;
            127: spo = 5'h6;
            128: spo = 5'h19;
            129: spo = 5'h1a;
            130: spo = 5'h1b;
            131: spo = 5'h1c;
            132: spo = 5'h1d;
            133: spo = 5'h1d;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h3;
            140: spo = 5'h3;
            141: spo = 5'h4;
            142: spo = 5'h5;
            143: spo = 5'h6;
            144: spo = 5'h1a;
            145: spo = 5'h1a;
            146: spo = 5'h1b;
            147: spo = 5'h1c;
            148: spo = 5'h1d;
            149: spo = 5'h1e;
            150: spo = 5'h1f;
            151: spo = 5'h0;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h4;
            157: spo = 5'h5;
            158: spo = 5'h6;
            159: spo = 5'h7;
            160: spo = 5'h1a;
            161: spo = 5'h1b;
            162: spo = 5'h1c;
            163: spo = 5'h1d;
            164: spo = 5'h1e;
            165: spo = 5'h1e;
            166: spo = 5'h1f;
            167: spo = 5'h0;
            168: spo = 5'h1;
            169: spo = 5'h2;
            170: spo = 5'h3;
            171: spo = 5'h4;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h6;
            175: spo = 5'h7;
            176: spo = 5'h1b;
            177: spo = 5'h1b;
            178: spo = 5'h1c;
            179: spo = 5'h1d;
            180: spo = 5'h1e;
            181: spo = 5'h1f;
            182: spo = 5'h0;
            183: spo = 5'h1;
            184: spo = 5'h1;
            185: spo = 5'h2;
            186: spo = 5'h3;
            187: spo = 5'h4;
            188: spo = 5'h5;
            189: spo = 5'h6;
            190: spo = 5'h7;
            191: spo = 5'h8;
            192: spo = 5'h1b;
            193: spo = 5'h1c;
            194: spo = 5'h1d;
            195: spo = 5'h1e;
            196: spo = 5'h1f;
            197: spo = 5'h1f;
            198: spo = 5'h0;
            199: spo = 5'h1;
            200: spo = 5'h2;
            201: spo = 5'h3;
            202: spo = 5'h4;
            203: spo = 5'h5;
            204: spo = 5'h5;
            205: spo = 5'h6;
            206: spo = 5'h7;
            207: spo = 5'h8;
            208: spo = 5'h1c;
            209: spo = 5'h1c;
            210: spo = 5'h1d;
            211: spo = 5'h1e;
            212: spo = 5'h1f;
            213: spo = 5'h0;
            214: spo = 5'h1;
            215: spo = 5'h2;
            216: spo = 5'h2;
            217: spo = 5'h3;
            218: spo = 5'h4;
            219: spo = 5'h5;
            220: spo = 5'h6;
            221: spo = 5'h7;
            222: spo = 5'h8;
            223: spo = 5'h9;
            224: spo = 5'h1c;
            225: spo = 5'h1d;
            226: spo = 5'h1e;
            227: spo = 5'h1f;
            228: spo = 5'h0;
            229: spo = 5'h0;
            230: spo = 5'h1;
            231: spo = 5'h2;
            232: spo = 5'h3;
            233: spo = 5'h4;
            234: spo = 5'h5;
            235: spo = 5'h6;
            236: spo = 5'h6;
            237: spo = 5'h7;
            238: spo = 5'h8;
            239: spo = 5'h9;
            240: spo = 5'h1d;
            241: spo = 5'h1d;
            242: spo = 5'h1e;
            243: spo = 5'h1f;
            244: spo = 5'h0;
            245: spo = 5'h1;
            246: spo = 5'h2;
            247: spo = 5'h3;
            248: spo = 5'h3;
            249: spo = 5'h4;
            250: spo = 5'h5;
            251: spo = 5'h6;
            252: spo = 5'h7;
            253: spo = 5'h8;
            254: spo = 5'h9;
            255: spo = 5'ha;
            default: spo = 5'h0;
		endcase
	end
endmodule