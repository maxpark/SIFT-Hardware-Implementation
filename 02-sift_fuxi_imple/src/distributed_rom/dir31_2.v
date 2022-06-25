`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir31_2 
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

module dir31_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1;
            001: spo = 5'h2;
            002: spo = 5'h2;
            003: spo = 5'h3;
            004: spo = 5'h4;
            005: spo = 5'h4;
            006: spo = 5'h5;
            007: spo = 5'h5;
            008: spo = 5'h6;
            009: spo = 5'h7;
            010: spo = 5'h7;
            011: spo = 5'h8;
            012: spo = 5'h9;
            013: spo = 5'h9;
            014: spo = 5'ha;
            015: spo = 5'hb;
            016: spo = 5'h0;
            017: spo = 5'h1;
            018: spo = 5'h2;
            019: spo = 5'h2;
            020: spo = 5'h3;
            021: spo = 5'h3;
            022: spo = 5'h4;
            023: spo = 5'h5;
            024: spo = 5'h5;
            025: spo = 5'h6;
            026: spo = 5'h7;
            027: spo = 5'h7;
            028: spo = 5'h8;
            029: spo = 5'h9;
            030: spo = 5'h9;
            031: spo = 5'ha;
            032: spo = 5'h1f;
            033: spo = 5'h0;
            034: spo = 5'h1;
            035: spo = 5'h1;
            036: spo = 5'h2;
            037: spo = 5'h3;
            038: spo = 5'h3;
            039: spo = 5'h4;
            040: spo = 5'h5;
            041: spo = 5'h5;
            042: spo = 5'h6;
            043: spo = 5'h7;
            044: spo = 5'h7;
            045: spo = 5'h8;
            046: spo = 5'h8;
            047: spo = 5'h9;
            048: spo = 5'h1f;
            049: spo = 5'h1f;
            050: spo = 5'h0;
            051: spo = 5'h1;
            052: spo = 5'h1;
            053: spo = 5'h2;
            054: spo = 5'h3;
            055: spo = 5'h3;
            056: spo = 5'h4;
            057: spo = 5'h4;
            058: spo = 5'h5;
            059: spo = 5'h6;
            060: spo = 5'h6;
            061: spo = 5'h7;
            062: spo = 5'h8;
            063: spo = 5'h8;
            064: spo = 5'h1e;
            065: spo = 5'h1f;
            066: spo = 5'h1f;
            067: spo = 5'h0;
            068: spo = 5'h0;
            069: spo = 5'h1;
            070: spo = 5'h2;
            071: spo = 5'h2;
            072: spo = 5'h3;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h5;
            076: spo = 5'h6;
            077: spo = 5'h6;
            078: spo = 5'h7;
            079: spo = 5'h8;
            080: spo = 5'h1d;
            081: spo = 5'h1e;
            082: spo = 5'h1e;
            083: spo = 5'h1f;
            084: spo = 5'h0;
            085: spo = 5'h0;
            086: spo = 5'h1;
            087: spo = 5'h2;
            088: spo = 5'h2;
            089: spo = 5'h3;
            090: spo = 5'h4;
            091: spo = 5'h4;
            092: spo = 5'h5;
            093: spo = 5'h6;
            094: spo = 5'h6;
            095: spo = 5'h7;
            096: spo = 5'h1c;
            097: spo = 5'h1d;
            098: spo = 5'h1e;
            099: spo = 5'h1e;
            100: spo = 5'h1f;
            101: spo = 5'h0;
            102: spo = 5'h0;
            103: spo = 5'h1;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h3;
            107: spo = 5'h3;
            108: spo = 5'h4;
            109: spo = 5'h5;
            110: spo = 5'h5;
            111: spo = 5'h6;
            112: spo = 5'h1c;
            113: spo = 5'h1c;
            114: spo = 5'h1d;
            115: spo = 5'h1e;
            116: spo = 5'h1e;
            117: spo = 5'h1f;
            118: spo = 5'h1f;
            119: spo = 5'h0;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h3;
            124: spo = 5'h3;
            125: spo = 5'h4;
            126: spo = 5'h5;
            127: spo = 5'h5;
            128: spo = 5'h1b;
            129: spo = 5'h1c;
            130: spo = 5'h1c;
            131: spo = 5'h1d;
            132: spo = 5'h1d;
            133: spo = 5'h1e;
            134: spo = 5'h1f;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h1;
            139: spo = 5'h2;
            140: spo = 5'h3;
            141: spo = 5'h3;
            142: spo = 5'h4;
            143: spo = 5'h4;
            144: spo = 5'h1a;
            145: spo = 5'h1b;
            146: spo = 5'h1b;
            147: spo = 5'h1c;
            148: spo = 5'h1d;
            149: spo = 5'h1d;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h0;
            154: spo = 5'h1;
            155: spo = 5'h1;
            156: spo = 5'h2;
            157: spo = 5'h2;
            158: spo = 5'h3;
            159: spo = 5'h4;
            160: spo = 5'h19;
            161: spo = 5'h1a;
            162: spo = 5'h1b;
            163: spo = 5'h1b;
            164: spo = 5'h1c;
            165: spo = 5'h1d;
            166: spo = 5'h1d;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1f;
            170: spo = 5'h0;
            171: spo = 5'h0;
            172: spo = 5'h1;
            173: spo = 5'h2;
            174: spo = 5'h2;
            175: spo = 5'h3;
            176: spo = 5'h19;
            177: spo = 5'h19;
            178: spo = 5'h1a;
            179: spo = 5'h1a;
            180: spo = 5'h1b;
            181: spo = 5'h1c;
            182: spo = 5'h1c;
            183: spo = 5'h1d;
            184: spo = 5'h1e;
            185: spo = 5'h1e;
            186: spo = 5'h1f;
            187: spo = 5'h0;
            188: spo = 5'h0;
            189: spo = 5'h1;
            190: spo = 5'h2;
            191: spo = 5'h2;
            192: spo = 5'h18;
            193: spo = 5'h18;
            194: spo = 5'h19;
            195: spo = 5'h1a;
            196: spo = 5'h1a;
            197: spo = 5'h1b;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1d;
            201: spo = 5'h1e;
            202: spo = 5'h1e;
            203: spo = 5'h1f;
            204: spo = 5'h0;
            205: spo = 5'h0;
            206: spo = 5'h1;
            207: spo = 5'h1;
            208: spo = 5'h17;
            209: spo = 5'h18;
            210: spo = 5'h18;
            211: spo = 5'h19;
            212: spo = 5'h1a;
            213: spo = 5'h1a;
            214: spo = 5'h1b;
            215: spo = 5'h1c;
            216: spo = 5'h1c;
            217: spo = 5'h1d;
            218: spo = 5'h1d;
            219: spo = 5'h1e;
            220: spo = 5'h1f;
            221: spo = 5'h1f;
            222: spo = 5'h0;
            223: spo = 5'h1;
            224: spo = 5'h16;
            225: spo = 5'h17;
            226: spo = 5'h18;
            227: spo = 5'h18;
            228: spo = 5'h19;
            229: spo = 5'h19;
            230: spo = 5'h1a;
            231: spo = 5'h1b;
            232: spo = 5'h1b;
            233: spo = 5'h1c;
            234: spo = 5'h1d;
            235: spo = 5'h1d;
            236: spo = 5'h1e;
            237: spo = 5'h1f;
            238: spo = 5'h1f;
            239: spo = 5'h0;
            240: spo = 5'h15;
            241: spo = 5'h16;
            242: spo = 5'h17;
            243: spo = 5'h17;
            244: spo = 5'h18;
            245: spo = 5'h19;
            246: spo = 5'h19;
            247: spo = 5'h1a;
            248: spo = 5'h1b;
            249: spo = 5'h1b;
            250: spo = 5'h1c;
            251: spo = 5'h1d;
            252: spo = 5'h1d;
            253: spo = 5'h1e;
            254: spo = 5'h1e;
            255: spo = 5'h1f;
            default: spo = 5'h0;
		endcase
	end
endmodule