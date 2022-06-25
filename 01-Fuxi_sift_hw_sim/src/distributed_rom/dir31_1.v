`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir31_1 
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

module dir31_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h15;
            001: spo = 5'h15;
            002: spo = 5'h16;
            003: spo = 5'h17;
            004: spo = 5'h18;
            005: spo = 5'h19;
            006: spo = 5'h19;
            007: spo = 5'h1a;
            008: spo = 5'h1b;
            009: spo = 5'h1c;
            010: spo = 5'h1c;
            011: spo = 5'h1d;
            012: spo = 5'h1e;
            013: spo = 5'h1f;
            014: spo = 5'h1f;
            015: spo = 5'h0;
            016: spo = 5'h15;
            017: spo = 5'h16;
            018: spo = 5'h17;
            019: spo = 5'h18;
            020: spo = 5'h18;
            021: spo = 5'h19;
            022: spo = 5'h1a;
            023: spo = 5'h1b;
            024: spo = 5'h1c;
            025: spo = 5'h1c;
            026: spo = 5'h1d;
            027: spo = 5'h1e;
            028: spo = 5'h1f;
            029: spo = 5'h1f;
            030: spo = 5'h0;
            031: spo = 5'h1;
            032: spo = 5'h16;
            033: spo = 5'h17;
            034: spo = 5'h18;
            035: spo = 5'h18;
            036: spo = 5'h19;
            037: spo = 5'h1a;
            038: spo = 5'h1b;
            039: spo = 5'h1b;
            040: spo = 5'h1c;
            041: spo = 5'h1d;
            042: spo = 5'h1e;
            043: spo = 5'h1e;
            044: spo = 5'h1f;
            045: spo = 5'h0;
            046: spo = 5'h1;
            047: spo = 5'h2;
            048: spo = 5'h17;
            049: spo = 5'h17;
            050: spo = 5'h18;
            051: spo = 5'h19;
            052: spo = 5'h1a;
            053: spo = 5'h1a;
            054: spo = 5'h1b;
            055: spo = 5'h1c;
            056: spo = 5'h1d;
            057: spo = 5'h1e;
            058: spo = 5'h1e;
            059: spo = 5'h1f;
            060: spo = 5'h0;
            061: spo = 5'h1;
            062: spo = 5'h1;
            063: spo = 5'h2;
            064: spo = 5'h17;
            065: spo = 5'h18;
            066: spo = 5'h19;
            067: spo = 5'h1a;
            068: spo = 5'h1a;
            069: spo = 5'h1b;
            070: spo = 5'h1c;
            071: spo = 5'h1d;
            072: spo = 5'h1d;
            073: spo = 5'h1e;
            074: spo = 5'h1f;
            075: spo = 5'h0;
            076: spo = 5'h0;
            077: spo = 5'h1;
            078: spo = 5'h2;
            079: spo = 5'h3;
            080: spo = 5'h18;
            081: spo = 5'h19;
            082: spo = 5'h19;
            083: spo = 5'h1a;
            084: spo = 5'h1b;
            085: spo = 5'h1c;
            086: spo = 5'h1d;
            087: spo = 5'h1d;
            088: spo = 5'h1e;
            089: spo = 5'h1f;
            090: spo = 5'h0;
            091: spo = 5'h0;
            092: spo = 5'h1;
            093: spo = 5'h2;
            094: spo = 5'h3;
            095: spo = 5'h3;
            096: spo = 5'h19;
            097: spo = 5'h19;
            098: spo = 5'h1a;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1c;
            102: spo = 5'h1d;
            103: spo = 5'h1e;
            104: spo = 5'h1f;
            105: spo = 5'h1f;
            106: spo = 5'h0;
            107: spo = 5'h1;
            108: spo = 5'h2;
            109: spo = 5'h3;
            110: spo = 5'h3;
            111: spo = 5'h4;
            112: spo = 5'h19;
            113: spo = 5'h1a;
            114: spo = 5'h1b;
            115: spo = 5'h1c;
            116: spo = 5'h1c;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h0;
            122: spo = 5'h1;
            123: spo = 5'h2;
            124: spo = 5'h2;
            125: spo = 5'h3;
            126: spo = 5'h4;
            127: spo = 5'h5;
            128: spo = 5'h1a;
            129: spo = 5'h1b;
            130: spo = 5'h1b;
            131: spo = 5'h1c;
            132: spo = 5'h1d;
            133: spo = 5'h1e;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h2;
            140: spo = 5'h3;
            141: spo = 5'h4;
            142: spo = 5'h5;
            143: spo = 5'h5;
            144: spo = 5'h1b;
            145: spo = 5'h1b;
            146: spo = 5'h1c;
            147: spo = 5'h1d;
            148: spo = 5'h1e;
            149: spo = 5'h1e;
            150: spo = 5'h1f;
            151: spo = 5'h0;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h4;
            157: spo = 5'h4;
            158: spo = 5'h5;
            159: spo = 5'h6;
            160: spo = 5'h1b;
            161: spo = 5'h1c;
            162: spo = 5'h1d;
            163: spo = 5'h1d;
            164: spo = 5'h1e;
            165: spo = 5'h1f;
            166: spo = 5'h0;
            167: spo = 5'h1;
            168: spo = 5'h1;
            169: spo = 5'h2;
            170: spo = 5'h3;
            171: spo = 5'h4;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h6;
            175: spo = 5'h7;
            176: spo = 5'h1c;
            177: spo = 5'h1d;
            178: spo = 5'h1d;
            179: spo = 5'h1e;
            180: spo = 5'h1f;
            181: spo = 5'h0;
            182: spo = 5'h0;
            183: spo = 5'h1;
            184: spo = 5'h2;
            185: spo = 5'h3;
            186: spo = 5'h3;
            187: spo = 5'h4;
            188: spo = 5'h5;
            189: spo = 5'h6;
            190: spo = 5'h7;
            191: spo = 5'h7;
            192: spo = 5'h1c;
            193: spo = 5'h1d;
            194: spo = 5'h1e;
            195: spo = 5'h1f;
            196: spo = 5'h0;
            197: spo = 5'h0;
            198: spo = 5'h1;
            199: spo = 5'h2;
            200: spo = 5'h3;
            201: spo = 5'h3;
            202: spo = 5'h4;
            203: spo = 5'h5;
            204: spo = 5'h6;
            205: spo = 5'h6;
            206: spo = 5'h7;
            207: spo = 5'h8;
            208: spo = 5'h1d;
            209: spo = 5'h1e;
            210: spo = 5'h1f;
            211: spo = 5'h1f;
            212: spo = 5'h0;
            213: spo = 5'h1;
            214: spo = 5'h2;
            215: spo = 5'h2;
            216: spo = 5'h3;
            217: spo = 5'h4;
            218: spo = 5'h5;
            219: spo = 5'h6;
            220: spo = 5'h6;
            221: spo = 5'h7;
            222: spo = 5'h8;
            223: spo = 5'h9;
            224: spo = 5'h1e;
            225: spo = 5'h1e;
            226: spo = 5'h1f;
            227: spo = 5'h0;
            228: spo = 5'h1;
            229: spo = 5'h2;
            230: spo = 5'h2;
            231: spo = 5'h3;
            232: spo = 5'h4;
            233: spo = 5'h5;
            234: spo = 5'h5;
            235: spo = 5'h6;
            236: spo = 5'h7;
            237: spo = 5'h8;
            238: spo = 5'h8;
            239: spo = 5'h9;
            240: spo = 5'h1e;
            241: spo = 5'h1f;
            242: spo = 5'h0;
            243: spo = 5'h1;
            244: spo = 5'h1;
            245: spo = 5'h2;
            246: spo = 5'h3;
            247: spo = 5'h4;
            248: spo = 5'h4;
            249: spo = 5'h5;
            250: spo = 5'h6;
            251: spo = 5'h7;
            252: spo = 5'h8;
            253: spo = 5'h8;
            254: spo = 5'h9;
            255: spo = 5'ha;
            default: spo = 5'h0;
		endcase
	end
endmodule